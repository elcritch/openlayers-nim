import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_Feature from 'ol/render/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_Feature)".}

type
  OlRenderFeature* = ref object of JsRoot
proc newOlRenderFeature*(typeVal: JsObject, flatCoordinates: seq[float], ends: seq[float], stride: float, properties: JsObject, id: float | cstring): OlRenderFeature {.importjs: "(new olNs_render_Feature.default(#, #, #, #, #, #))".}
proc get*(self: OlRenderFeature, key: cstring): JsObject {.importjs: "#.get(#)".}
proc getExtent*(self: OlRenderFeature): JsObject {.importjs: "#.getExtent()".}
proc getFlatInteriorPoint*(self: OlRenderFeature): seq[float] {.importjs: "#.getFlatInteriorPoint()".}
proc getFlatInteriorPoints*(self: OlRenderFeature): seq[float] {.importjs: "#.getFlatInteriorPoints()".}
proc getFlatMidpoint*(self: OlRenderFeature): seq[float] {.importjs: "#.getFlatMidpoint()".}
proc getFlatMidpoints*(self: OlRenderFeature): seq[float] {.importjs: "#.getFlatMidpoints()".}
proc getId*(self: OlRenderFeature): float | cstring {.importjs: "#.getId()".}
proc getOrientedFlatCoordinates*(self: OlRenderFeature): seq[float] {.importjs: "#.getOrientedFlatCoordinates()".}
proc getGeometry*(self: OlRenderFeature): JsObject {.importjs: "#.getGeometry()".}
proc getSimplifiedGeometry*(self: OlRenderFeature, squaredTolerance: float): JsObject {.importjs: "#.getSimplifiedGeometry(#)".}
proc simplifyTransformed*(self: OlRenderFeature, squaredTolerance: float, transform: JsObject = jsUndefined): JsObject {.importjs: "#.simplifyTransformed(#, #)".}
proc getProperties*(self: OlRenderFeature): JsObject {.importjs: "#.getProperties()".}
proc getPropertiesInternal*(self: OlRenderFeature): JsObject {.importjs: "#.getPropertiesInternal()".}
proc getStride*(self: OlRenderFeature): float {.importjs: "#.getStride()".}
proc getStyleFunction*(self: OlRenderFeature): JsObject {.importjs: "#.getStyleFunction()".}
proc getType*(self: OlRenderFeature): JsObject {.importjs: "#.getType()".}
proc transform*(self: OlRenderFeature, projection: JsObject) {.importjs: "#.transform(#)".}
proc applyTransform*(self: OlRenderFeature, transformFn: JsObject) {.importjs: "#.applyTransform(#)".}
proc clone*(self: OlRenderFeature): JsObject {.importjs: "#.clone()".}
proc getEnds*(self: OlRenderFeature): JsObject {.importjs: "#.getEnds()".}
proc enableSimplifyTransformed*(self: OlRenderFeature): JsObject {.importjs: "#.enableSimplifyTransformed()".}

proc toGeometry*(renderFeature: JsObject): JsObject {.importjs: "olNs_render_Feature.toGeometry(#)".}
proc toFeature*(renderFeature: JsObject, geometryName: JsObject = jsUndefined): JsObject {.importjs: "olNs_render_Feature.toFeature(#, #)".}
