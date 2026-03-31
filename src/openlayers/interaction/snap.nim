import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Snap from 'ol/interaction/Snap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Snap)".}

type
  Snap* = ref object of JsRoot
proc newSnap*(options: JsObject = jsUndefined): Snap {.importjs: "(new olNs_interaction_Snap.default(#))".}
proc addFeature*(self: Snap, feature: JsObject, register: JsObject = jsUndefined) {.importjs: "#.addFeature(#, #)".}
proc removeFeature*(self: Snap, feature: JsObject, unlisten: JsObject = jsUndefined) {.importjs: "#.removeFeature(#, #)".}
proc snapTo*(self: Snap, pixel: JsObject, pixelCoordinate: JsObject, map: JsObject): JsObject {.importjs: "#.snapTo(#, #, #)".}

type
  SnapOptions* = ref object of JsRoot

proc newSnapOptions*(): SnapOptions {.importjs: "({})".}
proc `features=`*(options: SnapOptions, value: JsObject) {.importjs: "#.features = #".}
proc `features=`*(options: SnapOptions, value: RootRef) {.importjs: "#.features = #".}
proc `source=`*(options: SnapOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: SnapOptions, value: RootRef) {.importjs: "#.source = #".}
proc `edge=`*(options: SnapOptions, value: bool) {.importjs: "#.edge = #".}
proc `vertex=`*(options: SnapOptions, value: bool) {.importjs: "#.vertex = #".}
proc `intersection=`*(options: SnapOptions, value: bool) {.importjs: "#.intersection = #".}
proc `pixelTolerance=`*(options: SnapOptions, value: float) {.importjs: "#.pixelTolerance = #".}
proc `segmenters=`*(options: SnapOptions, value: JsObject) {.importjs: "#.segmenters = #".}
proc `segmenters=`*(options: SnapOptions, value: RootRef) {.importjs: "#.segmenters = #".}

proc newSnap*(options: SnapOptions): Snap {.importjs: "(new olNs_interaction_Snap.default(#))".}
