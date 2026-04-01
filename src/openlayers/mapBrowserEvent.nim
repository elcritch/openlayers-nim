import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_MapBrowserEvent from 'ol/MapBrowserEvent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_MapBrowserEvent)".}

type
  MapBrowserEvent* = ref object of JsRoot
proc newMapBrowserEvent*(typeVal: cstring, map: JsObject, originalEvent: JsObject, dragging: JsObject = jsUndefined, frameState: JsObject = jsUndefined, activePointers: JsObject = jsUndefined): MapBrowserEvent {.importjs: "(new olNs_MapBrowserEvent.default(#, #, #, #, #, #))".}
