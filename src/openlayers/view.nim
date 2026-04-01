import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_View from 'ol/View.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_View)".}

type View* = ref object of JsRoot
proc newView*(
  options: JsObject = jsUndefined
): View {.importjs: "(new olNs_View.default(#))".}

proc applyOptions*(self: View, options: JsObject) {.importjs: "#.applyOptions_(#)".}
proc getUpdatedOptions*(
  self: View, newOptions: JsObject
): JsObject {.importjs: "#.getUpdatedOptions_(#)".}

proc animate*(self: View, args: JsObject = jsUndefined) {.importjs: "#.animate(#)".}
proc animateInternal*(
  self: View, args: JsObject = jsUndefined
) {.importjs: "#.animateInternal(#)".}

proc getAnimating*(self: View): bool {.importjs: "#.getAnimating()".}
proc getInteracting*(self: View): bool {.importjs: "#.getInteracting()".}
proc cancelAnimations*(self: View) {.importjs: "#.cancelAnimations()".}
proc updateAnimations*(self: View) {.importjs: "#.updateAnimations_()".}
proc calculateCenterRotate*(
  self: View, rotation: float, anchor: JsObject
): JsObject {.importjs: "#.calculateCenterRotate(#, #)".}

proc calculateCenterZoom*(
  self: View, resolution: float, anchor: JsObject
): JsObject {.importjs: "#.calculateCenterZoom(#, #)".}

proc setViewportSize*(
  self: View, size: JsObject = jsUndefined
) {.importjs: "#.setViewportSize(#)".}

proc getCenter*(self: View): JsObject {.importjs: "#.getCenter()".}
proc getCenterInternal*(self: View): JsObject {.importjs: "#.getCenterInternal()".}
proc getConstraints*(self: View): JsObject {.importjs: "#.getConstraints()".}
proc getConstrainResolution*(
  self: View
): bool {.importjs: "#.getConstrainResolution()".}

proc getHints*(
  self: View, hints: JsObject = jsUndefined
): seq[float] {.importjs: "#.getHints(#)".}

proc calculateExtent*(
  self: View, size: JsObject = jsUndefined
): JsObject {.importjs: "#.calculateExtent(#)".}

proc calculateExtentInternal*(
  self: View, size: JsObject = jsUndefined
): JsObject {.importjs: "#.calculateExtentInternal(#)".}

proc getMaxResolution*(self: View): float {.importjs: "#.getMaxResolution()".}
proc getMinResolution*(self: View): float {.importjs: "#.getMinResolution()".}
proc getMaxZoom*(self: View): float {.importjs: "#.getMaxZoom()".}
proc setMaxZoom*(self: View, zoom: float) {.importjs: "#.setMaxZoom(#)".}
proc getMinZoom*(self: View): float {.importjs: "#.getMinZoom()".}
proc setMinZoom*(self: View, zoom: float) {.importjs: "#.setMinZoom(#)".}
proc setConstrainResolution*(
  self: View, enabled: bool
) {.importjs: "#.setConstrainResolution(#)".}

proc getProjection*(self: View): JsObject {.importjs: "#.getProjection()".}
proc getResolution*(self: View): float {.importjs: "#.getResolution()".}
proc getResolutions*(self: View): JsObject {.importjs: "#.getResolutions()".}
proc getResolutionForExtent*(
  self: View, extent: JsObject, size: JsObject = jsUndefined
): float {.importjs: "#.getResolutionForExtent(#, #)".}

proc getResolutionForExtentInternal*(
  self: View, extent: JsObject, size: JsObject = jsUndefined
): float {.importjs: "#.getResolutionForExtentInternal(#, #)".}

proc getResolutionForValueFunction*(
  self: View, power: JsObject = jsUndefined
): JsObject {.importjs: "#.getResolutionForValueFunction(#)".}

proc getRotation*(self: View): float {.importjs: "#.getRotation()".}
proc getValueForResolutionFunction*(
  self: View, power: JsObject = jsUndefined
): JsObject {.importjs: "#.getValueForResolutionFunction(#)".}

proc getState*(self: View): JsObject {.importjs: "#.getState()".}
proc getViewStateAndExtent*(
  self: View
): JsObject {.importjs: "#.getViewStateAndExtent()".}

proc getZoom*(self: View): float {.importjs: "#.getZoom()".}
proc getZoomForResolution*(
  self: View, resolution: float
): float {.importjs: "#.getZoomForResolution(#)".}

proc getResolutionForZoom*(
  self: View, zoom: float
): float {.importjs: "#.getResolutionForZoom(#)".}

proc fit*(
  self: View, geometryOrExtent: JsObject, options: JsObject = jsUndefined
) {.importjs: "#.fit(#, #)".}

