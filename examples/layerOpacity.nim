import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/layer/webGLTile
import openlayers/source/imageTile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

let key = "get_your_own_D6rA4zTHduk6KOKTXzGB"

var initialized = false

proc createDom(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Layer Opacity"
    tdiv(id = "map", class = "map map-with-controls")
    label:
      text "Layer opacity "
      input(
        id = "opacity-input",
        `type` = "range",
        min = "0",
        max = "1",
        step = "0.01",
        value = "1",
      )
      text " "
      span(id = "opacity-output")

proc initExample() =
  if initialized:
    return
  initialized = true

  let imagerySourceOptions = newJsObject()
  imagerySourceOptions["attributions"] =
    "<a href=\"https://www.maptiler.com/copyright/\" target=\"_blank\">&copy; MapTiler</a> ".cstring
  imagerySourceOptions["url"] =
    cstring("https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & key)
  imagerySourceOptions["tileSize"] = 512.0
  imagerySourceOptions["maxZoom"] = 20.0
  let imagerySource = newOlImageTileSource(imagerySourceOptions)

  let imageryLayerOptions = newJsObject()
  imageryLayerOptions["className"] = "ol-layer-imagery".cstring
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
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView

  discard newMapWithOptions(mapOptions)
  installOpacitySlider(cast[JsObject](osmLayer))

discard setRenderer(createDom, "ROOT", initExample)
