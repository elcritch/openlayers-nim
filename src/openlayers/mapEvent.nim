import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_MapEvent from 'ol/MapEvent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_MapEvent)".}

type
  MapEvent* = ref object of JsRoot
proc newMapEvent*(typeVal: cstring, map: JsObject, frameState: JsObject = jsUndefined): MapEvent {.importjs: "(new olNs_MapEvent.default(#, #, #))".}
