import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_expr_cpu from 'ol/expr/cpu.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_expr_cpu)".}

proc newEvaluationContext*(): JsObject {.importjs: "olNs_expr_cpu.newEvaluationContext()".}
proc buildExpression*(encoded: JsObject, typeVal: float, context: JsObject): JsObject {.importjs: "olNs_expr_cpu.buildExpression(#, #, #)".}
