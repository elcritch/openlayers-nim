import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction_Interaction from 'ol/interaction/Interaction.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Interaction)".}

type
  OlInteraction* = ref object of JsRoot
proc newOlInteraction*(): OlInteraction {.importjs: "(new olNs_interaction_Interaction.default())".}

proc pan*(view: JsObject, delta: JsObject, duration: JsObject = jsUndefined) {.importjs: "olNs_interaction_Interaction.pan(#, #, #)".}
proc zoomByDelta*(view: JsObject, delta: float, anchor: JsObject = jsUndefined, duration: JsObject = jsUndefined) {.importjs: "olNs_interaction_Interaction.zoomByDelta(#, #, #, #)".}
