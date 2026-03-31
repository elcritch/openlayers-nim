import jsffi
import openlayers/layer/tile
import openlayers/proj
import openlayers/source/osm
import openlayers/source/tileJSON
import openlayers/view

import olExampleHelpers

let key =
  "pk.eyJ1IjoiYWhvY2V2YXIiLCJhIjoiY2t0cGdwMHVnMGdlbzMxbDhwazBic2xrNSJ9.WbcTL9uj8JPAsnT9mgb7oQ"

let bwLayerOptions = newJsObject()
bwLayerOptions["className"] = "bw"
bwLayerOptions["source"] = newOlOSM()
let bwLayer = newOlTileLayer(bwLayerOptions)

let tileJsonOptions = newJsObject()
tileJsonOptions["url"] =
  "https://api.tiles.mapbox.com/v4/mapbox.va-quake-aug.json?secure&access_token=" & key
tileJsonOptions["crossOrigin"] = "anonymous"
tileJsonOptions["transition"] = 0.0
let quakeSource = newOlTileJSON(tileJsonOptions)

let quakeLayerOptions = newJsObject()
quakeLayerOptions["source"] = quakeSource
let quakeLayer = newOlTileLayer(quakeLayerOptions)

let viewOptions = newJsObject()
viewOptions["center"] = fromLonLat(jsArray2(-77.93255, 37.9555))
viewOptions["zoom"] = 7.0
let mapView = newOlView(viewOptions)

let mapOptions = newJsObject()
mapOptions["layers"] = @[bwLayer, quakeLayer]
mapOptions["target"] = "map"
mapOptions["view"] = mapView

discard newMapWithOptions(mapOptions)
