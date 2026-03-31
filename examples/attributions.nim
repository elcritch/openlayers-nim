import jsffi
import openlayers/control/attribution
import openlayers/control/defaults
import openlayers/layer/tile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

let attributionOptions = newJsObject()
attributionOptions["collapsible"] = false
let attributionControl = newOlAttribution(attributionOptions)

let controlsOptions = newJsObject()
controlsOptions["attribution"] = false
let controlsWithAttribution = extendCollection(
  defaults(controlsOptions), jsArray1(cast[JsObject](attributionControl))
)

let layerOptions = newJsObject()
layerOptions["source"] = newOlOSM()
let baseLayer = newOlTileLayer(layerOptions)

let viewOptions = newJsObject()
viewOptions["center"] = @[0.0, 0.0]
viewOptions["zoom"] = 2.0
let mapView = newOlView(viewOptions)

let mapOptions = newJsObject()
mapOptions["layers"] = @[baseLayer]
mapOptions["controls"] = controlsWithAttribution
mapOptions["target"] = "map"
mapOptions["view"] = mapView
let mapObj = newMapWithOptions(mapOptions)

installAttributionResizeBehavior(
  mapObj, cast[JsObject](attributionControl), cast[JsObject](attributionControl), mapObj
)
