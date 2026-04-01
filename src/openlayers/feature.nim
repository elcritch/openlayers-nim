import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Feature from 'ol/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Feature)".}

type Feature* = ref object of JsRoot
proc newFeature*(): Feature {.importjs: "(new olNs_Feature.default())".}
proc newFeature*(options: JsObject): Feature {.importjs: "(new olNs_Feature.default(#))".}
proc newFeature*(options: RootRef): Feature {.importjs: "(new olNs_Feature.default(#))".}
proc get*(self: Feature, key: cstring): JsObject {.importjs: "#.get(#)".}
proc set*(self: Feature, key: cstring, value: JsObject) {.importjs: "#.set(#, #)".}
proc set*(self: Feature, key: cstring, value: RootRef) {.importjs: "#.set(#, #)".}
proc set*(self: Feature, key: cstring, value: cstring) {.importjs: "#.set(#, #)".}
proc set*(self: Feature, key: cstring, value: float) {.importjs: "#.set(#, #)".}
proc set*(self: Feature, key: cstring, value: bool) {.importjs: "#.set(#, #)".}
proc getGeometry*(self: Feature): JsObject {.importjs: "#.getGeometry()".}
proc setGeometry*(self: Feature, geometry: JsObject) {.importjs: "#.setGeometry(#)".}
proc setGeometry*(self: Feature, geometry: RootRef) {.importjs: "#.setGeometry(#)".}
proc setStyle*(self: Feature, style: JsObject) {.importjs: "#.setStyle(#)".}
proc setStyle*(self: Feature, style: RootRef) {.importjs: "#.setStyle(#)".}

proc createStyleFunction*(
  obj: JsObject
): JsObject {.importjs: "olNs_Feature.createStyleFunction(#)".}
