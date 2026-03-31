import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_PaletteTexture from 'ol/webgl/PaletteTexture.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_PaletteTexture)".}

type
  OlPaletteTexture* = ref object of JsRoot
proc newOlPaletteTexture*(name: cstring, data: JsObject): OlPaletteTexture {.importjs: "(new olNs_webgl_PaletteTexture.default(#, #))".}
proc getTexture*(self: OlPaletteTexture, gl: JsObject): JsObject {.importjs: "#.getTexture(#)".}
proc delete*(self: OlPaletteTexture, gl: JsObject) {.importjs: "#.delete(#)".}
