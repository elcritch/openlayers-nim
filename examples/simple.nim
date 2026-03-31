import jsffi
import openlayers/layer/tile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

let layerOptions = newJsObject()
layerOptions["source"] = newOlOSM()
let baseLayer = newOlTileLayer(layerOptions)

let viewOptions = newJsObject()
viewOptions["center"] = @[0.0, 0.0]
viewOptions["zoom"] = 2.0
let mapView = newOlView(viewOptions)

let mapOptions = newJsObject()
mapOptions["layers"] = @[baseLayer]
mapOptions["target"] = "map"
mapOptions["view"] = mapView

discard newMapWithOptions(mapOptions)
