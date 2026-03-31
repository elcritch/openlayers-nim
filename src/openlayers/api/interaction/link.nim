import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Link from 'ol/interaction/Link.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Link)".}

type
  OlLink* = ref object of JsRoot
proc newOlLink*(options: JsObject = jsUndefined): OlLink {.importjs: "(new olNs_interaction_Link.default(#))".}
proc track*(self: OlLink, key: cstring, callback: JsObject): cstring {.importjs: "#.track(#, #)".}
proc update*(self: OlLink, key: cstring, value: cstring) {.importjs: "#.update(#, #)".}
