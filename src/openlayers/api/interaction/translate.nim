import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Translate from 'ol/interaction/Translate.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Translate)".}

type
  OlTranslate* = ref object of JsRoot
proc newOlTranslate*(options: JsObject = jsUndefined): OlTranslate {.importjs: "(new olNs_interaction_Translate.default(#))".}
proc getHitTolerance*(self: OlTranslate): float {.importjs: "#.getHitTolerance()".}
proc setHitTolerance*(self: OlTranslate, hitTolerance: float) {.importjs: "#.setHitTolerance(#)".}
