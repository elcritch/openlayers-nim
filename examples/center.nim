import jsffi
import karax/[karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/map
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/osm
import openlayers/source/vector
import openlayers/style/circle
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var initialized = false
var mapObj: JsObject = jsUndefined

proc createDom*(): VNode =
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

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let sourceOptions = newVectorSourceOptions()
  sourceOptions.url =
    "/deps/openlayers/examples/data/geojson/switzerland.geojson".cstring
  sourceOptions.format = newGeoJSON()
  let vectorSource = newVectorSource(sourceOptions)

  let centerFillOptions = newFillOptions()
  centerFillOptions.color = "rgba(255, 255, 255, 0.6)".cstring
  let centerFill = newFill(centerFillOptions)

  let centerStrokeOptions = newStrokeOptions()
  centerStrokeOptions.color = "#319FD3".cstring
  centerStrokeOptions.width = 1.0
  let centerStroke = newStroke(centerStrokeOptions)

  let centerCircleOptions = newCircleStyleOptions()
  centerCircleOptions.radius = 5.0
  centerCircleOptions.fill = centerFill
  centerCircleOptions.stroke = centerStroke
  let centerCircle = newCircleStyle(centerCircleOptions)

  let styleOptions = newStyleOptions()
  styleOptions.fill = centerFill
  styleOptions.stroke = centerStroke
  styleOptions.image = centerCircle
  let centerStyle = newStyle(styleOptions)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.style = centerStyle
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let baseLayerOptions = newTileLayerOptions()
  baseLayerOptions.source = newOSM()
  let baseLayer = newTileLayer(baseLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 1.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer, vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  installCenterControls(mapObj, cast[JsObject](mapView), cast[JsObject](vectorSource))
  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
