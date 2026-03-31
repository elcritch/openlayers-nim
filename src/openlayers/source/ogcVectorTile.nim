import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_OGCVectorTile from 'ol/source/OGCVectorTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_OGCVectorTile)".}

type OGCVectorTile* = ref object of JsRoot
proc newOGCVectorTile*(
  options: JsObject
): OGCVectorTile {.importjs: "(new olNs_source_OGCVectorTile.default(#))".}

type OGCVectorTileOptions* = ref object of JsRoot

proc newOGCVectorTileOptions*(): OGCVectorTileOptions {.importjs: "({})".}
proc `url=`*(options: OGCVectorTileOptions, value: cstring) {.importjs: "#.url = #".}
proc `context=`*(
  options: OGCVectorTileOptions, value: JsObject
) {.importjs: "#.context = #".}

proc `context=`*(
  options: OGCVectorTileOptions, value: RootRef
) {.importjs: "#.context = #".}

proc `format=`*(
  options: OGCVectorTileOptions, value: JsObject
) {.importjs: "#.format = #".}

proc `format=`*(
  options: OGCVectorTileOptions, value: RootRef
) {.importjs: "#.format = #".}

proc `mediaType=`*(
  options: OGCVectorTileOptions, value: cstring
) {.importjs: "#.mediaType = #".}

proc `attributions=`*(
  options: OGCVectorTileOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: OGCVectorTileOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `attributionsCollapsible=`*(
  options: OGCVectorTileOptions, value: bool
) {.importjs: "#.attributionsCollapsible = #".}

proc `cacheSize=`*(
  options: OGCVectorTileOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `overlaps=`*(
  options: OGCVectorTileOptions, value: bool
) {.importjs: "#.overlaps = #".}

proc `projection=`*(
  options: OGCVectorTileOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: OGCVectorTileOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `tileClass=`*(
  options: OGCVectorTileOptions, value: JsObject
) {.importjs: "#.tileClass = #".}

proc `tileClass=`*(
  options: OGCVectorTileOptions, value: RootRef
) {.importjs: "#.tileClass = #".}

proc `transition=`*(
  options: OGCVectorTileOptions, value: float
) {.importjs: "#.transition = #".}

proc `wrapX=`*(options: OGCVectorTileOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `zDirection=`*(
  options: OGCVectorTileOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: OGCVectorTileOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: OGCVectorTileOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc `collections=`*(
  options: OGCVectorTileOptions, value: seq[cstring]
) {.importjs: "#.collections = #".}

proc newOGCVectorTile*(
  options: OGCVectorTileOptions
): OGCVectorTile {.importjs: "(new olNs_source_OGCVectorTile.default(#))".}
