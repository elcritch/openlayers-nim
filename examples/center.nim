import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/map
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/osm
import openlayers/source/vector
import openlayers/view

import olExampleHelpers

var initialized = false

proc createDom(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Advanced View Positioning"
    tdiv(class = "mapcontainer"):
      tdiv(id = "map", class = "map")
      tdiv(class = "padding-top")
      tdiv(class = "padding-left")
      tdiv(class = "padding-right")
      tdiv(class = "padding-bottom")
      tdiv(class = "center")
    button(id = "zoomtoswitzerland"):
      text "Zoom to Switzerland"
    text " (best fit)."
    br()
    button(id = "zoomtolausanne"):
      text "Zoom to Lausanne"
    text " (with min resolution),"
    br()
    button(id = "centerlausanne"):
      text "Center on Lausanne"

proc initExample() =
  if initialized:
    return
  initialized = true

  let sourceOptions = newVectorSourceOptions()
  sourceOptions.url =
    "/deps/openlayers/examples/data/geojson/switzerland.geojson".cstring
  sourceOptions.format = newGeoJSON()
  let vectorSource = newVectorSource(sourceOptions)

  let styleOptions = newJsObject()
  styleOptions["fill-color"] = "rgba(255, 255, 255, 0.6)".cstring
  styleOptions["stroke-width"] = 1.0
  styleOptions["stroke-color"] = "#319FD3".cstring
  styleOptions["circle-radius"] = 5.0
  styleOptions["circle-fill-color"] = "rgba(255, 255, 255, 0.6)".cstring
  styleOptions["circle-stroke-width"] = 1.0
  styleOptions["circle-stroke-color"] = "#319FD3".cstring

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.style = styleOptions
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let baseLayerOptions = newTileLayerOptions()
  baseLayerOptions.source = newOSM()
  let baseLayer = newTileLayer(baseLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = @[0.0, 0.0]
  viewOptions.zoom = 1.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer, vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  installCenterControls(mapObj, cast[JsObject](mapView), cast[JsObject](vectorSource))

discard setRenderer(createDom, "ROOT", initExample)
