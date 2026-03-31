import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_MapBrowserEventHandler from 'ol/MapBrowserEventHandler.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_MapBrowserEventHandler)".}

type
  OlMapBrowserEventHandler* = ref object of JsRoot
proc newOlMapBrowserEventHandler*(map: JsObject, moveTolerance: JsObject = jsUndefined): OlMapBrowserEventHandler {.importjs: "(new olNs_MapBrowserEventHandler.default(#, #))".}
