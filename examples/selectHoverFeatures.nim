import jsffi
import openlayers/format/geoJSON
import openlayers/interaction/select
import openlayers/layer/vector
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

let baseFillOptions = newJsObject()
baseFillOptions["color"] = "#eeeeee"
let baseFill = newOlFill(baseFillOptions)

let baseStyleOptions = newJsObject()
baseStyleOptions["fill"] = baseFill
let baseStyle = newOlStyle(baseStyleOptions)

let vectorSourceOptions = newJsObject()
vectorSourceOptions["url"] = "https://openlayers.org/data/vector/ecoregions.json"
vectorSourceOptions["format"] = newOlGeoJSON()
let vectorSource = newVectorSourceWithOptions(vectorSourceOptions)

let vectorLayerOptions = newJsObject()
vectorLayerOptions["source"] = vectorSource
vectorLayerOptions["background"] = "white"
vectorLayerOptions["style"] =
  makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
let vectorLayer = newOlVectorLayer(vectorLayerOptions)

let viewOptions = newJsObject()
viewOptions["center"] = @[0.0, 0.0]
viewOptions["zoom"] = 2.0
let mapView = newOlView(viewOptions)

let mapOptions = newJsObject()
mapOptions["layers"] = @[vectorLayer]
mapOptions["target"] = "map"
mapOptions["view"] = mapView
let mapObj = newMapWithOptions(mapOptions)

let selectedFillOptions = newJsObject()
selectedFillOptions["color"] = "#eeeeee"
let selectedFill = newOlFill(selectedFillOptions)

let selectedStrokeOptions = newJsObject()
selectedStrokeOptions["color"] = "rgba(255, 255, 255, 0.7)"
selectedStrokeOptions["width"] = 2.0
let selectedStroke = newOlStroke(selectedStrokeOptions)

let selectedStyleOptions = newJsObject()
selectedStyleOptions["fill"] = selectedFill
selectedStyleOptions["stroke"] = selectedStroke
let selectedStyle = newOlStyle(selectedStyleOptions)

let selectOptions = newJsObject()
selectOptions["condition"] = getPointerMoveConditionFn()
selectOptions["style"] =
  makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))
let selectInteraction = newOlSelect(selectOptions)

addInteraction(mapObj, cast[JsObject](selectInteraction))
installSelectHoverStatus(cast[JsObject](selectInteraction))
