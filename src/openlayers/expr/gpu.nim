import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_expr_gpu from 'ol/expr/gpu.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_expr_gpu)".}

proc numberToGlsl*(v: float): cstring {.importjs: "olNs_expr_gpu.numberToGlsl(#)".}
proc arrayToGlsl*(array: seq[float]): cstring {.importjs: "olNs_expr_gpu.arrayToGlsl(#)".}
proc colorToGlsl*(color: JsObject): cstring {.importjs: "olNs_expr_gpu.colorToGlsl(#)".}
proc sizeToGlsl*(size: JsObject): cstring {.importjs: "olNs_expr_gpu.sizeToGlsl(#)".}
proc getStringNumberEquivalent*(string: cstring): float {.importjs: "olNs_expr_gpu.getStringNumberEquivalent(#)".}
proc stringToGlsl*(string: cstring): cstring {.importjs: "olNs_expr_gpu.stringToGlsl(#)".}
proc uniformNameForVariable*(variableName: cstring): cstring {.importjs: "olNs_expr_gpu.uniformNameForVariable(#)".}
proc newCompilationContext*(): JsObject {.importjs: "olNs_expr_gpu.newCompilationContext()".}
proc buildExpression*(encoded: JsObject, typeVal: float, parsingContext: JsObject, compilationContext: JsObject): JsObject {.importjs: "olNs_expr_gpu.buildExpression(#, #, #, #)".}

proc getPALETTE_TEXTURE_ARRAY*(): JsObject {.importjs: "(olNs_expr_gpu.PALETTE_TEXTURE_ARRAY)".}
proc getFEATURE_ID_PROPERTY_NAME*(): JsObject {.importjs: "(olNs_expr_gpu.FEATURE_ID_PROPERTY_NAME)".}
proc getGEOMETRY_TYPE_PROPERTY_NAME*(): JsObject {.importjs: "(olNs_expr_gpu.GEOMETRY_TYPE_PROPERTY_NAME)".}
proc getUNDEFINED_PROP_VALUE*(): JsObject {.importjs: "(olNs_expr_gpu.UNDEFINED_PROP_VALUE)".}
