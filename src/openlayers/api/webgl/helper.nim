import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_Helper from 'ol/webgl/Helper.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_Helper)".}

type
  OlWebGLHelper* = ref object of JsRoot
proc newOlWebGLHelper*(options: JsObject = jsUndefined): OlWebGLHelper {.importjs: "(new olNs_webgl_Helper.default(#))".}
proc setUniforms*(self: OlWebGLHelper, uniforms: JsObject) {.importjs: "#.setUniforms(#)".}
proc addUniforms*(self: OlWebGLHelper, uniforms: JsObject) {.importjs: "#.addUniforms(#)".}
proc canvasCacheKeyMatches*(self: OlWebGLHelper, canvasCacheKey: cstring): bool {.importjs: "#.canvasCacheKeyMatches(#)".}
proc getExtension*(self: OlWebGLHelper, name: cstring): JsObject {.importjs: "#.getExtension(#)".}
proc getInstancedRenderingExtension*(self: OlWebGLHelper): JsObject {.importjs: "#.getInstancedRenderingExtension_()".}
proc bindBuffer*(self: OlWebGLHelper, buffer: JsObject) {.importjs: "#.bindBuffer(#)".}
proc flushBufferData*(self: OlWebGLHelper, buffer: JsObject) {.importjs: "#.flushBufferData(#)".}
proc deleteBuffer*(self: OlWebGLHelper, buf: JsObject) {.importjs: "#.deleteBuffer(#)".}
proc prepareDraw*(self: OlWebGLHelper, frameState: JsObject, disableAlphaBlend: JsObject = jsUndefined, enableDepth: JsObject = jsUndefined) {.importjs: "#.prepareDraw(#, #, #)".}
proc bindFrameBuffer*(self: OlWebGLHelper, frameBuffer: JsObject, texture: JsObject = jsUndefined) {.importjs: "#.bindFrameBuffer(#, #)".}
proc bindInitialFrameBuffer*(self: OlWebGLHelper) {.importjs: "#.bindInitialFrameBuffer()".}
proc bindTexture*(self: OlWebGLHelper, texture: JsObject, slot: float, uniformName: cstring) {.importjs: "#.bindTexture(#, #, #)".}
proc bindAttribute*(self: OlWebGLHelper, buffer: JsObject, attributeName: cstring, size: float) {.importjs: "#.bindAttribute(#, #, #)".}
proc prepareDrawToRenderTarget*(self: OlWebGLHelper, frameState: JsObject, renderTarget: JsObject, disableAlphaBlend: JsObject = jsUndefined, enableDepth: JsObject = jsUndefined) {.importjs: "#.prepareDrawToRenderTarget(#, #, #, #)".}
proc drawElements*(self: OlWebGLHelper, start: float, endVal: float) {.importjs: "#.drawElements(#, #)".}
proc drawElementsInstanced*(self: OlWebGLHelper, start: float, endVal: float, instanceCount: float) {.importjs: "#.drawElementsInstanced(#, #, #)".}
proc finalizeDraw*(self: OlWebGLHelper, frameState: JsObject, preCompose: JsObject = jsUndefined, postCompose: JsObject = jsUndefined) {.importjs: "#.finalizeDraw(#, #, #)".}
proc getCanvas*(self: OlWebGLHelper): JsObject {.importjs: "#.getCanvas()".}
proc getGL*(self: OlWebGLHelper): JsObject {.importjs: "#.getGL()".}
proc applyFrameState*(self: OlWebGLHelper, frameState: JsObject) {.importjs: "#.applyFrameState(#)".}
proc applyHitDetectionUniform*(self: OlWebGLHelper, enabled: bool) {.importjs: "#.applyHitDetectionUniform(#)".}
proc applyUniforms*(self: OlWebGLHelper, frameState: JsObject) {.importjs: "#.applyUniforms(#)".}
proc useProgram*(self: OlWebGLHelper, program: JsObject, frameState: JsObject = jsUndefined) {.importjs: "#.useProgram(#, #)".}
proc compileShader*(self: OlWebGLHelper, source: cstring, typeVal: JsObject): JsObject {.importjs: "#.compileShader(#, #)".}
proc getProgram*(self: OlWebGLHelper, fragmentShaderSource: cstring, vertexShaderSource: cstring): JsObject {.importjs: "#.getProgram(#, #)".}
proc getUniformLocation*(self: OlWebGLHelper, name: cstring): JsObject {.importjs: "#.getUniformLocation(#)".}
proc getAttributeLocation*(self: OlWebGLHelper, name: cstring): float {.importjs: "#.getAttributeLocation(#)".}
proc makeProjectionTransform*(self: OlWebGLHelper, frameState: JsObject, transform: JsObject): JsObject {.importjs: "#.makeProjectionTransform(#, #)".}
proc setUniformFloatValue*(self: OlWebGLHelper, uniform: cstring, value: float) {.importjs: "#.setUniformFloatValue(#, #)".}
proc setUniformFloatVec2*(self: OlWebGLHelper, uniform: cstring, value: seq[float]) {.importjs: "#.setUniformFloatVec2(#, #)".}
proc setUniformFloatVec4*(self: OlWebGLHelper, uniform: cstring, value: seq[float]) {.importjs: "#.setUniformFloatVec4(#, #)".}
proc setUniformMatrixValue*(self: OlWebGLHelper, uniform: cstring, value: seq[float]) {.importjs: "#.setUniformMatrixValue(#, #)".}
proc enableAttributes*(self: OlWebGLHelper, attributes: JsObject) {.importjs: "#.enableAttributes(#)".}
proc enableAttributesInstanced*(self: OlWebGLHelper, attributes: JsObject) {.importjs: "#.enableAttributesInstanced(#)".}
proc needsToBeRecreated*(self: OlWebGLHelper): bool {.importjs: "#.needsToBeRecreated()".}
proc createTexture*(self: OlWebGLHelper, size: seq[float], data: JsObject, texture: JsObject = jsUndefined, nearest: JsObject = jsUndefined): JsObject {.importjs: "#.createTexture(#, #, #, #)".}

proc computeAttributesStride*(attributes: JsObject): float {.importjs: "olNs_webgl_Helper.computeAttributesStride(#)".}
