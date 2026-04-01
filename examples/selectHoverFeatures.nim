import jsffi
import karax/[karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/interaction/select
import openlayers/map
import openlayers/layer/vector
import openlayers/source/vector
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var initialized = false
var mapObj: JsObject = jsUndefined

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Select Features by Hover"
    tdiv(id = "map", class = "map map-with-controls")
    span(id = "status"):
      text "\u00A0"

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let baseFillOptions = newFillOptions()
  baseFillOptions.color = "#eeeeee".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStyleOptions = newStyleOptions()
  baseStyleOptions.fill = baseFill
  let baseStyle = newStyle(baseStyleOptions)

  let vectorSourceOptions = newVectorSourceOptions()
  vectorSourceOptions.url = "https://openlayers.org/data/vector/ecoregions.json".cstring
  vectorSourceOptions.format = newGeoJSON()
  let vectorSource = newVectorSource(vectorSourceOptions)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.background = "white".cstring
  vectorLayerOptions.style =
    makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  let selectedFillOptions = newFillOptions()
  selectedFillOptions.color = "#eeeeee".cstring
  let selectedFill = newFill(selectedFillOptions)

  let selectedStrokeOptions = newStrokeOptions()
  selectedStrokeOptions.color = "rgba(255, 255, 255, 0.7)".cstring
  selectedStrokeOptions.width = 2.0
  let selectedStroke = newStroke(selectedStrokeOptions)

  let selectedStyleOptions = newStyleOptions()
  selectedStyleOptions.fill = selectedFill
  selectedStyleOptions.stroke = selectedStroke
  let selectedStyle = newStyle(selectedStyleOptions)

  let selectOptions = newSelectOptions()
  selectOptions.condition = getPointerMoveConditionFn()
  selectOptions.style =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))
  let selectInteraction = newSelect(selectOptions)

  addInteraction(mapObj, cast[JsObject](selectInteraction))
  installSelectHoverStatus(cast[JsObject](selectInteraction))

  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
