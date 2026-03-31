import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olMapBrowserEventHandlerModule from 'ol/MapBrowserEventHandler.js';"
  .}
when defined(esmModules):
  {.emit: "import MapBrowserEventHandler from 'ol/MapBrowserEventHandler.js';".}
type OlMapBrowserEventHandler* = ref object of JsRoot

proc newOlMapBrowserEventHandler*(
  map: JsObject, moveTolerance: JsObject = jsUndefined
): OlMapBrowserEventHandler {.importjs: "(new MapBrowserEventHandler(#, #))".}
