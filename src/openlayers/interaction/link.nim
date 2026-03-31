import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Link from 'ol/interaction/Link.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Link)".}

type
  Link* = ref object of JsRoot
proc newLink*(options: JsObject = jsUndefined): Link {.importjs: "(new olNs_interaction_Link.default(#))".}
proc track*(self: Link, key: cstring, callback: JsObject): cstring {.importjs: "#.track(#, #)".}
proc update*(self: Link, key: cstring, value: cstring) {.importjs: "#.update(#, #)".}
