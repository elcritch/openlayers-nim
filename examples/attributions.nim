import jsffi
import karax/[karaxdsl, vdom]
import openlayers/control/attribution
import openlayers/control/defaults
import openlayers/map
import openlayers/layer/tile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var initialized = false
var mapObj: JsObject = jsUndefined

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Attributions"
    tdiv(id = "map", class = "map")

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let attributionOptions = newAttributionOptions()
  attributionOptions.collapsible = false
  let attributionControl = newAttribution(attributionOptions)

  let controlsOptions = newDefaultsOptions()
  controlsOptions.attribution = false
  let controlsWithAttribution = extendCollection(
    defaults(controlsOptions), jsArray1(cast[JsObject](attributionControl))
  )

  let layerOptions = newTileLayerOptions()
  layerOptions.source = newOSM()
  let baseLayer = newTileLayer(layerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer]
  mapOptions.controls = controlsWithAttribution
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  installAttributionResizeBehavior(
    mapObj,
    cast[JsObject](attributionControl),
    cast[JsObject](attributionControl),
    mapObj,
  )

  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
