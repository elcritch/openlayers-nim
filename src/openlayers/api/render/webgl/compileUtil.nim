import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_compileUtil from 'ol/render/webgl/compileUtil.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_compileUtil)".}

proc expressionToGlsl*(compilationContext: JsObject, value: JsObject, expectedType: JsObject = jsUndefined): cstring {.importjs: "olNs_render_webgl_compileUtil.expressionToGlsl(#, #, #)".}
proc packColor*(color: JsObject): seq[float] {.importjs: "olNs_render_webgl_compileUtil.packColor(#)".}
proc unpackColor*(packedColor: seq[float]): seq[float] {.importjs: "olNs_render_webgl_compileUtil.unpackColor(#)".}
proc getGlslSizeFromType*(typeVal: float): JsObject {.importjs: "olNs_render_webgl_compileUtil.getGlslSizeFromType(#)".}
proc getGlslTypeFromType*(typeVal: float): JsObject {.importjs: "olNs_render_webgl_compileUtil.getGlslTypeFromType(#)".}
proc applyContextToBuilder*(builder: JsObject, context: JsObject) {.importjs: "olNs_render_webgl_compileUtil.applyContextToBuilder(#, #)".}
proc generateUniformsFromContext*(context: JsObject, variables: JsObject = jsUndefined): JsObject {.importjs: "olNs_render_webgl_compileUtil.generateUniformsFromContext(#, #)".}
proc generateAttributesFromContext*(context: JsObject): JsObject {.importjs: "olNs_render_webgl_compileUtil.generateAttributesFromContext(#)".}

proc getUNPACK_COLOR_FN*(): cstring {.importjs: "(olNs_render_webgl_compileUtil.UNPACK_COLOR_FN)".}