proc rotatedExtentForGeometry*(
  self: View, geometry: JsObject
): JsObject {.importjs: "#.rotatedExtentForGeometry(#)".}

proc fitInternal*(
  self: View, geometry: JsObject, options: JsObject = jsUndefined
) {.importjs: "#.fitInternal(#, #)".}

proc centerOn*(
  self: View, coordinate: JsObject, size: JsObject, position: JsObject
) {.importjs: "#.centerOn(#, #, #)".}

proc centerOn*(
  self: View, coordinate: JsObject, size: seq[float], position: seq[float]
) {.importjs: "#.centerOn(#, #, #)".}

proc centerOnInternal*(
  self: View, coordinate: JsObject, size: JsObject, position: JsObject
) {.importjs: "#.centerOnInternal(#, #, #)".}

proc calculateCenterShift*(
  self: View, center: JsObject, resolution: float, rotation: float, size: JsObject
): JsObject {.importjs: "#.calculateCenterShift(#, #, #, #)".}

proc isDef*(self: View): bool {.importjs: "#.isDef()".}
proc adjustCenter*(
  self: View, deltaCoordinates: JsObject
) {.importjs: "#.adjustCenter(#)".}

proc adjustCenterInternal*(
  self: View, deltaCoordinates: JsObject
) {.importjs: "#.adjustCenterInternal(#)".}

