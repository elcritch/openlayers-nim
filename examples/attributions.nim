import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/control/attribution
import openlayers/control/defaults
import openlayers/map
import openlayers/layer/tile
import openlayers/source/osm
import openlayers/view

import olExampleHelpers

var initialized = false

proc createDom(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Attributions"
    tdiv(id = "map", class = "map")

proc initExample() =
  if initialized:
    return
  initialized = true

  let attributionOptions = newAttributionOptions()
  attributionOptions.collapsible = false
  let attributionControl = newAttribution(attributionOptions)

  let controlsOptions = newControlDefaultsOptions()
  controlsOptions.attribution = false
  let controlsWithAttribution = extendCollection(
    defaults(controlsOptions), jsArray1(cast[JsObject](attributionControl))
  )

  let layerOptions = newTileLayerOptions()
  layerOptions.source = newOSM()
  let baseLayer = newTileLayer(layerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = @[0.0, 0.0]
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer]
  mapOptions.controls = controlsWithAttribution
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  installAttributionResizeBehavior(
    mapObj,
    cast[JsObject](attributionControl),
    cast[JsObject](attributionControl),
    mapObj,
  )

discard setRenderer(createDom, "ROOT", initExample)
