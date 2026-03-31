import jsffi
import openlayers/layer/webGLTile
import openlayers/source/imageTile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

let key = "get_your_own_D6rA4zTHduk6KOKTXzGB"

let imagerySourceOptions = newJsObject()
imagerySourceOptions["attributions"] =
  "<a href=\"https://www.maptiler.com/copyright/\" target=\"_blank\">&copy; MapTiler</a> "
imagerySourceOptions["url"] =
  "https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & key
imagerySourceOptions["tileSize"] = 512.0
imagerySourceOptions["maxZoom"] = 20.0
let imagerySource = newOlImageTileSource(imagerySourceOptions)

let imageryLayerOptions = newJsObject()
imageryLayerOptions["className"] = "ol-layer-imagery"
imageryLayerOptions["source"] = imagerySource
let imageryLayer = newOlWebGLTileLayer(imageryLayerOptions)

let osmLayerOptions = newJsObject()
osmLayerOptions["source"] = newOlOSM()
let osmLayer = newOlWebGLTileLayer(osmLayerOptions)

let viewOptions = newJsObject()
viewOptions["center"] = @[0.0, 0.0]
viewOptions["zoom"] = 2.0
let mapView = newOlView(viewOptions)

let mapOptions = newJsObject()
mapOptions["layers"] = @[imageryLayer, osmLayer]
mapOptions["target"] = "map"
mapOptions["view"] = mapView

discard newMapWithOptions(mapOptions)
installOpacitySlider(cast[JsObject](osmLayer))
