import jsffi
import strutils
import dom except getElementById
import karax/[karax, karaxdsl, vdom]
import openlayers/control/attribution
import openlayers/control/defaults
import openlayers/format/geoJSON
import openlayers/format/kml
import openlayers/interaction/draw
import openlayers/interaction/modify
import openlayers/interaction/snap
import openlayers/interaction/select
import openlayers/map
import openlayers/layer/heatmap
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/layer/webGLTile
import openlayers/proj
import openlayers/source/imageTile
import openlayers/source/osm
import openlayers/source/stadiaMaps
import openlayers/source/tileJSON
import openlayers/source/vector
import openlayers/style/fill
import openlayers/style/circle
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

type ExampleRoute = enum
  routeSimple
  routeSemiTransparentLayer
  routeSelectFeatures
  routeSelectHoverFeatures
  routeDrawFeatures
  routeEarthquakesHeatmap
  routeDrawModifyTraceSnap
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
  drawFeaturesMapObj: JsObject = jsUndefined
  drawFeaturesSourceObj: JsObject = jsUndefined
  drawFeaturesInteraction: Draw = nil
  drawTraceSnapMapObj: JsObject = jsUndefined
  drawTraceSnapBaseSourceObj: JsObject = jsUndefined
  drawTraceSnapDrawSourceObj: JsObject = jsUndefined
  drawTraceSnapDrawStyleObj: JsObject = jsUndefined
  drawTraceSnapDrawInteraction: Draw = nil
  drawTraceSnapModifyInteraction: Modify = nil
  drawTraceSnapSnapInteraction: Snap = nil

proc readElementValue(el: Element): cstring =
  cast[InputElement](el).value

proc writeElementValue(el: Element, value: cstring) =
  cast[InputElement](el).value = value

proc onceDrawEnd(drawInteraction: Draw, cb: proc()) =
  discard drawInteraction.once(
    "drawend".cstring,
    proc(event: JsObject) =
      cb(),
  )

proc clearDrawFeaturesInteraction() =
  if drawFeaturesInteraction != nil and isTruthy(drawFeaturesMapObj):
    removeInteraction(drawFeaturesMapObj, cast[JsObject](drawFeaturesInteraction))
  drawFeaturesInteraction = nil

proc updateDrawFeaturesInteraction() =
  clearDrawFeaturesInteraction()
  let typeSelect = dom.getElementById("draw-type".cstring)
  if typeSelect.isNil:
    return

  let geometryType = readElementValue(typeSelect)
  if geometryType == "None".cstring:
    return

  let drawOptions = newDrawOptions()
  drawOptions.source = drawFeaturesSourceObj
  drawOptions.typeVal = geometryType
  drawFeaturesInteraction = newDraw(drawOptions)
  addInteraction(drawFeaturesMapObj, cast[JsObject](drawFeaturesInteraction))

proc onDrawFeaturesTypeChange(event: Event) =
  updateDrawFeaturesInteraction()

proc onDrawFeaturesUndo(event: Event) =
  if drawFeaturesInteraction != nil:
    drawFeaturesInteraction.removeLastPoint()

proc installDrawFeaturesControlsNim(mapObj: JsObject, drawSourceObj: JsObject) =
  drawFeaturesMapObj = mapObj
  drawFeaturesSourceObj = drawSourceObj

  let typeSelect = dom.getElementById("draw-type".cstring)
  if not typeSelect.isNil:
    typeSelect.onchange = onDrawFeaturesTypeChange

  let undoButton = dom.getElementById("undo".cstring)
  if not undoButton.isNil:
    undoButton.onclick = onDrawFeaturesUndo

  updateDrawFeaturesInteraction()

