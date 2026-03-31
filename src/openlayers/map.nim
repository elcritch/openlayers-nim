import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Map from 'ol/Map.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Map)".}

type
  Map* = ref object of JsRoot
proc newMap*(): Map {.importjs: "(new olNs_Map.default())".}

type
  AtPixelOptions* = ref object of JsRoot

proc newAtPixelOptions*(): AtPixelOptions {.importjs: "({})".}
proc `layerFilter=`*(options: AtPixelOptions, value: JsObject) {.importjs: "#.layerFilter = #".}
proc `layerFilter=`*(options: AtPixelOptions, value: RootRef) {.importjs: "#.layerFilter = #".}
proc `hitTolerance=`*(options: AtPixelOptions, value: float) {.importjs: "#.hitTolerance = #".}
proc `checkWrapped=`*(options: AtPixelOptions, value: bool) {.importjs: "#.checkWrapped = #".}

type
  MapOptions* = ref object of JsRoot

proc newMapOptions*(): MapOptions {.importjs: "({})".}
proc `controls=`*(options: MapOptions, value: JsObject) {.importjs: "#.controls = #".}
proc `controls=`*(options: MapOptions, value: RootRef) {.importjs: "#.controls = #".}
proc `controls=`*[T](options: MapOptions, value: seq[T]) {.importjs: "#.controls = #".}
proc `pixelRatio=`*(options: MapOptions, value: float) {.importjs: "#.pixelRatio = #".}
proc `interactions=`*(options: MapOptions, value: JsObject) {.importjs: "#.interactions = #".}
proc `interactions=`*(options: MapOptions, value: RootRef) {.importjs: "#.interactions = #".}
proc `interactions=`*[T](options: MapOptions, value: seq[T]) {.importjs: "#.interactions = #".}
proc `keyboardEventTarget=`*(options: MapOptions, value: cstring) {.importjs: "#.keyboardEventTarget = #".}
proc `keyboardEventTarget=`*(options: MapOptions, value: JsObject) {.importjs: "#.keyboardEventTarget = #".}
proc `keyboardEventTarget=`*(options: MapOptions, value: RootRef) {.importjs: "#.keyboardEventTarget = #".}
proc `layers=`*(options: MapOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `layers=`*(options: MapOptions, value: RootRef) {.importjs: "#.layers = #".}
proc `layers=`*[T](options: MapOptions, value: seq[T]) {.importjs: "#.layers = #".}
proc `maxTilesLoading=`*(options: MapOptions, value: float) {.importjs: "#.maxTilesLoading = #".}
proc `moveTolerance=`*(options: MapOptions, value: float) {.importjs: "#.moveTolerance = #".}
proc `overlays=`*(options: MapOptions, value: JsObject) {.importjs: "#.overlays = #".}
proc `overlays=`*(options: MapOptions, value: RootRef) {.importjs: "#.overlays = #".}
proc `overlays=`*[T](options: MapOptions, value: seq[T]) {.importjs: "#.overlays = #".}
proc `target=`*(options: MapOptions, value: cstring) {.importjs: "#.target = #".}
proc `target=`*(options: MapOptions, value: JsObject) {.importjs: "#.target = #".}
proc `target=`*(options: MapOptions, value: RootRef) {.importjs: "#.target = #".}
proc `view=`*(options: MapOptions, value: JsObject) {.importjs: "#.view = #".}
proc `view=`*(options: MapOptions, value: RootRef) {.importjs: "#.view = #".}

proc newMap*(options: MapOptions): Map {.importjs: "(new olNs_Map.default(#))".}
