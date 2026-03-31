import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_DataTile from 'ol/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_DataTile)".}

type
  DataTile* = ref object of JsRoot
proc newDataTile*(options: JsObject): DataTile {.importjs: "(new olNs_DataTile.default(#))".}
proc getSize*(self: DataTile): JsObject {.importjs: "#.getSize()".}
proc getData*(self: DataTile): JsObject {.importjs: "#.getData()".}
proc getError*(self: DataTile): JsObject {.importjs: "#.getError()".}

proc asImageLike*(data: JsObject): JsObject {.importjs: "olNs_DataTile.asImageLike(#)".}
proc asArrayLike*(data: JsObject): JsObject {.importjs: "olNs_DataTile.asArrayLike(#)".}
proc toArray*(image: JsObject): JsObject {.importjs: "olNs_DataTile.toArray(#)".}

proc getDisposedError*(): JsObject {.importjs: "(olNs_DataTile.disposedError)".}

type
  DataTileOptions* = ref object of JsRoot

proc newDataTileOptions*(): DataTileOptions {.importjs: "({})".}
proc `tileCoord=`*(options: DataTileOptions, value: JsObject) {.importjs: "#.tileCoord = #".}
proc `tileCoord=`*(options: DataTileOptions, value: RootRef) {.importjs: "#.tileCoord = #".}
proc `loader=`*(options: DataTileOptions, value: JsObject) {.importjs: "#.loader = #".}
proc `loader=`*(options: DataTileOptions, value: RootRef) {.importjs: "#.loader = #".}
proc `transition=`*(options: DataTileOptions, value: float) {.importjs: "#.transition = #".}
proc `interpolate=`*(options: DataTileOptions, value: bool) {.importjs: "#.interpolate = #".}
proc `size=`*(options: DataTileOptions, value: JsObject) {.importjs: "#.size = #".}
proc `size=`*(options: DataTileOptions, value: RootRef) {.importjs: "#.size = #".}
proc `controller=`*(options: DataTileOptions, value: JsObject) {.importjs: "#.controller = #".}
proc `controller=`*(options: DataTileOptions, value: RootRef) {.importjs: "#.controller = #".}

proc newDataTile*(options: DataTileOptions): DataTile {.importjs: "(new olNs_DataTile.default(#))".}
