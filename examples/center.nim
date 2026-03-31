import jsffi
import karax/[karax, karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/osm
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

  let sourceOptions = newJsObject()
  sourceOptions["url"] =
    "/deps/openlayers/examples/data/geojson/switzerland.geojson".cstring
  sourceOptions["format"] = newOlGeoJSON()
  let vectorSource = newVectorSourceWithOptions(sourceOptions)

  let styleOptions = newJsObject()
  styleOptions["fill-color"] = "rgba(255, 255, 255, 0.6)".cstring
  styleOptions["stroke-width"] = 1.0
  styleOptions["stroke-color"] = "#319FD3".cstring
  styleOptions["circle-radius"] = 5.0
  styleOptions["circle-fill-color"] = "rgba(255, 255, 255, 0.6)".cstring
  styleOptions["circle-stroke-width"] = 1.0
  styleOptions["circle-stroke-color"] = "#319FD3".cstring

  let vectorLayerOptions = newJsObject()
  vectorLayerOptions["source"] = vectorSource
  vectorLayerOptions["style"] = styleOptions
  let vectorLayer = newOlVectorLayer(vectorLayerOptions)

  let baseLayerOptions = newJsObject()
  baseLayerOptions["source"] = newOlOSM()
  let baseLayer = newOlTileLayer(baseLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 1.0
  let mapView = newOlView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[baseLayer, vectorLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  installCenterControls(mapObj, cast[JsObject](mapView), vectorSource)

discard setRenderer(createDom, "ROOT", initExample)
