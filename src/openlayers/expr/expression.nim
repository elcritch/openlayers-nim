import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_expr_expression from 'ol/expr/expression.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_expr_expression)".}

proc typeName*(typeVal: float): cstring {.importjs: "olNs_expr_expression.typeName(#)".}
proc includesType*(broad: float, specific: float): bool {.importjs: "olNs_expr_expression.includesType(#, #)".}
proc overlapsType*(oneType: float, otherType: float): bool {.importjs: "olNs_expr_expression.overlapsType(#, #)".}
proc isType*(typeVal: float, expected: float): bool {.importjs: "olNs_expr_expression.isType(#, #)".}
proc newParsingContext*(): JsObject {.importjs: "olNs_expr_expression.newParsingContext()".}
proc parse*(encoded: JsObject, expectedType: float, context: JsObject): JsObject {.importjs: "olNs_expr_expression.parse(#, #, #)".}
proc computeGeometryType*(geometry: JsObject): JsObject {.importjs: "olNs_expr_expression.computeGeometryType(#)".}

proc getNoneType*(): JsObject {.importjs: "(olNs_expr_expression.NoneType)".}
proc getBooleanType*(): float {.importjs: "(olNs_expr_expression.BooleanType)".}
proc getNumberType*(): float {.importjs: "(olNs_expr_expression.NumberType)".}
proc getStringType*(): float {.importjs: "(olNs_expr_expression.StringType)".}
proc getColorType*(): float {.importjs: "(olNs_expr_expression.ColorType)".}
proc getNumberArrayType*(): float {.importjs: "(olNs_expr_expression.NumberArrayType)".}
proc getSizeType*(): float {.importjs: "(olNs_expr_expression.SizeType)".}
proc getAnyType*(): float {.importjs: "(olNs_expr_expression.AnyType)".}
proc getOps*(): JsObject {.importjs: "(olNs_expr_expression.Ops)".}
