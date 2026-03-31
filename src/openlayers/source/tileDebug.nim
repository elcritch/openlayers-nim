import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_TileDebug from 'ol/source/TileDebug.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_TileDebug)".}

type
  TileDebug* = ref object of JsRoot
proc newTileDebug*(options: JsObject = jsUndefined): TileDebug {.importjs: "(new olNs_source_TileDebug.default(#))".}

type
  TileDebugOptions* = ref object of JsRoot

proc newTileDebugOptions*(): TileDebugOptions {.importjs: "({})".}
proc `projection=`*(options: TileDebugOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: TileDebugOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `tileGrid=`*(options: TileDebugOptions, value: JsObject) {.importjs: "#.tileGrid = #".}
proc `tileGrid=`*(options: TileDebugOptions, value: RootRef) {.importjs: "#.tileGrid = #".}
proc `wrapX=`*(options: TileDebugOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(options: TileDebugOptions, value: float) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileDebugOptions, value: JsObject) {.importjs: "#.zDirection = #".}
proc `zDirection=`*(options: TileDebugOptions, value: RootRef) {.importjs: "#.zDirection = #".}
proc `source=`*(options: TileDebugOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: TileDebugOptions, value: RootRef) {.importjs: "#.source = #".}
proc `templateVal=`*(options: TileDebugOptions, value: cstring) {.importjs: "#.template = #".}
proc `color=`*(options: TileDebugOptions, value: cstring) {.importjs: "#.color = #".}

proc newTileDebug*(options: TileDebugOptions): TileDebug {.importjs: "(new olNs_source_TileDebug.default(#))".}
