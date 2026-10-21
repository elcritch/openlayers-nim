import openlayers/[feature, properties, proj]
import openlayers/geom/[point, multiPolygon, geometry]
import openlayers/source/[vector, image]
import openlayers/layer/[image, operations]
import openlayers/style/[style, circle, text]
import openlayers/render/event

import std/[jsffi, unittest]

suite "typed map runtime bindings":
  test "static bitmap loaders retain source images across view changes":
    let bitmap = cast[RootRef](newJsObject())
    let frame = newImageObject(bitmap, @[0.0, 0.0, 10.0, 10.0], @[1.0, 1.0])
    let options = newImageSourceOptions()
    options.projection = "EPSG:4326"
    options.interpolate = false
    options.loader = proc(): ImageObject =
      frame
    let source = newImageSource(options)
    source.setProperty("rasterSize", @[10, 10])
    check property(source, "rasterSize", seq[int]) == @[10, 10]
    let projection = proj.get(cstring"EPSG:4326".toJs)
    let first = source.getImage(@[0.0, 0.0, 5.0, 5.0].toJs, 1, 1, projection)
    let second = source.getImage(@[2.0, 2.0, 8.0, 8.0].toJs, 2, 2, projection)
    check first == second
    let loaded = cast[JsObject](options).loader()
    check loaded.image == cast[JsObject](bitmap)
    check loaded.extent.to(seq[float]) == @[0.0, 0.0, 10.0, 10.0]
    check loaded.resolution.to(seq[float]) == @[1.0, 1.0]
    check loaded.pixelRatio.to(float) == 1.0

  test "features retain identity, geometry, custom properties and styles":
    let source = newVectorSource()
    let feature = newFeature()
    feature.setId("reading-1")
    check feature.getId().to(cstring) == "reading-1"
    feature.setGeometry(newPoint(@[12.0, 34.0]))
    feature.setProperty("selected", true)
    var propertyChanges = 0
    cast[JsObject](feature).on(
      cstring"propertychange",
      proc() =
        propertyChanges.inc(),
    )
    feature.setProperties(js{popupHtml: cstring"details"}, silent = true)
    check propertyChanges == 0
    check property(feature, "popupHtml", cstring) == "details"
    feature.setProperties(js{popupHtml: cstring"updated"})
    check propertyChanges == 1
    let options = newStyleOptions()
    options.zIndex = 12
    let marker = newStyle(options)
    feature.setStyle(@[marker])
    source.addFeature(feature)
    check source.features().len == 1
    check source.getFeatureById("reading-1") == feature
    check feature.geometry().getType() == "Point"
    check cast[Point](feature.geometry()).coordinates() == @[12.0, 34.0]
    check property(feature, "selected", bool)
    check source.getExtent() == @[12.0, 34.0, 12.0, 34.0]
    source.removeFeature(feature)
    check source.features().len == 0

  test "multipart geometry preserves holes and normalizes ring winding":
    let shell = @[@[0.0, 0.0], @[10.0, 0.0], @[10.0, 10.0], @[0.0, 0.0]]
    let hole = @[@[1.0, 1.0], @[2.0, 1.0], @[2.0, 2.0], @[1.0, 1.0]]
    let geometry = newMultiPolygon(@[@[shell, hole], @[shell]])
    let polygons = geometry.getCoordinates(true)
    check polygons.len == 2
    check polygons[0].len == 2
    check polygons[0][0] == shell
    check polygons[0][1] == @[hole[3], hole[2], hole[1], hole[0]]
    check polygons[1][0] == shell

  test "image layers expose typed options and render callbacks":
    let options = newImageLayerOptions()
    options.className = "coverage"
    options.opacity = 0.55
    options.visible = false
    let layer = newImageLayer(options)
    check layer.getSource().isNil
    layer.setVisible(true)
    layer.setOpacity(0.8)
    layer.setExtent(@[0.0, 0.0, 10.0, 10.0])
    layer.clearExtent()
    layer.setSource(nil)
    layer.changed()
    var transform: seq[float]
    let context = newJsObject()
    discard layer.on(
      "prerender",
      proc(event: RenderEvent) =
        check event.context(JsObject) == context
        transform = event.inversePixelTransform(),
    )
    cast[JsObject](layer).dispatchEvent(
      js{
        `type`: cstring"prerender",
        context: context,
        inversePixelTransform: @[1.0, 0.0, 0.0, 1.0, 0.0, 0.0],
      }
    )
    check transform == @[1.0, 0.0, 0.0, 1.0, 0.0, 0.0]
    check cast[JsObject](layer).getVisible().to(bool)
    check cast[JsObject](layer).getOpacity().to(float) == 0.8

  test "typed style options preserve enum strings":
    let circleOptions = newCircleStyleOptions()
    circleOptions.radius = 6
    circleOptions.declutterMode = "none"
    let markerOptions = newStyleOptions()
    markerOptions.image = newCircleStyle(circleOptions)
    let textOptions = newTextOptions()
    textOptions.text = "42 ppm"
    textOptions.textAlign = "left"
    markerOptions.text = newText(textOptions)
    let marker = newStyle(markerOptions)
    check marker.getImage().getDeclutterMode().to(cstring) == "none"
    check marker.getText().getText().to(cstring) == "42 ppm"
    check marker.getText().getTextAlign().to(cstring) == "left"

  test "class namespaces preserve named exports in both loading modes":
    let editing = createEditingStyle()
    check editing.hasOwnProperty(cstring"Polygon")
    let marker = newStyle()
    let styleFunction = createStyleFunction(cast[JsObject](marker))
    check styleFunction.call(jsUndefined).to(seq[Style]) == @[marker]
