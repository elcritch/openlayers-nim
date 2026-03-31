import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Translate from 'ol/interaction/Translate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Translate)".}

type
  Translate* = ref object of JsRoot
proc newTranslate*(options: JsObject = jsUndefined): Translate {.importjs: "(new olNs_interaction_Translate.default(#))".}
proc getHitTolerance*(self: Translate): float {.importjs: "#.getHitTolerance()".}
proc setHitTolerance*(self: Translate, hitTolerance: float) {.importjs: "#.setHitTolerance(#)".}
