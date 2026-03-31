import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_MVT from 'ol/format/MVT.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_MVT)".}

type
  OlMVT* = ref object of JsRoot
proc newOlMVT*(options: JsObject = jsUndefined): OlMVT {.importjs: "(new olNs_format_MVT.default(#))".}
proc setLayers*(self: OlMVT, layers: seq[cstring]) {.importjs: "#.setLayers(#)".}
