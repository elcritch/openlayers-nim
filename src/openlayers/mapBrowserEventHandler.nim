import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.
  emit:
    "import * as olMapBrowserEventHandlerModule from 'ol/MapBrowserEventHandler.js';"
.}
{.emit: "import MapBrowserEventHandler from 'ol/MapBrowserEventHandler.js';".}

proc hasMapBrowserEventHandlerModule*(): bool {.
  importjs: "(typeof olMapBrowserEventHandlerModule !== 'undefined')"
.}

proc hasMapBrowserEventHandlerConstructor*(): bool {.
  importjs: "(typeof MapBrowserEventHandler === 'function')"
.}

type OlMapBrowserEventHandler* = ref object of JsRoot

proc newOlMapBrowserEventHandler*(
  map: JsObject, moveTolerance: JsObject = jsUndefined
): OlMapBrowserEventHandler {.importjs: "(new MapBrowserEventHandler(#, #))".}
