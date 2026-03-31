import jsffi
import strutils
import karax/[karax, karaxdsl, vdom]
import openlayers/control/attribution
import openlayers/control/defaults
import openlayers/format/geoJSON
import openlayers/interaction/select
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/layer/webGLTile
import openlayers/proj
import openlayers/source/imageTile
import openlayers/source/osm
import openlayers/source/tileJSON
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

type ExampleRoute = enum
  routeSimple
  routeSemiTransparentLayer
  routeSelectFeatures
  routeSelectHoverFeatures
  routeLayerOpacity
  routeAttributions
  routeCenter

let
  mapboxKey =
    "pk.eyJ1IjoiYWhvY2V2YXIiLCJhIjoiY2t0cGdwMHVnMGdlbzMxbDhwazBic2xrNSJ9.WbcTL9uj8JPAsnT9mgb7oQ"
  mapTilerKey = "get_your_own_D6rA4zTHduk6KOKTXzGB"

var
  currentRoute = routeSimple
  hasRoute = false
  currentMapObj: JsObject = jsUndefined

proc parseRoute(hashPart: cstring): ExampleRoute =
  let hashVal = $hashPart
  if hashVal.len == 0 or hashVal == "#" or hashVal == "#/":
    return routeSimple

  var route = hashVal
  if route.startsWith("#/"):
    route = route[2 .. ^1]
  elif route.startsWith("#"):
    route = route[1 .. ^1]

  case route
  of "simple": routeSimple
  of "semiTransparentLayer": routeSemiTransparentLayer
  of "selectFeatures": routeSelectFeatures
  of "selectHoverFeatures": routeSelectHoverFeatures
  of "layerOpacity": routeLayerOpacity
  of "attributions": routeAttributions
  of "center": routeCenter
  else: routeSimple

proc linkClass(route: ExampleRoute, active: ExampleRoute): cstring =
  if route == active: "route-link route-link-active" else: "route-link"

proc initSimple(): JsObject =
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

  result = newMapWithOptions(mapOptions)

