import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/layer/tile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

var initialized = false

proc createDom(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Simple Map"
    tdiv(id = "map", class = "map")

proc initExample() =
  if initialized:
    return
  initialized = true

  let layerOptions = newJsObject()
  layerOptions["source"] = newOSM()
  let baseLayer = newTileLayer(layerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[baseLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView

  discard newMapWithOptions(mapOptions)

discard setRenderer(createDom, "ROOT", initExample)
