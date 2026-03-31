import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_Feature from 'ol/render/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_Feature)".}

type RenderFeature* = ref object of JsRoot
proc newRenderFeature*(
  typeVal: JsObject,
  flatCoordinates: seq[float],
  ends: seq[float],
  stride: float,
  properties: JsObject,
  id: float | cstring,
): RenderFeature {.importjs: "(new olNs_render_Feature.default(#, #, #, #, #, #))".}

proc get*(self: RenderFeature, key: cstring): JsObject {.importjs: "#.get(#)".}
proc getExtent*(self: RenderFeature): JsObject {.importjs: "#.getExtent()".}
proc getFlatInteriorPoint*(
  self: RenderFeature
): seq[float] {.importjs: "#.getFlatInteriorPoint()".}

proc getFlatInteriorPoints*(
  self: RenderFeature
): seq[float] {.importjs: "#.getFlatInteriorPoints()".}

proc getFlatMidpoint*(
  self: RenderFeature
): seq[float] {.importjs: "#.getFlatMidpoint()".}

proc getFlatMidpoints*(
  self: RenderFeature
): seq[float] {.importjs: "#.getFlatMidpoints()".}

proc getId*(self: RenderFeature): float | cstring {.importjs: "#.getId()".}
proc getOrientedFlatCoordinates*(
  self: RenderFeature
): seq[float] {.importjs: "#.getOrientedFlatCoordinates()".}

proc getGeometry*(self: RenderFeature): JsObject {.importjs: "#.getGeometry()".}
proc getSimplifiedGeometry*(
  self: RenderFeature, squaredTolerance: float
): JsObject {.importjs: "#.getSimplifiedGeometry(#)".}

proc simplifyTransformed*(
  self: RenderFeature, squaredTolerance: float, transform: JsObject = jsUndefined
): JsObject {.importjs: "#.simplifyTransformed(#, #)".}

proc getProperties*(self: RenderFeature): JsObject {.importjs: "#.getProperties()".}
proc getPropertiesInternal*(
  self: RenderFeature
): JsObject {.importjs: "#.getPropertiesInternal()".}

proc getStride*(self: RenderFeature): float {.importjs: "#.getStride()".}
proc getStyleFunction*(
  self: RenderFeature
): JsObject {.importjs: "#.getStyleFunction()".}

proc getType*(self: RenderFeature): JsObject {.importjs: "#.getType()".}
proc transform*(
  self: RenderFeature, projection: JsObject
) {.importjs: "#.transform(#)".}

proc applyTransform*(
  self: RenderFeature, transformFn: JsObject
) {.importjs: "#.applyTransform(#)".}

proc clone*(self: RenderFeature): JsObject {.importjs: "#.clone()".}
proc getEnds*(self: RenderFeature): JsObject {.importjs: "#.getEnds()".}
proc enableSimplifyTransformed*(
  self: RenderFeature
): JsObject {.importjs: "#.enableSimplifyTransformed()".}

proc toGeometry*(
  renderFeature: JsObject
): JsObject {.importjs: "olNs_render_Feature.toGeometry(#)".}

proc toFeature*(
  renderFeature: JsObject, geometryName: JsObject = jsUndefined
): JsObject {.importjs: "olNs_render_Feature.toFeature(#, #)".}
