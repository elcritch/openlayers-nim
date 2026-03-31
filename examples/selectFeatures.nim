import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/interaction/select
import openlayers/layer/vector
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

var initialized = false

proc createDom(): VNode =
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

proc initExample() =
  if initialized:
    return
  initialized = true

  let baseFillOptions = newJsObject()
  baseFillOptions["color"] = "#eeeeee".cstring
  let baseFill = newOlFill(baseFillOptions)

  let baseStyleOptions = newJsObject()
  baseStyleOptions["fill"] = baseFill
  let baseStyle = newOlStyle(baseStyleOptions)

  let vectorSourceOptions = newJsObject()
  vectorSourceOptions["url"] =
    "https://openlayers.org/data/vector/ecoregions.json".cstring
  vectorSourceOptions["format"] = newOlGeoJSON()
  let vectorSource = newVectorSourceWithOptions(vectorSourceOptions)

  let vectorLayerOptions = newJsObject()
  vectorLayerOptions["source"] = vectorSource
  vectorLayerOptions["background"] = "white".cstring
  vectorLayerOptions["style"] =
    makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
  let vectorLayer = newOlVectorLayer(vectorLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 2.0
  let mapView = newOlView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[vectorLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  let selectedFillOptions = newJsObject()
  selectedFillOptions["color"] = "#eeeeee".cstring
  let selectedFill = newOlFill(selectedFillOptions)

  let selectedStrokeOptions = newJsObject()
  selectedStrokeOptions["color"] = "rgba(255, 255, 255, 0.7)".cstring
  selectedStrokeOptions["width"] = 2.0
  let selectedStroke = newOlStroke(selectedStrokeOptions)

  let selectedStyleOptions = newJsObject()
  selectedStyleOptions["fill"] = selectedFill
  selectedStyleOptions["stroke"] = selectedStroke
  let selectedStyle = newOlStyle(selectedStyleOptions)
  let selectStyleFn =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))

  let selectSingleClickOptions = newJsObject()
  selectSingleClickOptions["style"] = selectStyleFn
  let selectSingleClick = newOlSelect(selectSingleClickOptions)

  let selectClickOptions = newJsObject()
  selectClickOptions["condition"] = getClickConditionFn()
  selectClickOptions["style"] = selectStyleFn
  let selectClick = newOlSelect(selectClickOptions)

  let selectPointerMoveOptions = newJsObject()
  selectPointerMoveOptions["condition"] = getPointerMoveConditionFn()
  selectPointerMoveOptions["toggleCondition"] = getNeverConditionFn()
  selectPointerMoveOptions["style"] = selectStyleFn
  let selectPointerMove = newOlSelect(selectPointerMoveOptions)

  let selectAltClickOptions = newJsObject()
  selectAltClickOptions["style"] = selectStyleFn
  selectAltClickOptions["condition"] =
    makeAltClickConditionFn(getClickConditionFn(), getAltKeyOnlyConditionFn())
  let selectAltClick = newOlSelect(selectAltClickOptions)

  installSelectTypeController(
    mapObj,
    cast[JsObject](selectSingleClick),
    cast[JsObject](selectClick),
    cast[JsObject](selectPointerMove),
    cast[JsObject](selectAltClick),
  )

discard setRenderer(createDom, "ROOT", initExample)
