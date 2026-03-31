import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_Box from 'ol/render/Box.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_Box)".}

type
  OlRenderBox* = ref object of JsRoot
proc newOlRenderBox*(className: cstring): OlRenderBox {.importjs: "(new olNs_render_Box.default(#))".}
proc setMap*(self: OlRenderBox, map: JsObject) {.importjs: "#.setMap(#)".}
proc setPixels*(self: OlRenderBox, startPixel: JsObject, endPixel: JsObject) {.importjs: "#.setPixels(#, #)".}
proc createOrUpdateGeometry*(self: OlRenderBox) {.importjs: "#.createOrUpdateGeometry()".}
proc getGeometry*(self: OlRenderBox): JsObject {.importjs: "#.getGeometry()".}
