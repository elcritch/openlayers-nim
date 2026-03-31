import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import Map from 'ol/Map.js';".}
{.emit: "import View from 'ol/View.js';".}
{.emit: "import TileLayer from 'ol/layer/Tile.js';".}
{.emit: "import OSM from 'ol/source/OSM.js';".}
{.emit: "import * as proj from 'ol/proj.js';".}

proc openLayersLoaded*(): bool {.importjs: "(typeof View === 'function')".}
proc hasMapConstructor*(): bool {.importjs: "(typeof Map === 'function')".}

type
  OlView* = ref object of JsRoot
  OlTileLayer* = ref object of JsRoot
  OlOsmSource* = ref object of JsRoot
  OlMap* = ref object of JsRoot

proc newOlView*(options: JsObject = jsUndefined): OlView {.importjs: "(new View(#))".}

proc getCenter*(view: OlView): seq[float] {.importjs: "#.getCenter()".}
proc setCenter*(view: OlView, center: seq[float]) {.importjs: "#.setCenter(#)".}
proc getZoom*(view: OlView): float {.importjs: "#.getZoom()".}
proc setZoom*(view: OlView, zoom: float) {.importjs: "#.setZoom(#)".}

proc newOsmSource*(
  options: JsObject = jsUndefined
): OlOsmSource {.importjs: "(new OSM(#))".}

proc newTileLayer*(
  options: JsObject = jsUndefined
): OlTileLayer {.importjs: "(new TileLayer(#))".}

proc getSource*(layer: OlTileLayer): OlOsmSource {.importjs: "#.getSource()".}

proc newOlMap*(options: JsObject = jsUndefined): OlMap {.importjs: "(new Map(#))".}

proc getView*(map: OlMap): OlView {.importjs: "#.getView()".}
proc setView*(map: OlMap, view: OlView) {.importjs: "#.setView(#)".}
proc addLayer*(map: OlMap, layer: OlTileLayer) {.importjs: "#.addLayer(#)".}

proc fromLonLat*(coordinate: seq[float]): seq[float] {.importjs: "proj.fromLonLat(#)".}

proc fromLonLat*(
  coordinate: seq[float], projection: cstring
): seq[float] {.importjs: "proj.fromLonLat(#, #)".}

proc toLonLat*(coordinate: seq[float]): seq[float] {.importjs: "proj.toLonLat(#)".}

proc toLonLat*(
  coordinate: seq[float], projection: cstring
): seq[float] {.importjs: "proj.toLonLat(#, #)".}
