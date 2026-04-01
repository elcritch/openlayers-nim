import jsffi
import karax/[karaxdsl, vdom]
import openlayers/feature
import openlayers/geom/point
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/map
import openlayers/proj
import openlayers/source/osm
import openlayers/source/vector
import openlayers/style/icon
import openlayers/style/style
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var
  initialized = false
  mapObj: JsObject = jsUndefined

proc makeIconFeature(
    source: VectorSource, lon: float, lat: float, iconStyle: Style
): Feature =
  let feature = newFeature()
  let point = newPoint(fromLonLat(@[lon, lat]))
  feature.setGeometry(point)
  feature.setStyle(iconStyle)
  source.addFeature(feature)
  result = feature

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Icon Symbolizer"
    tdiv(id = "map", class = "map")

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let rasterOptions = newTileLayerOptions()
  rasterOptions.source = newOSM()
  let rasterLayer = newTileLayer(rasterOptions)

  let iconOptions = newIconOptions()
  iconOptions.anchor = @[0.5, 1.0]
  iconOptions.crossOrigin = "anonymous".cstring
  iconOptions.src = "/deps/openlayers/examples/data/icon.png".cstring
  iconOptions.scale = 0.7
  let icon = newIcon(iconOptions)

  let iconStyleOptions = newStyleOptions()
  iconStyleOptions.image = icon
  let iconStyle = newStyle(iconStyleOptions)

  let vectorSource = newVectorSource()
  discard makeIconFeature(vectorSource, -0.1276, 51.5072, iconStyle)
  discard makeIconFeature(vectorSource, 2.3522, 48.8566, iconStyle)
  discard makeIconFeature(vectorSource, 13.4050, 52.5200, iconStyle)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = fromLonLat(@[6.0, 50.5])
  viewOptions.zoom = 4.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))
  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
