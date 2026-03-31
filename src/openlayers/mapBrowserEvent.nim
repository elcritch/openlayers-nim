import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olMapBrowserEventModule from 'ol/MapBrowserEvent.js';".}
when defined(esmModules):
  {.emit: "import MapBrowserEvent from 'ol/MapBrowserEvent.js';".}
type OlMapBrowserEvent* = ref object of JsRoot

proc newOlMapBrowserEvent*(
  eventType: cstring,
  map: JsObject,
  originalEvent: JsObject,
  dragging: JsObject = jsUndefined,
  frameState: JsObject = jsUndefined,
  activePointers: JsObject = jsUndefined,
): OlMapBrowserEvent {.importjs: "(new MapBrowserEvent(#, #, #, #, #, #))".}
