import jsffi

import ./view
import ./layer/tile

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import Map from 'ol/Map.js';".}

proc hasMapConstructor*(): bool {.importjs: "(typeof Map === 'function')".}

type OlMap* = ref object of JsRoot

proc newOlMap*(options: JsObject = jsUndefined): OlMap {.importjs: "(new Map(#))".}

proc getView*(map: OlMap): OlView {.importjs: "#.getView()".}
proc setView*(map: OlMap, view: OlView) {.importjs: "#.setView(#)".}
proc addLayer*(map: OlMap, layer: OlTileLayer) {.importjs: "#.addLayer(#)".}
