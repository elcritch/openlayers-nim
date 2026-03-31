import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Map from 'ol/Map.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Map)".}

type
  MapOptions* = ref object of JsRoot
  Map* = ref object of JsRoot

proc newMapOptions*(): MapOptions {.importjs: "({})".}
proc `controls=`*(options: MapOptions, value: JsObject) {.importjs: "#.controls = #".}
proc `pixelRatio=`*(
  options: MapOptions, value: float
) {.importjs: "#.pixelRatio = #".}

proc `interactions=`*(
  options: MapOptions, value: JsObject
) {.importjs: "#.interactions = #".}

proc `keyboardEventTarget=`*(
  options: MapOptions, value: cstring
) {.importjs: "#.keyboardEventTarget = #".}

proc `keyboardEventTarget=`*(
  options: MapOptions, value: JsObject
) {.importjs: "#.keyboardEventTarget = #".}

proc `layers=`*(options: MapOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `maxTilesLoading=`*(
  options: MapOptions, value: float
) {.importjs: "#.maxTilesLoading = #".}

proc `moveTolerance=`*(
  options: MapOptions, value: float
) {.importjs: "#.moveTolerance = #".}

proc `overlays=`*(options: MapOptions, value: JsObject) {.importjs: "#.overlays = #".}
proc `target=`*(options: MapOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: MapOptions, value: JsObject) {.importjs: "#.target = #".}
proc `view=`*(options: MapOptions, value: JsObject) {.importjs: "#.view = #".}
proc `view=`*(options: MapOptions, value: RootRef) {.importjs: "#.view = #".}

proc newMap*(): Map {.importjs: "(new olNs_Map.default())".}
proc newMap*(options: JsObject): Map {.importjs: "(new olNs_Map.default(#))".}
proc newMap*(options: MapOptions): Map {.importjs: "(new olNs_Map.default(#))".}
