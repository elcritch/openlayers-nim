import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_MVT from 'ol/format/MVT.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_MVT)".}

type
  MVT* = ref object of JsRoot
proc newMVT*(options: JsObject = jsUndefined): MVT {.importjs: "(new olNs_format_MVT.default(#))".}
proc setLayers*(self: MVT, layers: seq[cstring]) {.importjs: "#.setLayers(#)".}
