import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Link from 'ol/interaction/Link.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Link)".}

type Link* = ref object of JsRoot
proc newLink*(
  options: JsObject = jsUndefined
): Link {.importjs: "(new olNs_interaction_Link.default(#))".}

proc track*(
  self: Link, key: cstring, callback: JsObject
): cstring {.importjs: "#.track(#, #)".}

proc update*(self: Link, key: cstring, value: cstring) {.importjs: "#.update(#, #)".}

type LinkOptions* = ref object of JsRoot

proc newLinkOptions*(): LinkOptions {.importjs: "({})".}
proc `animate=`*(options: LinkOptions, value: bool) {.importjs: "#.animate = #".}
proc `animate=`*(options: LinkOptions, value: JsObject) {.importjs: "#.animate = #".}
proc `animate=`*(options: LinkOptions, value: RootRef) {.importjs: "#.animate = #".}
proc `params=`*(options: LinkOptions, value: JsObject) {.importjs: "#.params = #".}
proc `params=`*(options: LinkOptions, value: RootRef) {.importjs: "#.params = #".}
proc `params=`*[T](options: LinkOptions, value: seq[T]) {.importjs: "#.params = #".}
proc `replace=`*(options: LinkOptions, value: bool) {.importjs: "#.replace = #".}
proc `prefix=`*(options: LinkOptions, value: cstring) {.importjs: "#.prefix = #".}

proc newLink*(
  options: LinkOptions
): Link {.importjs: "(new olNs_interaction_Link.default(#))".}
