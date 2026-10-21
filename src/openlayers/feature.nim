import ./geom/geometry
import ./style/style

import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(openlayers.globalBundle):
  {.emit: """
var olNs_Feature = Object.assign(
  {default: globalThis.ol?.Feature}, globalThis.ol?.Feature);
""".}
elif not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_Feature from 'ol/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Feature)".}

type Feature* = ref object of JsRoot
proc newFeature*(): Feature {.importjs: "(new olNs_Feature.default())".}
proc newFeature*(
  options: JsObject
): Feature {.importjs: "(new olNs_Feature.default(#))".}

proc newFeature*(
  options: RootRef
): Feature {.importjs: "(new olNs_Feature.default(#))".}

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

proc getId*(self: Feature): JsObject {.importjs: "#.getId()".}
proc setId*(self: Feature, id: cstring) {.importjs: "#.setId(#)".}
proc geometry*(self: Feature): Geometry {.importjs: "#.getGeometry()".}
proc setStyle*(self: Feature, styles: seq[Style]) {.importjs: "#.setStyle(#)".}

proc setProperties*(self: Feature, values: JsObject, silent = false) {.
  importjs: "#.setProperties(#, #)"
.}