proc removeDrawModifyTraceSnapInteractions() =
  if isTruthy(drawTraceSnapMapObj):
    if drawTraceSnapDrawInteraction != nil:
      removeInteraction(
        drawTraceSnapMapObj, cast[JsObject](drawTraceSnapDrawInteraction)
      )
    if drawTraceSnapModifyInteraction != nil:
      removeInteraction(
        drawTraceSnapMapObj, cast[JsObject](drawTraceSnapModifyInteraction)
      )
    if drawTraceSnapSnapInteraction != nil:
      removeInteraction(
        drawTraceSnapMapObj, cast[JsObject](drawTraceSnapSnapInteraction)
      )
  drawTraceSnapDrawInteraction = nil
  drawTraceSnapModifyInteraction = nil
  drawTraceSnapSnapInteraction = nil

proc changeDrawModifyTraceSnapMode()

proc installDrawModifyTraceSnapInteractions() =
  let typeSelect = dom.getElementById("trace-type".cstring)
  if typeSelect.isNil:
    return

  let modifyOptions = newModifyOptions()
  modifyOptions.source = drawTraceSnapDrawSourceObj
  modifyOptions.trace = true
  modifyOptions.traceSource = drawTraceSnapBaseSourceObj
  drawTraceSnapModifyInteraction = newModify(modifyOptions)
  addInteraction(drawTraceSnapMapObj, cast[JsObject](drawTraceSnapModifyInteraction))

  let value = readElementValue(typeSelect)
  if value != "None".cstring:
    let drawOptions = newDrawOptions()
    drawOptions.typeVal = value
    drawOptions.source = drawTraceSnapDrawSourceObj
    drawOptions.trace = true
    drawOptions.traceSource = drawTraceSnapBaseSourceObj
    drawOptions.style = drawTraceSnapDrawStyleObj
    drawTraceSnapDrawInteraction = newDraw(drawOptions)
    onceDrawEnd(
      drawTraceSnapDrawInteraction,
      proc() =
        let selectEl = dom.getElementById("trace-type".cstring)
        if not selectEl.isNil:
          writeElementValue(selectEl, "None".cstring)
        discard setTimeout(changeDrawModifyTraceSnapMode, 0),
    )
    addInteraction(drawTraceSnapMapObj, cast[JsObject](drawTraceSnapDrawInteraction))

  let snapOptions = newSnapOptions()
  snapOptions.source = drawTraceSnapBaseSourceObj
  drawTraceSnapSnapInteraction = newSnap(snapOptions)
  addInteraction(drawTraceSnapMapObj, cast[JsObject](drawTraceSnapSnapInteraction))

proc changeDrawModifyTraceSnapMode() =
  removeDrawModifyTraceSnapInteractions()
  installDrawModifyTraceSnapInteractions()

proc onDrawModifyTraceSnapTypeChange(event: Event) =
  changeDrawModifyTraceSnapMode()

proc installDrawModifyTraceSnapControlsNim(
    mapObj: JsObject,
    baseSourceObj: JsObject,
    drawSourceObj: JsObject,
    drawStyleObj: JsObject,
) =
  drawTraceSnapMapObj = mapObj
  drawTraceSnapBaseSourceObj = baseSourceObj
  drawTraceSnapDrawSourceObj = drawSourceObj
  drawTraceSnapDrawStyleObj = drawStyleObj

  let typeSelect = dom.getElementById("trace-type".cstring)
  if not typeSelect.isNil:
    typeSelect.onchange = onDrawModifyTraceSnapTypeChange

  changeDrawModifyTraceSnapMode()

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
  of "drawFeatures": routeDrawFeatures
  of "earthquakesHeatmap": routeEarthquakesHeatmap
  of "drawModifyTraceSnap": routeDrawModifyTraceSnap
  of "layerOpacity": routeLayerOpacity
  of "attributions": routeAttributions
  of "center": routeCenter
  else: routeSimple

proc linkClass(route: ExampleRoute, active: ExampleRoute): cstring =
  if route == active: "route-link route-link-active" else: "route-link"

proc initSimple(): JsObject =
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

  result = cast[JsObject](newMap(mapOptions))

