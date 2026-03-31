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
