import jsffi
import strutils
import karax/[karax, karaxdsl, vdom]

import attributions as attributionsExample
import center as centerExample
import drawFeatures as drawFeaturesExample
import drawModifyTraceSnap as drawModifyTraceSnapExample
import earthquakesHeatmap as earthquakesHeatmapExample
import layerOpacity as layerOpacityExample
import selectFeatures as selectFeaturesExample
import selectHoverFeatures as selectHoverFeaturesExample
import semiTransparentLayer as semiTransparentLayerExample
import simple as simpleExample

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
  of "drawFeatures": routeDrawFeatures
  of "earthquakesHeatmap": routeEarthquakesHeatmap
  of "drawModifyTraceSnap": routeDrawModifyTraceSnap
  of "layerOpacity": routeLayerOpacity
  of "attributions": routeAttributions
  of "center": routeCenter
  else: routeSimple

proc linkClass(route: ExampleRoute, active: ExampleRoute): cstring =
  if route == active: "route-link route-link-active" else: "route-link"

proc renderRoute(route: ExampleRoute): VNode =
  case route
  of routeSimple:
    simpleExample.createDom()
  of routeSemiTransparentLayer:
    semiTransparentLayerExample.createDom()
  of routeSelectFeatures:
    selectFeaturesExample.createDom()
  of routeSelectHoverFeatures:
    selectHoverFeaturesExample.createDom()
  of routeDrawFeatures:
    drawFeaturesExample.createDom()
  of routeEarthquakesHeatmap:
    earthquakesHeatmapExample.createDom()
  of routeDrawModifyTraceSnap:
    drawModifyTraceSnapExample.createDom()
  of routeLayerOpacity:
    layerOpacityExample.createDom()
  of routeAttributions:
    attributionsExample.createDom()
  of routeCenter:
    centerExample.createDom()

proc initRoute(route: ExampleRoute): JsObject =
  case route
  of routeSimple:
    simpleExample.initExample()
  of routeSemiTransparentLayer:
    semiTransparentLayerExample.initExample()
  of routeSelectFeatures:
    selectFeaturesExample.initExample()
  of routeSelectHoverFeatures:
    selectHoverFeaturesExample.initExample()
  of routeDrawFeatures:
    drawFeaturesExample.initExample()
  of routeEarthquakesHeatmap:
    earthquakesHeatmapExample.initExample()
  of routeDrawModifyTraceSnap:
    drawModifyTraceSnapExample.initExample()
  of routeLayerOpacity:
    layerOpacityExample.initExample()
  of routeAttributions:
    attributionsExample.initExample()
  of routeCenter:
    centerExample.initExample()

proc cleanupRoute(route: ExampleRoute) =
  case route
  of routeSimple:
    simpleExample.cleanupExample()
  of routeSemiTransparentLayer:
    semiTransparentLayerExample.cleanupExample()
  of routeSelectFeatures:
    selectFeaturesExample.cleanupExample()
  of routeSelectHoverFeatures:
    selectHoverFeaturesExample.cleanupExample()
  of routeDrawFeatures:
    drawFeaturesExample.cleanupExample()
  of routeEarthquakesHeatmap:
    earthquakesHeatmapExample.cleanupExample()
  of routeDrawModifyTraceSnap:
    drawModifyTraceSnapExample.cleanupExample()
  of routeLayerOpacity:
    layerOpacityExample.cleanupExample()
  of routeAttributions:
    attributionsExample.cleanupExample()
  of routeCenter:
    centerExample.cleanupExample()

proc createDom(data: RouterData): VNode =
  let route = parseRoute(data.hashPart)
  let routeNode = renderRoute(route)

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

    routeNode

proc postRender(data: RouterData) =
  let route = parseRoute(data.hashPart)
  if not hasRoute or route != currentRoute:
    if hasRoute:
      cleanupRoute(currentRoute)
    if isTruthy(currentMapObj):
      detachMap(currentMapObj)
    currentMapObj = initRoute(route)
    currentRoute = route
    hasRoute = true

discard setRenderer(createDom, "ROOT", postRender)
