import jsffi
import karax/[karaxdsl, vdom]
import openlayers/map
import openlayers/layer/tile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var
  initialized = false
  mapObj: JsObject = jsUndefined

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Simple Map"
    tdiv(id = "map", class = "map")

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let layerOptions = newTileLayerOptions()
  layerOptions.source = newOSM()
  let baseLayer = newTileLayer(layerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView

  mapObj = cast[JsObject](newMap(mapOptions))
  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