proc initSemiTransparentLayer(): JsObject =
  let bwLayerOptions = newJsObject()
  bwLayerOptions["className"] = "bw".cstring
  bwLayerOptions["source"] = newOSM()
  let bwLayer = newTileLayer(bwLayerOptions)

  let tileJsonOptions = newJsObject()
  tileJsonOptions["url"] = cstring(
    "https://api.tiles.mapbox.com/v4/mapbox.va-quake-aug.json?secure&access_token=" &
      mapboxKey
  )
  tileJsonOptions["crossOrigin"] = "anonymous".cstring
  tileJsonOptions["transition"] = 0.0
  let quakeSource = newTileJSON(tileJsonOptions)

  let quakeLayerOptions = newJsObject()
  quakeLayerOptions["source"] = quakeSource
  let quakeLayer = newTileLayer(quakeLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = fromLonLat(jsArray2(-77.93255, 37.9555))
  viewOptions["zoom"] = 7.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[bwLayer, quakeLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView

  result = newMapWithOptions(mapOptions)

proc initSelectFeatures(): JsObject =
  let baseFillOptions = newJsObject()
  baseFillOptions["color"] = "#eeeeee".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStyleOptions = newJsObject()
  baseStyleOptions["fill"] = baseFill
  let baseStyle = newStyle(baseStyleOptions)

  let vectorSourceOptions = newJsObject()
  vectorSourceOptions["url"] =
    "https://openlayers.org/data/vector/ecoregions.json".cstring
  vectorSourceOptions["format"] = newGeoJSON()
  let vectorSource = newVectorSourceWithOptions(vectorSourceOptions)

  let vectorLayerOptions = newJsObject()
  vectorLayerOptions["source"] = vectorSource
  vectorLayerOptions["background"] = "white".cstring
  vectorLayerOptions["style"] =
    makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[vectorLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  let selectedFillOptions = newJsObject()
  selectedFillOptions["color"] = "#eeeeee".cstring
  let selectedFill = newFill(selectedFillOptions)

  let selectedStrokeOptions = newJsObject()
  selectedStrokeOptions["color"] = "rgba(255, 255, 255, 0.7)".cstring
  selectedStrokeOptions["width"] = 2.0
  let selectedStroke = newStroke(selectedStrokeOptions)

  let selectedStyleOptions = newJsObject()
  selectedStyleOptions["fill"] = selectedFill
  selectedStyleOptions["stroke"] = selectedStroke
  let selectedStyle = newStyle(selectedStyleOptions)
  let selectStyleFn =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))

  let selectSingleClickOptions = newJsObject()
  selectSingleClickOptions["style"] = selectStyleFn
  let selectSingleClick = newSelect(selectSingleClickOptions)

  let selectClickOptions = newJsObject()
  selectClickOptions["condition"] = getClickConditionFn()
  selectClickOptions["style"] = selectStyleFn
  let selectClick = newSelect(selectClickOptions)

  let selectPointerMoveOptions = newJsObject()
  selectPointerMoveOptions["condition"] = getPointerMoveConditionFn()
  selectPointerMoveOptions["toggleCondition"] = getNeverConditionFn()
  selectPointerMoveOptions["style"] = selectStyleFn
  let selectPointerMove = newSelect(selectPointerMoveOptions)

  let selectAltClickOptions = newJsObject()
  selectAltClickOptions["style"] = selectStyleFn
  selectAltClickOptions["condition"] =
    makeAltClickConditionFn(getClickConditionFn(), getAltKeyOnlyConditionFn())
  let selectAltClick = newSelect(selectAltClickOptions)

  installSelectTypeController(
    mapObj,
    cast[JsObject](selectSingleClick),
    cast[JsObject](selectClick),
    cast[JsObject](selectPointerMove),
    cast[JsObject](selectAltClick),
  )

  result = mapObj

proc initSelectHoverFeatures(): JsObject =
  let baseFillOptions = newJsObject()
  baseFillOptions["color"] = "#eeeeee".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStyleOptions = newJsObject()
  baseStyleOptions["fill"] = baseFill
  let baseStyle = newStyle(baseStyleOptions)

  let vectorSourceOptions = newJsObject()
  vectorSourceOptions["url"] =
    "https://openlayers.org/data/vector/ecoregions.json".cstring
  vectorSourceOptions["format"] = newGeoJSON()
  let vectorSource = newVectorSourceWithOptions(vectorSourceOptions)

  let vectorLayerOptions = newJsObject()
  vectorLayerOptions["source"] = vectorSource
  vectorLayerOptions["background"] = "white".cstring
  vectorLayerOptions["style"] =
    makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[vectorLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  let selectedFillOptions = newJsObject()
  selectedFillOptions["color"] = "#eeeeee".cstring
  let selectedFill = newFill(selectedFillOptions)

  let selectedStrokeOptions = newJsObject()
  selectedStrokeOptions["color"] = "rgba(255, 255, 255, 0.7)".cstring
  selectedStrokeOptions["width"] = 2.0
  let selectedStroke = newStroke(selectedStrokeOptions)

  let selectedStyleOptions = newJsObject()
  selectedStyleOptions["fill"] = selectedFill
  selectedStyleOptions["stroke"] = selectedStroke
  let selectedStyle = newStyle(selectedStyleOptions)

  let selectOptions = newJsObject()
  selectOptions["condition"] = getPointerMoveConditionFn()
  selectOptions["style"] =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))
  let selectInteraction = newSelect(selectOptions)

  addInteraction(mapObj, cast[JsObject](selectInteraction))
  installSelectHoverStatus(cast[JsObject](selectInteraction))

  result = mapObj

