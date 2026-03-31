import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj_Triangulation from 'ol/reproj/Triangulation.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj_Triangulation)".}

type
  OlTriangulation* = ref object of JsRoot
proc newOlTriangulation*(sourceProj: JsObject, targetProj: JsObject, targetExtent: JsObject, maxSourceExtent: JsObject, errorThreshold: float, destinationResolution: float, sourceMatrix: JsObject = jsUndefined): OlTriangulation {.importjs: "(new olNs_reproj_Triangulation.default(#, #, #, #, #, #, #))".}
proc calculateSourceExtent*(self: OlTriangulation): JsObject {.importjs: "#.calculateSourceExtent()".}
proc getTriangles*(self: OlTriangulation): JsObject {.importjs: "#.getTriangles()".}