proc adjustResolution*(
  self: View, ratio: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustResolution(#, #)".}

proc adjustResolutionInternal*(
  self: View, ratio: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustResolutionInternal(#, #)".}

proc adjustZoom*(
  self: View, delta: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustZoom(#, #)".}

proc adjustRotation*(
  self: View, delta: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustRotation(#, #)".}

proc adjustRotationInternal*(
  self: View, delta: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustRotationInternal(#, #)".}

proc setCenter*(self: View, center: JsObject) {.importjs: "#.setCenter(#)".}
proc setCenterInternal*(
  self: View, center: JsObject
) {.importjs: "#.setCenterInternal(#)".}

proc setHint*(
  self: View, hint: JsObject, delta: float
): float {.importjs: "#.setHint(#, #)".}

proc setResolution*(self: View, resolution: float) {.importjs: "#.setResolution(#)".}
proc setRotation*(self: View, rotation: float) {.importjs: "#.setRotation(#)".}
proc setZoom*(self: View, zoom: float) {.importjs: "#.setZoom(#)".}
proc resolveConstraints*(
  self: View,
  duration: JsObject = jsUndefined,
  resolutionDirection: JsObject = jsUndefined,
  anchor: JsObject = jsUndefined,
) {.importjs: "#.resolveConstraints(#, #, #)".}

proc beginInteraction*(self: View) {.importjs: "#.beginInteraction()".}
proc endInteraction*(
  self: View,
  duration: JsObject = jsUndefined,
  resolutionDirection: JsObject = jsUndefined,
  anchor: JsObject = jsUndefined,
) {.importjs: "#.endInteraction(#, #, #)".}

proc endInteractionInternal*(
  self: View,
  duration: JsObject = jsUndefined,
  resolutionDirection: JsObject = jsUndefined,
  anchor: JsObject = jsUndefined,
) {.importjs: "#.endInteractionInternal(#, #, #)".}

proc getConstrainedCenter*(
  self: View, targetCenter: JsObject, targetResolution: JsObject = jsUndefined
): JsObject {.importjs: "#.getConstrainedCenter(#, #)".}

proc getConstrainedZoom*(
  self: View, targetZoom: float, direction: JsObject = jsUndefined
): float {.importjs: "#.getConstrainedZoom(#, #)".}

proc getConstrainedResolution*(
  self: View, targetResolution: float, direction: JsObject = jsUndefined
): float {.importjs: "#.getConstrainedResolution(#, #)".}

proc createCenterConstraint*(
  options: JsObject
): JsObject {.importjs: "olNs_View.createCenterConstraint(#)".}

proc createResolutionConstraint*(
  options: JsObject
): JsObject {.importjs: "olNs_View.createResolutionConstraint(#)".}

proc createRotationConstraint*(
  options: JsObject
): JsObject {.importjs: "olNs_View.createRotationConstraint(#)".}

proc isNoopAnimation*(
  animation: JsObject
): bool {.importjs: "olNs_View.isNoopAnimation(#)".}

proc withHigherResolutions*(
  num: float
): JsObject {.importjs: "olNs_View.withHigherResolutions(#)".}

proc withLowerResolutions*(
  num: float
): JsObject {.importjs: "olNs_View.withLowerResolutions(#)".}

proc withExtentCenter*(): JsObject {.importjs: "olNs_View.withExtentCenter()".}
proc withZoom*(z: float): JsObject {.importjs: "olNs_View.withZoom(#)".}
proc getView*(
  source: JsObject, transforms: JsObject = jsUndefined
): JsObject {.importjs: "olNs_View.getView(#, #)".}

type AnimationOptions* = ref object of JsRoot

proc newAnimationOptions*(): AnimationOptions {.importjs: "({})".}
proc `center=`*(options: AnimationOptions, value: JsObject) {.importjs: "#.center = #".}
proc `center=`*(options: AnimationOptions, value: RootRef) {.importjs: "#.center = #".}
proc `zoom=`*(options: AnimationOptions, value: float) {.importjs: "#.zoom = #".}
proc `resolution=`*(
  options: AnimationOptions, value: float
) {.importjs: "#.resolution = #".}

proc `rotation=`*(
  options: AnimationOptions, value: float
) {.importjs: "#.rotation = #".}

proc `anchor=`*(options: AnimationOptions, value: JsObject) {.importjs: "#.anchor = #".}
proc `anchor=`*(options: AnimationOptions, value: RootRef) {.importjs: "#.anchor = #".}
proc `duration=`*(
  options: AnimationOptions, value: float
) {.importjs: "#.duration = #".}

proc `easing=`*(options: AnimationOptions, value: JsObject) {.importjs: "#.easing = #".}
proc `easing=`*(options: AnimationOptions, value: RootRef) {.importjs: "#.easing = #".}

type FitOptions* = ref object of JsRoot

proc newFitOptions*(): FitOptions {.importjs: "({})".}
proc `size=`*(options: FitOptions, value: JsObject) {.importjs: "#.size = #".}
proc `size=`*(options: FitOptions, value: RootRef) {.importjs: "#.size = #".}
proc `padding=`*(options: FitOptions, value: seq[float]) {.importjs: "#.padding = #".}
proc `nearest=`*(options: FitOptions, value: bool) {.importjs: "#.nearest = #".}
proc `minResolution=`*(
  options: FitOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxZoom=`*(options: FitOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `duration=`*(options: FitOptions, value: float) {.importjs: "#.duration = #".}
proc `easing=`*(options: FitOptions, value: JsObject) {.importjs: "#.easing = #".}
proc `easing=`*(options: FitOptions, value: RootRef) {.importjs: "#.easing = #".}
proc `callback=`*(options: FitOptions, value: JsObject) {.importjs: "#.callback = #".}
proc `callback=`*(options: FitOptions, value: RootRef) {.importjs: "#.callback = #".}
proc fit*(
  self: View, geometryOrExtent: JsObject, options: FitOptions
) {.importjs: "#.fit(#, #)".}

type ViewOptions* = ref object of JsRoot

proc newViewOptions*(): ViewOptions {.importjs: "({})".}
proc `center=`*(options: ViewOptions, value: JsObject) {.importjs: "#.center = #".}
proc `center=`*(options: ViewOptions, value: RootRef) {.importjs: "#.center = #".}
proc `center=`*(options: ViewOptions, value: seq[float]) {.importjs: "#.center = #".}
proc `constrainRotation=`*(
  options: ViewOptions, value: float
) {.importjs: "#.constrainRotation = #".}

proc `constrainRotation=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.constrainRotation = #".}

proc `enableRotation=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.enableRotation = #".}

proc `extent=`*(options: ViewOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: ViewOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `constrainOnlyCenter=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.constrainOnlyCenter = #".}

proc `smoothExtentConstraint=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.smoothExtentConstraint = #".}

proc `maxResolution=`*(
  options: ViewOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minResolution=`*(
  options: ViewOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxZoom=`*(options: ViewOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: ViewOptions, value: float) {.importjs: "#.minZoom = #".}
proc `multiWorld=`*(options: ViewOptions, value: bool) {.importjs: "#.multiWorld = #".}
proc `constrainResolution=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.constrainResolution = #".}

proc `smoothResolutionConstraint=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.smoothResolutionConstraint = #".}

proc `showFullExtent=`*(
  options: ViewOptions, value: bool
) {.importjs: "#.showFullExtent = #".}

proc `projection=`*(
  options: ViewOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: ViewOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `resolution=`*(options: ViewOptions, value: float) {.importjs: "#.resolution = #".}
proc `resolutions=`*(
  options: ViewOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc `rotation=`*(options: ViewOptions, value: float) {.importjs: "#.rotation = #".}
proc `zoom=`*(options: ViewOptions, value: float) {.importjs: "#.zoom = #".}
proc `zoomFactor=`*(options: ViewOptions, value: float) {.importjs: "#.zoomFactor = #".}
proc `padding=`*(options: ViewOptions, value: seq[float]) {.importjs: "#.padding = #".}

proc newView*(options: ViewOptions): View {.importjs: "(new olNs_View.default(#))".}
