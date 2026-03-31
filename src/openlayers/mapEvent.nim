import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olMapEventModule from 'ol/MapEvent.js';".}
{.emit: "import MapEvent from 'ol/MapEvent.js';".}

proc hasMapEventModule*(): bool {.
  importjs: "(typeof olMapEventModule !== 'undefined')"
.}

proc hasMapEventConstructor*(): bool {.importjs: "(typeof MapEvent === 'function')".}

type OlMapEvent* = ref object of JsRoot

proc newOlMapEvent*(
  eventType: cstring, map: JsObject, frameState: JsObject = jsUndefined
): OlMapEvent {.importjs: "(new MapEvent(#, #, #))".}
