import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_RenderTarget from 'ol/webgl/RenderTarget.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_RenderTarget)".}

type
  OlWebGLRenderTarget* = ref object of JsRoot
proc newOlWebGLRenderTarget*(helper: JsObject, size: JsObject = jsUndefined): OlWebGLRenderTarget {.importjs: "(new olNs_webgl_RenderTarget.default(#, #))".}
proc setSize*(self: OlWebGLRenderTarget, size: seq[float]) {.importjs: "#.setSize(#)".}
proc getSize*(self: OlWebGLRenderTarget): seq[float] {.importjs: "#.getSize()".}
proc clearCachedData*(self: OlWebGLRenderTarget) {.importjs: "#.clearCachedData()".}
proc readAll*(self: OlWebGLRenderTarget): JsObject {.importjs: "#.readAll()".}
proc readPixel*(self: OlWebGLRenderTarget, x: float, y: float): JsObject {.importjs: "#.readPixel(#, #)".}
proc getTexture*(self: OlWebGLRenderTarget): JsObject {.importjs: "#.getTexture()".}
proc getFramebuffer*(self: OlWebGLRenderTarget): JsObject {.importjs: "#.getFramebuffer()".}
proc getDepthbuffer*(self: OlWebGLRenderTarget): JsObject {.importjs: "#.getDepthbuffer()".}