proc initSemiTransparentLayer(): JsObject =
  let bwLayerOptions = newTileLayerOptions()
  bwLayerOptions.className = "bw".cstring
  bwLayerOptions.source = newOSM()
  let bwLayer = newTileLayer(bwLayerOptions)

  let tileJsonOptions = newTileJSONOptions()
  tileJsonOptions.url = cstring(
    "https://api.tiles.mapbox.com/v4/mapbox.va-quake-aug.json?secure&access_token=" &
      mapboxKey
  )
  tileJsonOptions.crossOrigin = "anonymous".cstring
  tileJsonOptions.transition = 0.0
  let quakeSource = newTileJSON(tileJsonOptions)

  let quakeLayerOptions = newTileLayerOptions()
  quakeLayerOptions.source = quakeSource
  let quakeLayer = newTileLayer(quakeLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = fromLonLat(jsArray2(-77.93255, 37.9555))
  viewOptions.zoom = 7.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[bwLayer, quakeLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView

  result = cast[JsObject](newMap(mapOptions))

proc initSelectFeatures(): JsObject =
  let baseFillOptions = newFillOptions()
  baseFillOptions.color = "#eeeeee".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStyleOptions = newStyleOptions()
  baseStyleOptions.fill = baseFill
  let baseStyle = newStyle(baseStyleOptions)

  let vectorSourceOptions = newVectorSourceOptions()
  vectorSourceOptions.url = "https://openlayers.org/data/vector/ecoregions.json".cstring
  vectorSourceOptions.format = newGeoJSON()
  let vectorSource = newVectorSource(vectorSourceOptions)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.background = "white".cstring
  vectorLayerOptions.style =
    makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  let selectedFillOptions = newFillOptions()
  selectedFillOptions.color = "#eeeeee".cstring
  let selectedFill = newFill(selectedFillOptions)

  let selectedStrokeOptions = newStrokeOptions()
  selectedStrokeOptions.color = "rgba(255, 255, 255, 0.7)".cstring
  selectedStrokeOptions.width = 2.0
  let selectedStroke = newStroke(selectedStrokeOptions)

  let selectedStyleOptions = newStyleOptions()
  selectedStyleOptions.fill = selectedFill
  selectedStyleOptions.stroke = selectedStroke
  let selectedStyle = newStyle(selectedStyleOptions)
  let selectStyleFn =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))

  let selectSingleClickOptions = newSelectOptions()
  selectSingleClickOptions.style = selectStyleFn
  let selectSingleClick = newSelect(selectSingleClickOptions)

  let selectClickOptions = newSelectOptions()
  selectClickOptions.condition = getClickConditionFn()
  selectClickOptions.style = selectStyleFn
  let selectClick = newSelect(selectClickOptions)

  let selectPointerMoveOptions = newSelectOptions()
  selectPointerMoveOptions.condition = getPointerMoveConditionFn()
  selectPointerMoveOptions.toggleCondition = getNeverConditionFn()
  selectPointerMoveOptions.style = selectStyleFn
  let selectPointerMove = newSelect(selectPointerMoveOptions)

  let selectAltClickOptions = newSelectOptions()
  selectAltClickOptions.style = selectStyleFn
  selectAltClickOptions.condition =
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
  let baseFillOptions = newFillOptions()
  baseFillOptions.color = "#eeeeee".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStyleOptions = newStyleOptions()
  baseStyleOptions.fill = baseFill
  let baseStyle = newStyle(baseStyleOptions)

  let vectorSourceOptions = newVectorSourceOptions()
  vectorSourceOptions.url = "https://openlayers.org/data/vector/ecoregions.json".cstring
  vectorSourceOptions.format = newGeoJSON()
  let vectorSource = newVectorSource(vectorSourceOptions)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.background = "white".cstring
  vectorLayerOptions.style =
    makeColorStyleFn(cast[JsObject](baseStyle), cast[JsObject](baseStyle))
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  let selectedFillOptions = newFillOptions()
  selectedFillOptions.color = "#eeeeee".cstring
  let selectedFill = newFill(selectedFillOptions)

  let selectedStrokeOptions = newStrokeOptions()
  selectedStrokeOptions.color = "rgba(255, 255, 255, 0.7)".cstring
  selectedStrokeOptions.width = 2.0
  let selectedStroke = newStroke(selectedStrokeOptions)

  let selectedStyleOptions = newStyleOptions()
  selectedStyleOptions.fill = selectedFill
  selectedStyleOptions.stroke = selectedStroke
  let selectedStyle = newStyle(selectedStyleOptions)

  let selectOptions = newSelectOptions()
  selectOptions.condition = getPointerMoveConditionFn()
  selectOptions.style =
    makeColorStyleFn(cast[JsObject](selectedStyle), cast[JsObject](selectedStyle))
  let selectInteraction = newSelect(selectOptions)

  addInteraction(mapObj, cast[JsObject](selectInteraction))
  installSelectHoverStatus(cast[JsObject](selectInteraction))

  result = mapObj

