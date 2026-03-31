import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_Buffer from 'ol/webgl/Buffer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_Buffer)".}

type
  OlWebGLArrayBuffer* = ref object of JsRoot
proc newOlWebGLArrayBuffer*(typeVal: float, usage: JsObject = jsUndefined): OlWebGLArrayBuffer {.importjs: "(new olNs_webgl_Buffer.default(#, #))".}
proc ofSize*(self: OlWebGLArrayBuffer, size: float): JsObject {.importjs: "#.ofSize(#)".}
proc fromArray*(self: OlWebGLArrayBuffer, array: seq[float]): JsObject {.importjs: "#.fromArray(#)".}
proc fromArrayBuffer*(self: OlWebGLArrayBuffer, buffer: JsObject): JsObject {.importjs: "#.fromArrayBuffer(#)".}
proc getType*(self: OlWebGLArrayBuffer): float {.importjs: "#.getType()".}
proc getArray*(self: OlWebGLArrayBuffer): JsObject {.importjs: "#.getArray()".}
proc setArray*(self: OlWebGLArrayBuffer, array: JsObject) {.importjs: "#.setArray(#)".}
proc getUsage*(self: OlWebGLArrayBuffer): float {.importjs: "#.getUsage()".}
proc getSize*(self: OlWebGLArrayBuffer): float {.importjs: "#.getSize()".}

proc getArrayClassForType*(typeVal: float): JsObject {.importjs: "olNs_webgl_Buffer.getArrayClassForType(#)".}
