import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Map from 'ol/Map.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Map)".}

type
  OlMapOptions* = ref object of JsRoot
  OlMap* = ref object of JsRoot

proc newOlMapOptions*(): OlMapOptions {.importjs: "({})".}
proc `controls=`*(options: OlMapOptions, value: JsObject) {.importjs: "#.controls = #".}
proc `pixelRatio=`*(
  options: OlMapOptions, value: float
) {.importjs: "#.pixelRatio = #".}

proc `interactions=`*(
  options: OlMapOptions, value: JsObject
) {.importjs: "#.interactions = #".}

proc `keyboardEventTarget=`*(
  options: OlMapOptions, value: cstring
) {.importjs: "#.keyboardEventTarget = #".}

proc `keyboardEventTarget=`*(
  options: OlMapOptions, value: JsObject
) {.importjs: "#.keyboardEventTarget = #".}

proc `layers=`*(options: OlMapOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `maxTilesLoading=`*(
  options: OlMapOptions, value: float
) {.importjs: "#.maxTilesLoading = #".}

proc `moveTolerance=`*(
  options: OlMapOptions, value: float
) {.importjs: "#.moveTolerance = #".}

proc `overlays=`*(options: OlMapOptions, value: JsObject) {.importjs: "#.overlays = #".}
proc `target=`*(options: OlMapOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: OlMapOptions, value: JsObject) {.importjs: "#.target = #".}
proc `view=`*(options: OlMapOptions, value: JsObject) {.importjs: "#.view = #".}
proc `view=`*(options: OlMapOptions, value: RootRef) {.importjs: "#.view = #".}

proc newOlMap*(): OlMap {.importjs: "(new olNs_Map.default())".}
proc newOlMap*(options: JsObject): OlMap {.importjs: "(new olNs_Map.default(#))".}
proc newOlMap*(options: OlMapOptions): OlMap {.importjs: "(new olNs_Map.default(#))".}
