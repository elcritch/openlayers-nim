import jsffi
import dom
import karax/[karax, karaxdsl, vdom]
import openlayers/interaction/draw
import openlayers/map
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/osm
import openlayers/source/vector
import openlayers/view

import olExampleHelpers

var
  initialized = false
  mapObj: JsObject = jsUndefined
  drawSourceObj: JsObject = jsUndefined
  drawInteraction: Draw = nil

proc readElementValue(el: Element): cstring =
  cast[InputElement](el).value

proc clearInteraction() =
  if drawInteraction != nil and isTruthy(mapObj):
    removeInteraction(mapObj, cast[JsObject](drawInteraction))
  drawInteraction = nil

proc updateInteraction() =
  clearInteraction()
  let typeSelect = dom.getElementById("draw-type".cstring)
  if typeSelect.isNil:
    return

  let geometryType = readElementValue(typeSelect)
  if geometryType == "None".cstring:
    return

  let drawOptions = newDrawOptions()
  drawOptions.source = drawSourceObj
  drawOptions.typeVal = geometryType
  drawInteraction = newDraw(drawOptions)
  addInteraction(mapObj, cast[JsObject](drawInteraction))

proc onTypeChange(event: Event) =
  updateInteraction()

proc onUndo(event: Event) =
  if drawInteraction != nil:
    drawInteraction.removeLastPoint()

proc installControls() =
  let typeSelect = dom.getElementById("draw-type".cstring)
  if not typeSelect.isNil:
    typeSelect.onchange = onTypeChange

  let undoButton = dom.getElementById("undo".cstring)
  if not undoButton.isNil:
    undoButton.onclick = onUndo

  updateInteraction()

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Draw Features"
    tdiv(id = "map", class = "map map-with-controls")
    form(class = "example-controls"):
      label(`for` = "draw-type"):
        text "Geometry type:"
      select(id = "draw-type"):
        option(value = "Point"):
          text "Point"
        option(value = "LineString"):
          text "LineString"
        option(value = "Polygon"):
          text "Polygon"
        option(value = "Circle"):
          text "Circle"
        option(value = "None"):
          text "None"
      input(id = "undo", `type` = "button", value = "Undo")

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let rasterOptions = newTileLayerOptions()
  rasterOptions.source = newOSM()
  let rasterLayer = newTileLayer(rasterOptions)

  let drawSourceOptions = newVectorSourceOptions()
  drawSourceOptions.wrapX = false
  let drawSource = newVectorSource(drawSourceOptions)
  drawSourceObj = cast[JsObject](drawSource)

  let drawLayerOptions = newVectorLayerOptions()
  drawLayerOptions.source = drawSource
  let drawLayer = newVectorLayer(drawLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(-11000000.0, 4600000.0)
  viewOptions.zoom = 4.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, drawLayer]
  mapOptions.target = olExampleHelpers.getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  installControls()
  result = mapObj

proc cleanupExample*() =
  clearInteraction()
  initialized = false
  mapObj = jsUndefined
  drawSourceObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
