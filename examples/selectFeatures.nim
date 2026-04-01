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
      text "Select Features"
    tdiv(id = "map", class = "map map-with-controls")
    form:
      label(`for` = "type"):
        text "Action type "
      select(id = "type"):
        option(value = "click", selected = "selected"):
          text "Click"
        option(value = "singleclick"):
          text "Single-click"
        option(value = "pointermove"):
          text "Hover"
        option(value = "altclick"):
          text "Alt+Click"
        option(value = "none"):
          text "None"
      text " "
      span(id = "status"):
        text "\u00A00 selected features"

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
  let selectStyleFn =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))

  let selectSingleClickOptions = newSelectOptions()
  selectSingleClickOptions.style = selectStyleFn
  let selectSingleClick = newSelect(selectSingleClickOptions)

  let selectClickOptions = newSelectOptions()
  selectClickOptions.condition = getClickConditionFn()
  selectClickOptions.style = selectStyleFn
  let selectClick = newSelect(selectClickOptions)

  let selectPointerMoveOptions = newSelectOptions()
  selectPointerMoveOptions.condition = getPointerMoveConditionFn()
  selectPointerMoveOptions.toggleCondition = getNeverConditionFn()
  selectPointerMoveOptions.style = selectStyleFn
  let selectPointerMove = newSelect(selectPointerMoveOptions)

  let selectAltClickOptions = newSelectOptions()
  selectAltClickOptions.style = selectStyleFn
  selectAltClickOptions.condition =
    makeAltClickConditionFn(getClickConditionFn(), getAltKeyOnlyConditionFn())
  let selectAltClick = newSelect(selectAltClickOptions)

  installSelectTypeController(
    mapObj,
    cast[JsObject](selectSingleClick),
    cast[JsObject](selectClick),
    cast[JsObject](selectPointerMove),
    cast[JsObject](selectAltClick),
  )

  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
