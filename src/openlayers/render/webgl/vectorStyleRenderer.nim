import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_VectorStyleRenderer from 'ol/render/webgl/VectorStyleRenderer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_VectorStyleRenderer)".}

type
  OlVectorStyleRenderer* = ref object of JsRoot
proc newOlVectorStyleRenderer*(styles: JsObject, variables: JsObject, helper: JsObject, enableHitDetection: JsObject = jsUndefined): OlVectorStyleRenderer {.importjs: "(new olNs_render_webgl_VectorStyleRenderer.default(#, #, #, #))".}
proc generateBuffers*(self: OlVectorStyleRenderer, geometryBatch: JsObject, transform: JsObject): JsObject {.importjs: "#.generateBuffers(#, #)".}
proc render*(self: OlVectorStyleRenderer, buffers: JsObject, frameState: JsObject, preRenderCallback: JsObject) {.importjs: "#.render(#, #, #)".}
proc setHelper*(self: OlVectorStyleRenderer, helper: JsObject, buffers: JsObject = jsUndefined) {.importjs: "#.setHelper(#, #)".}

proc convertStyleToShaders*(style: JsObject, variables: JsObject): JsObject {.importjs: "olNs_render_webgl_VectorStyleRenderer.convertStyleToShaders(#, #)".}
