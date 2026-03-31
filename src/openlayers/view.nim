import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_View from 'ol/View.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_View)".}

type
  OlViewOptions* = ref object of JsRoot
  OlView* = ref object of JsRoot

proc newOlViewOptions*(): OlViewOptions {.importjs: "({})".}
proc `center=`*(options: OlViewOptions, value: JsObject) {.importjs: "#.center = #".}
proc `constrainRotation=`*(
  options: OlViewOptions, value: float
) {.importjs: "#.constrainRotation = #".}

proc `constrainRotation=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.constrainRotation = #".}

proc `enableRotation=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.enableRotation = #".}

proc `extent=`*(options: OlViewOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `constrainOnlyCenter=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.constrainOnlyCenter = #".}

proc `smoothExtentConstraint=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.smoothExtentConstraint = #".}

proc `maxResolution=`*(
  options: OlViewOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minResolution=`*(
  options: OlViewOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxZoom=`*(options: OlViewOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: OlViewOptions, value: float) {.importjs: "#.minZoom = #".}
proc `multiWorld=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.multiWorld = #".}

proc `constrainResolution=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.constrainResolution = #".}

proc `smoothResolutionConstraint=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.smoothResolutionConstraint = #".}

proc `showFullExtent=`*(
  options: OlViewOptions, value: bool
) {.importjs: "#.showFullExtent = #".}

proc `projection=`*(
  options: OlViewOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `resolution=`*(
  options: OlViewOptions, value: float
) {.importjs: "#.resolution = #".}

proc `resolutions=`*(
  options: OlViewOptions, value: seq[float]
) {.importjs: "#.resolutions = #".}

proc `rotation=`*(options: OlViewOptions, value: float) {.importjs: "#.rotation = #".}
proc `zoom=`*(options: OlViewOptions, value: float) {.importjs: "#.zoom = #".}
proc `zoomFactor=`*(
  options: OlViewOptions, value: float
) {.importjs: "#.zoomFactor = #".}

proc `padding=`*(
  options: OlViewOptions, value: seq[float]
) {.importjs: "#.padding = #".}

proc newOlView*(
  options: JsObject = jsUndefined
): OlView {.importjs: "(new olNs_View.default(#))".}

proc newOlView*(
  options: OlViewOptions
): OlView {.importjs: "(new olNs_View.default(#))".}

proc applyOptions*(self: OlView, options: JsObject) {.importjs: "#.applyOptions_(#)".}
proc getUpdatedOptions*(
  self: OlView, newOptions: JsObject
): JsObject {.importjs: "#.getUpdatedOptions_(#)".}

proc animate*(self: OlView, args: JsObject = jsUndefined) {.importjs: "#.animate(#)".}
proc animateInternal*(
  self: OlView, args: JsObject = jsUndefined
) {.importjs: "#.animateInternal(#)".}

proc getAnimating*(self: OlView): bool {.importjs: "#.getAnimating()".}
proc getInteracting*(self: OlView): bool {.importjs: "#.getInteracting()".}
proc cancelAnimations*(self: OlView) {.importjs: "#.cancelAnimations()".}
proc updateAnimations*(self: OlView) {.importjs: "#.updateAnimations_()".}
proc calculateCenterRotate*(
  self: OlView, rotation: float, anchor: JsObject
): JsObject {.importjs: "#.calculateCenterRotate(#, #)".}

proc calculateCenterZoom*(
  self: OlView, resolution: float, anchor: JsObject
): JsObject {.importjs: "#.calculateCenterZoom(#, #)".}

proc setViewportSize*(
  self: OlView, size: JsObject = jsUndefined
) {.importjs: "#.setViewportSize(#)".}

proc getCenter*(self: OlView): JsObject {.importjs: "#.getCenter()".}
proc getCenterInternal*(self: OlView): JsObject {.importjs: "#.getCenterInternal()".}
proc getConstraints*(self: OlView): JsObject {.importjs: "#.getConstraints()".}
proc getConstrainResolution*(
  self: OlView
): bool {.importjs: "#.getConstrainResolution()".}

proc getHints*(
  self: OlView, hints: JsObject = jsUndefined
): seq[float] {.importjs: "#.getHints(#)".}

proc calculateExtent*(
  self: OlView, size: JsObject = jsUndefined
): JsObject {.importjs: "#.calculateExtent(#)".}

proc calculateExtentInternal*(
  self: OlView, size: JsObject = jsUndefined
): JsObject {.importjs: "#.calculateExtentInternal(#)".}

proc getMaxResolution*(self: OlView): float {.importjs: "#.getMaxResolution()".}
proc getMinResolution*(self: OlView): float {.importjs: "#.getMinResolution()".}
proc getMaxZoom*(self: OlView): float {.importjs: "#.getMaxZoom()".}
proc setMaxZoom*(self: OlView, zoom: float) {.importjs: "#.setMaxZoom(#)".}
proc getMinZoom*(self: OlView): float {.importjs: "#.getMinZoom()".}
proc setMinZoom*(self: OlView, zoom: float) {.importjs: "#.setMinZoom(#)".}
proc setConstrainResolution*(
  self: OlView, enabled: bool
) {.importjs: "#.setConstrainResolution(#)".}

proc getProjection*(self: OlView): JsObject {.importjs: "#.getProjection()".}
proc getResolution*(self: OlView): float {.importjs: "#.getResolution()".}
proc getResolutions*(self: OlView): JsObject {.importjs: "#.getResolutions()".}
proc getResolutionForExtent*(
  self: OlView, extent: JsObject, size: JsObject = jsUndefined
): float {.importjs: "#.getResolutionForExtent(#, #)".}

proc getResolutionForExtentInternal*(
  self: OlView, extent: JsObject, size: JsObject = jsUndefined
): float {.importjs: "#.getResolutionForExtentInternal(#, #)".}

proc getResolutionForValueFunction*(
  self: OlView, power: JsObject = jsUndefined
): JsObject {.importjs: "#.getResolutionForValueFunction(#)".}

proc getRotation*(self: OlView): float {.importjs: "#.getRotation()".}
proc getValueForResolutionFunction*(
  self: OlView, power: JsObject = jsUndefined
): JsObject {.importjs: "#.getValueForResolutionFunction(#)".}

proc getState*(self: OlView): JsObject {.importjs: "#.getState()".}
proc getViewStateAndExtent*(
  self: OlView
): JsObject {.importjs: "#.getViewStateAndExtent()".}

proc getZoom*(self: OlView): float {.importjs: "#.getZoom()".}
proc getZoomForResolution*(
  self: OlView, resolution: float
): float {.importjs: "#.getZoomForResolution(#)".}

proc getResolutionForZoom*(
  self: OlView, zoom: float
): float {.importjs: "#.getResolutionForZoom(#)".}

proc fit*(
  self: OlView, geometryOrExtent: JsObject, options: JsObject = jsUndefined
) {.importjs: "#.fit(#, #)".}

proc rotatedExtentForGeometry*(
  self: OlView, geometry: JsObject
): JsObject {.importjs: "#.rotatedExtentForGeometry(#)".}

proc fitInternal*(
  self: OlView, geometry: JsObject, options: JsObject = jsUndefined
) {.importjs: "#.fitInternal(#, #)".}

proc centerOn*(
  self: OlView, coordinate: JsObject, size: JsObject, position: JsObject
) {.importjs: "#.centerOn(#, #, #)".}

proc centerOnInternal*(
  self: OlView, coordinate: JsObject, size: JsObject, position: JsObject
) {.importjs: "#.centerOnInternal(#, #, #)".}

proc calculateCenterShift*(
  self: OlView, center: JsObject, resolution: float, rotation: float, size: JsObject
): JsObject {.importjs: "#.calculateCenterShift(#, #, #, #)".}

proc isDef*(self: OlView): bool {.importjs: "#.isDef()".}
proc adjustCenter*(
  self: OlView, deltaCoordinates: JsObject
) {.importjs: "#.adjustCenter(#)".}

proc adjustCenterInternal*(
  self: OlView, deltaCoordinates: JsObject
) {.importjs: "#.adjustCenterInternal(#)".}

proc adjustResolution*(
  self: OlView, ratio: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustResolution(#, #)".}

proc adjustResolutionInternal*(
  self: OlView, ratio: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustResolutionInternal(#, #)".}

proc adjustZoom*(
  self: OlView, delta: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustZoom(#, #)".}

proc adjustRotation*(
  self: OlView, delta: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustRotation(#, #)".}

proc adjustRotationInternal*(
  self: OlView, delta: float, anchor: JsObject = jsUndefined
) {.importjs: "#.adjustRotationInternal(#, #)".}

proc setCenter*(self: OlView, center: JsObject) {.importjs: "#.setCenter(#)".}
proc setCenterInternal*(
  self: OlView, center: JsObject
) {.importjs: "#.setCenterInternal(#)".}

proc setHint*(
  self: OlView, hint: JsObject, delta: float
): float {.importjs: "#.setHint(#, #)".}

proc setResolution*(self: OlView, resolution: float) {.importjs: "#.setResolution(#)".}
proc setRotation*(self: OlView, rotation: float) {.importjs: "#.setRotation(#)".}
proc setZoom*(self: OlView, zoom: float) {.importjs: "#.setZoom(#)".}
proc resolveConstraints*(
  self: OlView,
  duration: JsObject = jsUndefined,
  resolutionDirection: JsObject = jsUndefined,
  anchor: JsObject = jsUndefined,
) {.importjs: "#.resolveConstraints(#, #, #)".}

proc beginInteraction*(self: OlView) {.importjs: "#.beginInteraction()".}
proc endInteraction*(
  self: OlView,
  duration: JsObject = jsUndefined,
  resolutionDirection: JsObject = jsUndefined,
  anchor: JsObject = jsUndefined,
) {.importjs: "#.endInteraction(#, #, #)".}

proc endInteractionInternal*(
  self: OlView,
  duration: JsObject = jsUndefined,
  resolutionDirection: JsObject = jsUndefined,
  anchor: JsObject = jsUndefined,
) {.importjs: "#.endInteractionInternal(#, #, #)".}

proc getConstrainedCenter*(
  self: OlView, targetCenter: JsObject, targetResolution: JsObject = jsUndefined
): JsObject {.importjs: "#.getConstrainedCenter(#, #)".}

proc getConstrainedZoom*(
  self: OlView, targetZoom: float, direction: JsObject = jsUndefined
): float {.importjs: "#.getConstrainedZoom(#, #)".}

proc getConstrainedResolution*(
  self: OlView, targetResolution: float, direction: JsObject = jsUndefined
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