proc initDrawFeatures(): JsObject =
  let rasterOptions = newTileLayerOptions()
  rasterOptions.source = newOSM()
  let rasterLayer = newTileLayer(rasterOptions)

  let drawSourceOptions = newVectorSourceOptions()
  drawSourceOptions.wrapX = false
  let drawSource = newVectorSource(drawSourceOptions)

  let drawLayerOptions = newVectorLayerOptions()
  drawLayerOptions.source = drawSource
  let drawLayer = newVectorLayer(drawLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(-11000000.0, 4600000.0)
  viewOptions.zoom = 4.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, drawLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  installDrawFeaturesControlsNim(mapObj, cast[JsObject](drawSource))
  result = mapObj

proc initEarthquakesHeatmap(): JsObject =
  let kmlOptions = newKMLOptions()
  kmlOptions.extractStyles = false

  let sourceOptions = newVectorSourceOptions()
  sourceOptions.url =
    "/deps/openlayers/examples/data/kml/2012_Earthquakes_Mag5.kml".cstring
  sourceOptions.format = newKML(kmlOptions)
  let heatSource = newVectorSource(sourceOptions)

  let heatmapOptions = newHeatmapOptions()
  heatmapOptions.source = heatSource
  heatmapOptions.weight = makeEarthquakesHeatWeightFn()
  let heatmapLayer = newHeatmap(heatmapOptions)

  let stadiaOptions = newStadiaMapsOptions()
  stadiaOptions.layer = "stamen_toner".cstring
  let stadiaSource = newStadiaMaps(stadiaOptions)

  let rasterOptions = newTileLayerOptions()
  rasterOptions.source = stadiaSource
  let rasterLayer = newTileLayer(rasterOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, heatmapLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  installHeatmapControls(cast[JsObject](heatmapLayer))
  result = mapObj

proc initDrawModifyTraceSnap(): JsObject =
  let rasterSourceOptions = newImageTileSourceOptions()
  rasterSourceOptions.url = cstring(
    "https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & mapTilerKey
  )
  rasterSourceOptions.maxZoom = 20.0
  let rasterSource = newImageTileSource(rasterSourceOptions)

  let rasterLayerOptions = newTileLayerOptions()
  rasterLayerOptions.source = rasterSource
  let rasterLayer = newTileLayer(rasterLayerOptions)

  let baseSourceOptions = newVectorSourceOptions()
  baseSourceOptions.format = newGeoJSON()
  baseSourceOptions.url = "/deps/openlayers/examples/data/geojson/fire.json".cstring
  let baseVectorSource = newVectorSource(baseSourceOptions)

  let baseFillOptions = newFillOptions()
  baseFillOptions.color = "rgba(255, 0, 0, 0.3)".cstring
  let baseFill = newFill(baseFillOptions)

  let baseStrokeOptions = newStrokeOptions()
  baseStrokeOptions.color = "rgba(255, 0, 0, 0.9)".cstring
  baseStrokeOptions.width = 0.5
  let baseStroke = newStroke(baseStrokeOptions)

  let baseStyleOptions = newStyleOptions()
  baseStyleOptions.fill = baseFill
  baseStyleOptions.stroke = baseStroke
  let baseStyle = newStyle(baseStyleOptions)

  let baseLayerOptions = newVectorLayerOptions()
  baseLayerOptions.source = baseVectorSource
  baseLayerOptions.style = baseStyle
  let baseVectorLayer = newVectorLayer(baseLayerOptions)

  let drawVectorSource = newVectorSource()

  let drawFillOptions = newFillOptions()
  drawFillOptions.color = "rgba(100, 255, 0, 0.3)".cstring
  let drawFill = newFill(drawFillOptions)

  let drawStrokeOptions = newStrokeOptions()
  drawStrokeOptions.color = "rgba(100, 255, 0, 1)".cstring
  drawStrokeOptions.width = 2.0
  let drawStroke = newStroke(drawStrokeOptions)

  let drawCircleFillOptions = newFillOptions()
  drawCircleFillOptions.color = "rgba(100, 255, 0, 0.5)".cstring
  let drawCircleFill = newFill(drawCircleFillOptions)

  let drawCircleOptions = newCircleStyleOptions()
  drawCircleOptions.radius = 6.0
  drawCircleOptions.fill = drawCircleFill
  let drawCircle = newCircleStyle(drawCircleOptions)

  let drawStyleOptions = newStyleOptions()
  drawStyleOptions.stroke = drawStroke
  drawStyleOptions.fill = drawFill
  drawStyleOptions.image = drawCircle
  let drawStyle = newStyle(drawStyleOptions)

  let drawLayerOptions = newVectorLayerOptions()
  drawLayerOptions.source = drawVectorSource
  drawLayerOptions.style = drawStyle
  let drawVectorLayer = newVectorLayer(drawLayerOptions)

  let drawInteractionFillOptions = newFillOptions()
  drawInteractionFillOptions.color = "rgba(255, 255, 100, 0.25)".cstring
  let drawInteractionFill = newFill(drawInteractionFillOptions)

  let drawInteractionStrokeOptions = newStrokeOptions()
  drawInteractionStrokeOptions.color = "rgba(255, 255, 100, 0.5)".cstring
  drawInteractionStrokeOptions.width = 1.5
  let drawInteractionStroke = newStroke(drawInteractionStrokeOptions)

  let drawInteractionCircleFillOptions = newFillOptions()
  drawInteractionCircleFillOptions.color = "rgba(255, 255, 100, 0.5)".cstring
  let drawInteractionCircleFill = newFill(drawInteractionCircleFillOptions)

  let drawInteractionCircleOptions = newCircleStyleOptions()
  drawInteractionCircleOptions.radius = 6.0
  drawInteractionCircleOptions.fill = drawInteractionCircleFill
  let drawInteractionCircle = newCircleStyle(drawInteractionCircleOptions)

  let drawInteractionStyleOptions = newStyleOptions()
  drawInteractionStyleOptions.stroke = drawInteractionStroke
  drawInteractionStyleOptions.fill = drawInteractionFill
  drawInteractionStyleOptions.image = drawInteractionCircle
  let drawInteractionStyle = newStyle(drawInteractionStyleOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(-13378949.0, 5943751.0)
  viewOptions.zoom = 11.0
  viewOptions.maxZoom = 23.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, baseVectorLayer, drawVectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  let mapObj = cast[JsObject](newMap(mapOptions))

  installDrawModifyTraceSnapControlsNim(
    mapObj,
    cast[JsObject](baseVectorSource),
    cast[JsObject](drawVectorSource),
    cast[JsObject](drawInteractionStyle),
  )
  result = mapObj

proc initLayerOpacity(): JsObject =
  let imagerySourceOptions = newImageTileSourceOptions()
  imagerySourceOptions.attributions =
    "<a href=\"https://www.maptiler.com/copyright/\" target=\"_blank\">&copy; MapTiler</a> ".cstring
  imagerySourceOptions.url = cstring(
    "https://api.maptiler.com/maps/satellite/{z}/{x}/{y}.jpg?key=" & mapTilerKey
  )
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
  let mapObj = cast[JsObject](newMap(mapOptions))

  installOpacitySlider(cast[JsObject](osmLayer))
  result = mapObj

proc initAttributions(): JsObject =
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
  let mapObj = cast[JsObject](newMap(mapOptions))

  installAttributionResizeBehavior(
    mapObj,
    cast[JsObject](attributionControl),
    cast[JsObject](attributionControl),
    mapObj,
  )

  result = mapObj

proc initCenter(): JsObject =
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
  let mapObj = cast[JsObject](newMap(mapOptions))

  installCenterControls(mapObj, cast[JsObject](mapView), cast[JsObject](vectorSource))
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
  of routeDrawFeatures:
    initDrawFeatures()
  of routeEarthquakesHeatmap:
    initEarthquakesHeatmap()
  of routeDrawModifyTraceSnap:
    initDrawModifyTraceSnap()
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
      a(href = "#/drawFeatures", class = linkClass(routeDrawFeatures, route)):
        text "Draw Features"
      a(
        href = "#/earthquakesHeatmap", class = linkClass(routeEarthquakesHeatmap, route)
      ):
        text "Earthquakes Heatmap"
      a(
        href = "#/drawModifyTraceSnap",
        class = linkClass(routeDrawModifyTraceSnap, route),
      ):
        text "Draw Modify Trace Snap"
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
    of routeDrawFeatures:
      tdiv(class = "example-shell"):
        h2:
          text "Draw Features"
        tdiv(id = "map", class = "map map-with-controls")
        form(class = "example-controls"):
          label(`for` = "draw-type"):
            text "Geometry type:"
          select(id = "draw-type"):
            option(value = "Point"):
              text "Point"
            option(value = "LineString"):
              text "LineString"
            option(value = "Polygon"):
              text "Polygon"
            option(value = "Circle"):
              text "Circle"
            option(value = "None"):
              text "None"
          input(id = "undo", `type` = "button", value = "Undo")
    of routeEarthquakesHeatmap:
      tdiv(class = "example-shell"):
        h2:
          text "Earthquakes Heatmap"
        tdiv(id = "map", class = "map map-with-controls")
        form(class = "example-controls"):
          label(`for` = "radius"):
            text "Radius"
          input(
            id = "radius",
            `type` = "range",
            min = "1",
            max = "50",
            step = "1",
            value = "5",
          )
          label(`for` = "blur"):
            text "Blur"
          input(
            id = "blur",
            `type` = "range",
            min = "1",
            max = "50",
            step = "1",
            value = "15",
          )
    of routeDrawModifyTraceSnap:
      tdiv(class = "example-shell"):
        h2:
          text "Draw, Modify, Trace and Snap"
        tdiv(id = "map", class = "map map-with-controls")
        form(class = "example-controls"):
          label(`for` = "trace-type"):
            text "Draw geometry mode"
          select(id = "trace-type"):
            option(value = "Polygon"):
              text "Polygon"
            option(value = "LineString"):
              text "LineString"
            option(value = "None"):
              text "Modify only"
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
    if currentRoute == routeDrawFeatures:
      clearDrawFeaturesInteraction()
      drawFeaturesMapObj = jsUndefined
      drawFeaturesSourceObj = jsUndefined
    if currentRoute == routeDrawModifyTraceSnap:
      removeDrawModifyTraceSnapInteractions()
      drawTraceSnapMapObj = jsUndefined
      drawTraceSnapBaseSourceObj = jsUndefined
      drawTraceSnapDrawSourceObj = jsUndefined
      drawTraceSnapDrawStyleObj = jsUndefined
    if isTruthy(currentMapObj):
      detachMap(currentMapObj)
    currentMapObj = initRoute(route)
    currentRoute = route
    hasRoute = true

discard setRenderer(createDom, "ROOT", postRender)
