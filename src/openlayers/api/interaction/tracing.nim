import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_tracing from 'ol/interaction/tracing.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_tracing)".}

proc getCoordinate*(coordinates: JsObject, index: float): JsObject {.importjs: "olNs_interaction_tracing.getCoordinate(#, #)".}
proc interpolateCoordinate*(coordinates: JsObject, index: float): JsObject {.importjs: "olNs_interaction_tracing.interpolateCoordinate(#, #)".}
proc getTraceTargetUpdate*(coordinate: JsObject, traceState: JsObject, map: JsObject, snapTolerance: float): JsObject {.importjs: "olNs_interaction_tracing.getTraceTargetUpdate(#, #, #, #)".}
proc getTraceTargets*(coordinate: JsObject, features: JsObject): JsObject {.importjs: "olNs_interaction_tracing.getTraceTargets(#, #)".}
proc getPointSegmentRelationship*(x: float, y: float, start: JsObject, endVal: JsObject): JsObject {.importjs: "olNs_interaction_tracing.getPointSegmentRelationship(#, #, #, #)".}
