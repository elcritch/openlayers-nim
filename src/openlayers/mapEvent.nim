import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olMapEventModule from 'ol/MapEvent.js';".}
when defined(esmModules):
  {.emit: "import MapEvent from 'ol/MapEvent.js';".}
type OlMapEvent* = ref object of JsRoot

proc newOlMapEvent*(
  eventType: cstring, map: JsObject, frameState: JsObject = jsUndefined
): OlMapEvent {.importjs: "(new MapEvent(#, #, #))".}
