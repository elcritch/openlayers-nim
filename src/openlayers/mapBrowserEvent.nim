import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olMapBrowserEventModule from 'ol/MapBrowserEvent.js';".}
{.emit: "import MapBrowserEvent from 'ol/MapBrowserEvent.js';".}

proc hasMapBrowserEventModule*(): bool {.
  importjs: "(typeof olMapBrowserEventModule !== 'undefined')"
.}

proc hasMapBrowserEventConstructor*(): bool {.
  importjs: "(typeof MapBrowserEvent === 'function')"
.}

type OlMapBrowserEvent* = ref object of JsRoot

proc newOlMapBrowserEvent*(
  eventType: cstring,
  map: JsObject,
  originalEvent: JsObject,
  dragging: JsObject = jsUndefined,
  frameState: JsObject = jsUndefined,
  activePointers: JsObject = jsUndefined,
): OlMapBrowserEvent {.importjs: "(new MapBrowserEvent(#, #, #, #, #, #))".}
