import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/layer/tile
import openlayers/proj
import openlayers/source/osm
import openlayers/source/tileJSON
import openlayers/view

import olExampleHelpers

let key =
  "pk.eyJ1IjoiYWhvY2V2YXIiLCJhIjoiY2t0cGdwMHVnMGdlbzMxbDhwazBic2xrNSJ9.WbcTL9uj8JPAsnT9mgb7oQ"

var initialized = false

proc createDom(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Semi-Transparent Layer"
    tdiv(id = "map", class = "map")

proc initExample() =
  if initialized:
    return
  initialized = true

  let bwLayerOptions = newJsObject()
  bwLayerOptions["className"] = "bw".cstring
  bwLayerOptions["source"] = newOSM()
  let bwLayer = newTileLayer(bwLayerOptions)

  let tileJsonOptions = newJsObject()
  tileJsonOptions["url"] = cstring(
    "https://api.tiles.mapbox.com/v4/mapbox.va-quake-aug.json?secure&access_token=" & key
  )
  tileJsonOptions["crossOrigin"] = "anonymous".cstring
  tileJsonOptions["transition"] = 0.0
  let quakeSource = newTileJSON(tileJsonOptions)

  let quakeLayerOptions = newJsObject()
  quakeLayerOptions["source"] = quakeSource
  let quakeLayer = newTileLayer(quakeLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = fromLonLat(jsArray2(-77.93255, 37.9555))
  viewOptions["zoom"] = 7.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[bwLayer, quakeLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView

  discard newMapWithOptions(mapOptions)

discard setRenderer(createDom, "ROOT", initExample)
