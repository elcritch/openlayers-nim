import jsffi
import karax/[karaxdsl, vdom]
import openlayers/map
import openlayers/layer/webGLTile
import openlayers/source/imageTile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

let key = "get_your_own_D6rA4zTHduk6KOKTXzGB"

var initialized = false
var mapObj: JsObject = jsUndefined

proc createDom*(): VNode =
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

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let imagerySourceOptions = newImageTileSourceOptions()
  imagerySourceOptions.attributions =
    "<a href=\"https://www.maptiler.com/copyright/\" target=\"_blank\">&copy; MapTiler</a> ".cstring
  imagerySourceOptions.url =
    cstring("https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & key)
  imagerySourceOptions.tileSize = 512.0
  imagerySourceOptions.maxZoom = 20.0
  let imagerySource = newImageTileSource(imagerySourceOptions)

  let imageryLayerOptions = newWebGLTileLayerOptions()
  imageryLayerOptions.className = "ol-layer-imagery".cstring
  imageryLayerOptions.source = imagerySource
  let imageryLayer = newWebGLTileLayer(imageryLayerOptions)

  let osmLayerOptions = newWebGLTileLayerOptions()
  osmLayerOptions.source = newOSM()
  let osmLayer = newWebGLTileLayer(osmLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[imageryLayer, osmLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView

  mapObj = cast[JsObject](newMap(mapOptions))
  installOpacitySlider(cast[JsObject](osmLayer))
  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
