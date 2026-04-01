import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_events_condition from 'ol/events/condition.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_events_condition)".}

proc all*(
  args: JsObject = jsUndefined
): JsObject {.importjs: "olNs_events_condition.all(#)".}

proc altKeyOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.altKeyOnly(#)".}

proc altShiftKeysOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.altShiftKeysOnly(#)".}

proc focus*(event: JsObject): bool {.importjs: "olNs_events_condition.focus(#)".}
proc focusWithTabindex*(
  event: JsObject
): bool {.importjs: "olNs_events_condition.focusWithTabindex(#)".}

proc click*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.click(#)".}

proc mouseActionButton*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.mouseActionButton(#)".}

proc pointerMove*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.pointerMove(#)".}

proc singleClick*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.singleClick(#)".}

proc doubleClick*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.doubleClick(#)".}

proc noModifierKeys*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.noModifierKeys(#)".}

proc platformModifierKeyOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.platformModifierKeyOnly(#)".}

proc platformModifierKey*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.platformModifierKey(#)".}

proc shiftKeyOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.shiftKeyOnly(#)".}

proc targetNotEditable*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.targetNotEditable(#)".}

proc mouseOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.mouseOnly(#)".}

proc touchOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.touchOnly(#)".}

proc penOnly*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.penOnly(#)".}

proc primaryAction*(
  mapBrowserEvent: JsObject
): bool {.importjs: "olNs_events_condition.primaryAction(#)".}

proc getAlways*(): JsObject {.importjs: "(olNs_events_condition.always)".}
proc getNever*(): JsObject {.importjs: "(olNs_events_condition.never)".}
proc getClick*(): JsObject {.importjs: "(olNs_events_condition.click)".}
proc getPointerMove*(): JsObject {.importjs: "(olNs_events_condition.pointerMove)".}
proc getAltKeyOnly*(): JsObject {.importjs: "(olNs_events_condition.altKeyOnly)".}
