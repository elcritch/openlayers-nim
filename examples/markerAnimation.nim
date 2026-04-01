import jsffi
import std/parseutils
import dom
import karax/[karaxdsl, vdom]
import openlayers/feature
import openlayers/geom/lineString
import openlayers/geom/point
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/map
import openlayers/proj
import openlayers/source/osm
import openlayers/source/vector
import openlayers/style/circle
import openlayers/style/fill
import openlayers/style/icon
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var
  initialized = false
  mapObj: JsObject = jsUndefined
  animationTimer: Interval
  hasAnimationTimer = false
  isAnimating = false

proc featureString(featureObj: JsObject, key: cstring): string =
  let value = cast[Feature](featureObj).get(key)
  if value == nil or value == jsUndefined:
    return ""
  result = $cast[cstring](value)
  if result == "undefined" or result == "null":
    result = ""

proc inputFloatValue(el: Element, fallback: float): float =
  var parsed = 0.0
  let raw = $cast[InputElement](el).value
  if parseutils.parseFloat(raw, parsed) > 0:
    return parsed
  fallback

proc stopTimer() =
  if hasAnimationTimer:
    dom.clearInterval(animationTimer)
    hasAnimationTimer = false

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Marker Animation"
    tdiv(id = "map", class = "map map-with-controls")
    form(class = "example-controls"):
      label(`for` = "speed"):
        text "Speed"
      input(
        id = "speed", `type` = "range", min = "1", max = "200", step = "1", value = "20"
      )
      span(id = "speed-output"):
        text "20"
      input(id = "start-animation", `type` = "button", value = "Start Animation")

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let routeCoordinates = cast[JsObject](@[
    fromLonLat(@[8.5310, 47.3720]),
    fromLonLat(@[8.5375, 47.3690]),
    fromLonLat(@[8.5485, 47.3685]),
    fromLonLat(@[8.5570, 47.3715]),
    fromLonLat(@[8.5635, 47.3765]),
    fromLonLat(@[8.5720, 47.3815]),
  ])
  let routeLine = newLineString(routeCoordinates)

  let routeFeature = newFeature()
  routeFeature.set("type".cstring, "route".cstring)
  routeFeature.setGeometry(routeLine)

  let startMarker = newFeature()
  startMarker.set("type".cstring, "icon".cstring)
  startMarker.setGeometry(newPoint(routeLine.getCoordinateAt(0.0)))

  let endMarker = newFeature()
  endMarker.set("type".cstring, "icon".cstring)
  endMarker.setGeometry(newPoint(routeLine.getCoordinateAt(1.0)))

  let movingPoint = newPoint(routeLine.getCoordinateAt(0.0))
  let geoMarker = newFeature()
  geoMarker.set("type".cstring, "geoMarker".cstring)
  geoMarker.setGeometry(movingPoint)

  let routeStrokeOptions = newStrokeOptions()
  routeStrokeOptions.width = 6.0
  routeStrokeOptions.color = "rgba(237, 212, 0, 0.8)".cstring
  let routeStroke = newStroke(routeStrokeOptions)

  let routeStyleOptions = newStyleOptions()
  routeStyleOptions.stroke = routeStroke
  let routeStyle = newStyle(routeStyleOptions)

  let iconOptions = newIconOptions()
  iconOptions.anchor = @[0.5, 1.0]
  iconOptions.src = "/deps/openlayers/examples/data/icon.png".cstring
  let markerIcon = newIcon(iconOptions)

  let iconStyleOptions = newStyleOptions()
  iconStyleOptions.image = markerIcon
  let iconStyle = newStyle(iconStyleOptions)

  let markerFillOptions = newFillOptions()
  markerFillOptions.color = "black".cstring
  let markerFill = newFill(markerFillOptions)

  let markerStrokeOptions = newStrokeOptions()
  markerStrokeOptions.color = "white".cstring
  markerStrokeOptions.width = 2.0
  let markerStroke = newStroke(markerStrokeOptions)

  let markerCircleOptions = newCircleStyleOptions()
  markerCircleOptions.radius = 7.0
  markerCircleOptions.fill = markerFill
  markerCircleOptions.stroke = markerStroke
  let markerCircle = newCircleStyle(markerCircleOptions)

  let geoMarkerStyleOptions = newStyleOptions()
  geoMarkerStyleOptions.image = markerCircle
  let geoMarkerStyle = newStyle(geoMarkerStyleOptions)

  let vectorSourceOptions = newVectorSourceOptions()
  vectorSourceOptions.features = @[routeFeature, geoMarker, startMarker, endMarker]
  let vectorSource = newVectorSource(vectorSourceOptions)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.style = proc(featureObj: JsObject): JsObject =
    case featureString(featureObj, "type".cstring)
    of "route":
      cast[JsObject](routeStyle)
    of "icon":
      cast[JsObject](iconStyle)
    of "geoMarker":
      cast[JsObject](geoMarkerStyle)
    else:
      cast[JsObject](iconStyle)
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let baseLayerOptions = newTileLayerOptions()
  baseLayerOptions.source = newOSM()
  let baseLayer = newTileLayer(baseLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = fromLonLat(@[8.5520, 47.3730])
  viewOptions.zoom = 13.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer, vectorLayer]
  mapOptions.target = olExampleHelpers.getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  let speedInput = dom.getElementById("speed".cstring)
  let speedOutput = dom.getElementById("speed-output".cstring)
  let startButton = dom.getElementById("start-animation".cstring)
  var distance = 0.0
  let tickMs = 16

  proc setButtonTitle(textVal: cstring) =
    if not startButton.isNil:
      cast[InputElement](startButton).value = textVal

  proc updateSpeedOutput() =
    if not speedInput.isNil and not speedOutput.isNil:
      cast[Element](speedOutput).innerText = cast[InputElement](speedInput).value

  proc tick() =
    if not isAnimating or speedInput.isNil:
      return
    let speed = inputFloatValue(speedInput, 20.0)
    distance = distance + (speed * float(tickMs)) / 1000000.0
    if distance >= 2.0:
      distance = distance - 2.0
    let fraction =
      if distance > 1.0:
        2.0 - distance
      else:
        distance
    movingPoint.setCoordinates(routeLine.getCoordinateAt(fraction))

  proc startAnimation() =
    if isAnimating:
      return
    isAnimating = true
    setButtonTitle("Stop Animation".cstring)
    stopTimer()
    animationTimer = dom.setInterval(tick, tickMs)
    hasAnimationTimer = true

  proc stopAnimation() =
    if not isAnimating:
      return
    isAnimating = false
    setButtonTitle("Start Animation".cstring)
    stopTimer()

  if not speedInput.isNil:
    speedInput.addEventListener(
      "input".cstring,
      proc(event: Event) =
        updateSpeedOutput(),
    )
    updateSpeedOutput()

  if not startButton.isNil:
    startButton.addEventListener(
      "click".cstring,
      proc(event: Event) =
        if isAnimating:
          stopAnimation()
        else:
          startAnimation(),
    )

  result = mapObj

proc cleanupExample*() =
  isAnimating = false
  stopTimer()
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
