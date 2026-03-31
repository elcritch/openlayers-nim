import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Google from 'ol/source/Google.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Google)".}

type
  Google* = ref object of JsRoot
proc newGoogle*(options: JsObject): Google {.importjs: "(new olNs_source_Google.default(#))".}
proc getError*(self: Google): JsObject {.importjs: "#.getError()".}
proc fetchSessionToken*(self: Google, url: cstring, config: JsObject): JsObject {.importjs: "#.fetchSessionToken(#, #)".}
