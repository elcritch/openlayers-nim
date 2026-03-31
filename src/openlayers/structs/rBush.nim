import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_structs_RBush from 'ol/structs/RBush.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_structs_RBush)".}

type
  OlRBush* = ref object of JsRoot
proc newOlRBush*(maxEntries: JsObject = jsUndefined): OlRBush {.importjs: "(new olNs_structs_RBush.default(#))".}
proc insert*(self: OlRBush, extent: JsObject, value: JsObject) {.importjs: "#.insert(#, #)".}
proc load*(self: OlRBush, extents: JsObject, values: JsObject) {.importjs: "#.load(#, #)".}
proc remove*(self: OlRBush, value: JsObject): bool {.importjs: "#.remove(#)".}
proc update*(self: OlRBush, extent: JsObject, value: JsObject) {.importjs: "#.update(#, #)".}
proc getAll*(self: OlRBush): JsObject {.importjs: "#.getAll()".}
proc getInExtent*(self: OlRBush, extent: JsObject): JsObject {.importjs: "#.getInExtent(#)".}
proc forEach*(self: OlRBush, callback: JsObject): JsObject {.importjs: "#.forEach(#)".}
proc forEachInExtent*(self: OlRBush, extent: JsObject, callback: JsObject): JsObject {.importjs: "#.forEachInExtent(#, #)".}
proc isEmpty*(self: OlRBush): bool {.importjs: "#.isEmpty()".}
proc clear*(self: OlRBush) {.importjs: "#.clear()".}
proc getExtent*(self: OlRBush, extent: JsObject = jsUndefined): JsObject {.importjs: "#.getExtent(#)".}
proc concat*(self: OlRBush, rbush: JsObject) {.importjs: "#.concat(#)".}
