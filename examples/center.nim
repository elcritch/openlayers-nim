import jsffi
import openlayers/format/geoJSON
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

let sourceOptions = newJsObject()
sourceOptions["url"] = "data/geojson/switzerland.geojson"
sourceOptions["format"] = newOlGeoJSON()
let vectorSource = newVectorSourceWithOptions(sourceOptions)

let styleOptions = newJsObject()
styleOptions["fill-color"] = "rgba(255, 255, 255, 0.6)"
styleOptions["stroke-width"] = 1.0
styleOptions["stroke-color"] = "#319FD3"
styleOptions["circle-radius"] = 5.0
styleOptions["circle-fill-color"] = "rgba(255, 255, 255, 0.6)"
styleOptions["circle-stroke-width"] = 1.0
styleOptions["circle-stroke-color"] = "#319FD3"

let vectorLayerOptions = newJsObject()
vectorLayerOptions["source"] = vectorSource
vectorLayerOptions["style"] = styleOptions
let vectorLayer = newOlVectorLayer(vectorLayerOptions)

let baseLayerOptions = newJsObject()
baseLayerOptions["source"] = newOlOSM()
let baseLayer = newOlTileLayer(baseLayerOptions)

let viewOptions = newJsObject()
viewOptions["center"] = @[0.0, 0.0]
viewOptions["zoom"] = 1.0
let mapView = newOlView(viewOptions)

let mapOptions = newJsObject()
mapOptions["layers"] = @[baseLayer, vectorLayer]
mapOptions["target"] = "map"
mapOptions["view"] = mapView

discard newMapWithOptions(mapOptions)
