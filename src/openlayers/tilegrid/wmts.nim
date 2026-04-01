import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_tilegrid_WMTS from 'ol/tilegrid/WMTS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_tilegrid_WMTS)".}

type
  WMTSTileGrid* = ref object of JsRoot
proc newWMTSTileGrid*(options: JsObject): WMTSTileGrid {.importjs: "(new olNs_tilegrid_WMTS.default(#))".}
proc getMatrixId*(self: WMTSTileGrid, z: float): cstring {.importjs: "#.getMatrixId(#)".}
proc getMatrixIds*(self: WMTSTileGrid): seq[cstring] {.importjs: "#.getMatrixIds()".}

proc createFromCapabilitiesMatrixSet*(matrixSet: JsObject, extent: JsObject = jsUndefined, matrixLimits: JsObject = jsUndefined): JsObject {.importjs: "olNs_tilegrid_WMTS.createFromCapabilitiesMatrixSet(#, #, #)".}

type
  WMTSTileGridOptions* = ref object of JsRoot

proc newWMTSTileGridOptions*(): WMTSTileGridOptions {.importjs: "({})".}
proc `extent=`*(options: WMTSTileGridOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: WMTSTileGridOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `origin=`*(options: WMTSTileGridOptions, value: JsObject) {.importjs: "#.origin = #".}
proc `origin=`*(options: WMTSTileGridOptions, value: RootRef) {.importjs: "#.origin = #".}
proc `origins=`*(options: WMTSTileGridOptions, value: JsObject) {.importjs: "#.origins = #".}
proc `origins=`*(options: WMTSTileGridOptions, value: RootRef) {.importjs: "#.origins = #".}
proc `origins=`*[T](options: WMTSTileGridOptions, value: seq[T]) {.importjs: "#.origins = #".}
proc `resolutions=`*(options: WMTSTileGridOptions, value: seq[float]) {.importjs: "#.resolutions = #".}
proc `matrixIds=`*(options: WMTSTileGridOptions, value: seq[cstring]) {.importjs: "#.matrixIds = #".}
proc `sizes=`*(options: WMTSTileGridOptions, value: JsObject) {.importjs: "#.sizes = #".}
proc `sizes=`*(options: WMTSTileGridOptions, value: RootRef) {.importjs: "#.sizes = #".}
proc `sizes=`*[T](options: WMTSTileGridOptions, value: seq[T]) {.importjs: "#.sizes = #".}
proc `tileSize=`*(options: WMTSTileGridOptions, value: float) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: WMTSTileGridOptions, value: JsObject) {.importjs: "#.tileSize = #".}
proc `tileSize=`*(options: WMTSTileGridOptions, value: RootRef) {.importjs: "#.tileSize = #".}
proc `tileSizes=`*(options: WMTSTileGridOptions, value: JsObject) {.importjs: "#.tileSizes = #".}
proc `tileSizes=`*(options: WMTSTileGridOptions, value: RootRef) {.importjs: "#.tileSizes = #".}
proc `tileSizes=`*[T](options: WMTSTileGridOptions, value: seq[T]) {.importjs: "#.tileSizes = #".}

proc newWMTSTileGrid*(options: WMTSTileGridOptions): WMTSTileGrid {.importjs: "(new olNs_tilegrid_WMTS.default(#))".}
