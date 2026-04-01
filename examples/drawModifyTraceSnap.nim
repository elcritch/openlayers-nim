import jsffi
import dom
import karax/[karax, karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/interaction/draw
import openlayers/interaction/modify
import openlayers/interaction/snap
import openlayers/map
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/imageTile
import openlayers/source/vector
import openlayers/style/fill
import openlayers/style/circle
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

let mapTilerKey = "get_your_own_D6rA4zTHduk6KOKTXzGB"

var
  initialized = false
  mapObj: JsObject = jsUndefined
  baseSourceObj: JsObject = jsUndefined
  drawSourceObj: JsObject = jsUndefined
  drawStyleObj: JsObject = jsUndefined
  drawInteraction: Draw = nil
  modifyInteraction: Modify = nil
  snapInteraction: Snap = nil

proc readElementValue(el: Element): cstring =
  cast[InputElement](el).value

proc writeElementValue(el: Element, value: cstring) =
  cast[InputElement](el).value = value

proc onceDrawEnd(drawInteraction: Draw, cb: proc()) =
  discard drawInteraction.once(
    "drawend".cstring,
    proc(event: JsObject) =
      cb(),
  )

proc removeInteractions() =
  if isTruthy(mapObj):
    if drawInteraction != nil:
      removeInteraction(mapObj, cast[JsObject](drawInteraction))
    if modifyInteraction != nil:
      removeInteraction(mapObj, cast[JsObject](modifyInteraction))
    if snapInteraction != nil:
      removeInteraction(mapObj, cast[JsObject](snapInteraction))
  drawInteraction = nil
  modifyInteraction = nil
  snapInteraction = nil

proc changeMode()

proc installInteractions() =
  let typeSelect = dom.getElementById("trace-type".cstring)
  if typeSelect.isNil:
    return

  let modifyOptions = newModifyOptions()
  modifyOptions.source = drawSourceObj
  modifyOptions.trace = true
  modifyOptions.traceSource = baseSourceObj
  modifyInteraction = newModify(modifyOptions)
  addInteraction(mapObj, cast[JsObject](modifyInteraction))

  let value = readElementValue(typeSelect)
  if value != "None".cstring:
    let drawOptions = newDrawOptions()
    drawOptions.typeVal = value
    drawOptions.source = drawSourceObj
    drawOptions.trace = true
    drawOptions.traceSource = baseSourceObj
    drawOptions.style = drawStyleObj
    drawInteraction = newDraw(drawOptions)
    onceDrawEnd(
      drawInteraction,
      proc() =
        let selectEl = dom.getElementById("trace-type".cstring)
        if not selectEl.isNil:
          writeElementValue(selectEl, "None".cstring)
        discard setTimeout(changeMode, 0),
    )
    addInteraction(mapObj, cast[JsObject](drawInteraction))

  let snapOptions = newSnapOptions()
  snapOptions.source = baseSourceObj
  snapInteraction = newSnap(snapOptions)
  addInteraction(mapObj, cast[JsObject](snapInteraction))

proc changeMode() =
  removeInteractions()
  installInteractions()

proc onTypeChange(event: Event) =
  changeMode()

proc installControls() =
  let typeSelect = dom.getElementById("trace-type".cstring)
  if not typeSelect.isNil:
    typeSelect.onchange = onTypeChange
  changeMode()

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Draw, Modify, Trace and Snap"
    tdiv(id = "map", class = "map map-with-controls")
    form(class = "example-controls"):
      label(`for` = "trace-type"):
        text "Draw geometry mode"
      select(id = "trace-type"):
        option(value = "Polygon"):
          text "Polygon"
        option(value = "LineString"):
          text "LineString"
        option(value = "None"):
          text "Modify only"

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let rasterSourceOptions = newImageTileSourceOptions()
  rasterSourceOptions.url = cstring(
    "https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & mapTilerKey
  )
  rasterSourceOptions.maxZoom = 20.0
  let rasterSource = newImageTileSource(rasterSourceOptions)

  let rasterLayerOptions = newTileLayerOptions()
  rasterLayerOptions.source = rasterSource
  let rasterLayer = newTileLayer(rasterLayerOptions)

  let baseSourceOptions = newVectorSourceOptions()
  baseSourceOptions.format = newGeoJSON()
  baseSourceOptions.url = "/deps/openlayers/examples/data/geojson/fire.json".cstring
  let baseVectorSource = newVectorSource(baseSourceOptions)
  baseSourceObj = cast[JsObject](baseVectorSource)

  let baseFillOptions = newFillOptions()
  baseFillOptions.color = "rgba(255, 0, 0, 0.3)".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStrokeOptions = newStrokeOptions()
  baseStrokeOptions.color = "rgba(255, 0, 0, 0.9)".cstring
  baseStrokeOptions.width = 0.5
  let baseStroke = newStroke(baseStrokeOptions)

  let baseStyleOptions = newStyleOptions()
  baseStyleOptions.fill = baseFill
  baseStyleOptions.stroke = baseStroke
  let baseStyle = newStyle(baseStyleOptions)

  let baseLayerOptions = newVectorLayerOptions()
  baseLayerOptions.source = baseVectorSource
  baseLayerOptions.style = baseStyle
  let baseVectorLayer = newVectorLayer(baseLayerOptions)

  let drawVectorSource = newVectorSource()
  drawSourceObj = cast[JsObject](drawVectorSource)

  let drawFillOptions = newFillOptions()
  drawFillOptions.color = "rgba(100, 255, 0, 0.3)".cstring
  let drawFill = newFill(drawFillOptions)

  let drawStrokeOptions = newStrokeOptions()
  drawStrokeOptions.color = "rgba(100, 255, 0, 1)".cstring
  drawStrokeOptions.width = 2.0
  let drawStroke = newStroke(drawStrokeOptions)

  let drawCircleFillOptions = newFillOptions()
  drawCircleFillOptions.color = "rgba(100, 255, 0, 0.5)".cstring
  let drawCircleFill = newFill(drawCircleFillOptions)

  let drawCircleOptions = newCircleStyleOptions()
  drawCircleOptions.radius = 6.0
  drawCircleOptions.fill = drawCircleFill
  let drawCircle = newCircleStyle(drawCircleOptions)

  let drawStyleOptions = newStyleOptions()
  drawStyleOptions.stroke = drawStroke
  drawStyleOptions.fill = drawFill
  drawStyleOptions.image = drawCircle
  let drawStyle = newStyle(drawStyleOptions)

  let drawLayerOptions = newVectorLayerOptions()
  drawLayerOptions.source = drawVectorSource
  drawLayerOptions.style = drawStyle
  let drawVectorLayer = newVectorLayer(drawLayerOptions)

  let drawInteractionFillOptions = newFillOptions()
  drawInteractionFillOptions.color = "rgba(255, 255, 100, 0.25)".cstring
  let drawInteractionFill = newFill(drawInteractionFillOptions)

  let drawInteractionStrokeOptions = newStrokeOptions()
  drawInteractionStrokeOptions.color = "rgba(255, 255, 100, 0.5)".cstring
  drawInteractionStrokeOptions.width = 1.5
  let drawInteractionStroke = newStroke(drawInteractionStrokeOptions)

  let drawInteractionCircleFillOptions = newFillOptions()
  drawInteractionCircleFillOptions.color = "rgba(255, 255, 100, 0.5)".cstring
  let drawInteractionCircleFill = newFill(drawInteractionCircleFillOptions)

  let drawInteractionCircleOptions = newCircleStyleOptions()
  drawInteractionCircleOptions.radius = 6.0
  drawInteractionCircleOptions.fill = drawInteractionCircleFill
  let drawInteractionCircle = newCircleStyle(drawInteractionCircleOptions)

  let drawInteractionStyleOptions = newStyleOptions()
  drawInteractionStyleOptions.stroke = drawInteractionStroke
  drawInteractionStyleOptions.fill = drawInteractionFill
  drawInteractionStyleOptions.image = drawInteractionCircle
  let drawInteractionStyle = newStyle(drawInteractionStyleOptions)
  drawStyleObj = cast[JsObject](drawInteractionStyle)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(-13378949.0, 5943751.0)
  viewOptions.zoom = 11.0
  viewOptions.maxZoom = 23.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, baseVectorLayer, drawVectorLayer]
  mapOptions.target = olExampleHelpers.getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  installControls()
  result = mapObj

proc cleanupExample*() =
  removeInteractions()
  initialized = false
  mapObj = jsUndefined
  baseSourceObj = jsUndefined
  drawSourceObj = jsUndefined
  drawStyleObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