proc initLayerOpacity(): JsObject =
  let imagerySourceOptions = newJsObject()
  imagerySourceOptions["attributions"] =
    "<a href=\"https://www.maptiler.com/copyright/\" target=\"_blank\">&copy; MapTiler</a> ".cstring
  imagerySourceOptions["url"] = cstring(
    "https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & mapTilerKey
  )
  imagerySourceOptions["tileSize"] = 512.0
  imagerySourceOptions["maxZoom"] = 20.0
  let imagerySource = newImageTileSource(imagerySourceOptions)

  let imageryLayerOptions = newJsObject()
  imageryLayerOptions["className"] = "ol-layer-imagery".cstring
  imageryLayerOptions["source"] = imagerySource
  let imageryLayer = newWebGLTileLayer(imageryLayerOptions)

  let osmLayerOptions = newJsObject()
  osmLayerOptions["source"] = newOSM()
  let osmLayer = newWebGLTileLayer(osmLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[imageryLayer, osmLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  installOpacitySlider(cast[JsObject](osmLayer))
  result = mapObj

proc initAttributions(): JsObject =
  let attributionOptions = newJsObject()
  attributionOptions["collapsible"] = false
  let attributionControl = newAttribution(attributionOptions)

  let controlsOptions = newJsObject()
  controlsOptions["attribution"] = false
  let controlsWithAttribution = extendCollection(
    defaults(controlsOptions), jsArray1(cast[JsObject](attributionControl))
  )

  let layerOptions = newJsObject()
  layerOptions["source"] = newOSM()
  let baseLayer = newTileLayer(layerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[baseLayer]
  mapOptions["controls"] = controlsWithAttribution
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  installAttributionResizeBehavior(
    mapObj,
    cast[JsObject](attributionControl),
    cast[JsObject](attributionControl),
    mapObj,
  )

  result = mapObj

proc initCenter(): JsObject =
  let sourceOptions = newJsObject()
  sourceOptions["url"] =
    "/deps/openlayers/examples/data/geojson/switzerland.geojson".cstring
  sourceOptions["format"] = newGeoJSON()
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
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let baseLayerOptions = newJsObject()
  baseLayerOptions["source"] = newOSM()
  let baseLayer = newTileLayer(baseLayerOptions)

  let viewOptions = newJsObject()
  viewOptions["center"] = @[0.0, 0.0]
  viewOptions["zoom"] = 1.0
  let mapView = newView(viewOptions)

  let mapOptions = newJsObject()
  mapOptions["layers"] = @[baseLayer, vectorLayer]
  mapOptions["target"] = getElementById("map".cstring)
  mapOptions["view"] = mapView
  let mapObj = newMapWithOptions(mapOptions)

  installCenterControls(mapObj, cast[JsObject](mapView), vectorSource)
  result = mapObj

proc initRoute(route: ExampleRoute): JsObject =
  case route
  of routeSimple:
    initSimple()
  of routeSemiTransparentLayer:
    initSemiTransparentLayer()
  of routeSelectFeatures:
    initSelectFeatures()
  of routeSelectHoverFeatures:
    initSelectHoverFeatures()
  of routeLayerOpacity:
    initLayerOpacity()
  of routeAttributions:
    initAttributions()
  of routeCenter:
    initCenter()

proc createDom(data: RouterData): VNode =
  let route = parseRoute(data.hashPart)

  result = buildHtml(tdiv(class = "app-shell")):
    h1:
      text "OpenLayers Nim Examples"
    p(class = "subtitle"):
      text "Single-page Karax router demo"

    nav(class = "route-nav"):
      a(href = "#/simple", class = linkClass(routeSimple, route)):
        text "Simple"
      a(
        href = "#/semiTransparentLayer",
        class = linkClass(routeSemiTransparentLayer, route),
      ):
        text "Semi Transparent"
      a(href = "#/selectFeatures", class = linkClass(routeSelectFeatures, route)):
        text "Select"
      a(
        href = "#/selectHoverFeatures",
        class = linkClass(routeSelectHoverFeatures, route),
      ):
        text "Hover Select"
      a(href = "#/layerOpacity", class = linkClass(routeLayerOpacity, route)):
        text "Layer Opacity"
      a(href = "#/attributions", class = linkClass(routeAttributions, route)):
        text "Attributions"
      a(href = "#/center", class = linkClass(routeCenter, route)):
        text "Center"

    case route
    of routeSimple:
      tdiv(class = "example-shell"):
        h2:
          text "Simple Map"
        tdiv(id = "map", class = "map")
    of routeSemiTransparentLayer:
      tdiv(class = "example-shell"):
        h2:
          text "Semi-Transparent Layer"
        tdiv(id = "map", class = "map")
    of routeSelectFeatures:
      tdiv(class = "example-shell"):
        h2:
          text "Select Features"
        tdiv(id = "map", class = "map map-with-controls")
        form:
          label(`for` = "type"):
            text "Action type "
          select(id = "type"):
            option(value = "click", selected = "selected"):
              text "Click"
            option(value = "singleclick"):
              text "Single-click"
            option(value = "pointermove"):
              text "Hover"
            option(value = "altclick"):
              text "Alt+Click"
            option(value = "none"):
              text "None"
          text " "
          span(id = "status"):
            text "\u00A00 selected features"
    of routeSelectHoverFeatures:
      tdiv(class = "example-shell"):
        h2:
          text "Select Features by Hover"
        tdiv(id = "map", class = "map map-with-controls")
        span(id = "status"):
          text "\u00A0"
    of routeLayerOpacity:
      tdiv(class = "example-shell"):
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
    of routeAttributions:
      tdiv(class = "example-shell"):
        h2:
          text "Attributions"
        tdiv(id = "map", class = "map")
    of routeCenter:
      tdiv(class = "example-shell"):
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

proc postRender(data: RouterData) =
  let route = parseRoute(data.hashPart)
  if not hasRoute or route != currentRoute:
    if isTruthy(currentMapObj):
      detachMap(currentMapObj)
    currentMapObj = initRoute(route)
    currentRoute = route
    hasRoute = true

discard setRenderer(createDom, "ROOT", postRender)
