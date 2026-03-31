import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_CartoDB from 'ol/source/CartoDB.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_CartoDB)".}

type CartoDB* = ref object of JsRoot
proc newCartoDB*(
  options: JsObject
): CartoDB {.importjs: "(new olNs_source_CartoDB.default(#))".}

proc getConfig*(self: CartoDB): JsObject {.importjs: "#.getConfig()".}
proc updateConfig*(self: CartoDB, config: JsObject) {.importjs: "#.updateConfig(#)".}
proc setConfig*(self: CartoDB, config: JsObject) {.importjs: "#.setConfig(#)".}

type CartoDBOptions* = ref object of JsRoot

proc newCartoDBOptions*(): CartoDBOptions {.importjs: "({})".}
proc `attributions=`*(
  options: CartoDBOptions, value: JsObject
) {.importjs: "#.attributions = #".}

proc `attributions=`*(
  options: CartoDBOptions, value: RootRef
) {.importjs: "#.attributions = #".}

proc `cacheSize=`*(
  options: CartoDBOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc `crossOrigin=`*(
  options: CartoDBOptions, value: cstring
) {.importjs: "#.crossOrigin = #".}

proc `projection=`*(
  options: CartoDBOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: CartoDBOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `maxZoom=`*(options: CartoDBOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `minZoom=`*(options: CartoDBOptions, value: float) {.importjs: "#.minZoom = #".}
proc `wrapX=`*(options: CartoDBOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `config=`*(options: CartoDBOptions, value: JsObject) {.importjs: "#.config = #".}
proc `config=`*(options: CartoDBOptions, value: RootRef) {.importjs: "#.config = #".}
proc `map=`*(options: CartoDBOptions, value: cstring) {.importjs: "#.map = #".}
proc `account=`*(options: CartoDBOptions, value: cstring) {.importjs: "#.account = #".}
proc `transition=`*(
  options: CartoDBOptions, value: float
) {.importjs: "#.transition = #".}

proc `zDirection=`*(
  options: CartoDBOptions, value: float
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: CartoDBOptions, value: JsObject
) {.importjs: "#.zDirection = #".}

proc `zDirection=`*(
  options: CartoDBOptions, value: RootRef
) {.importjs: "#.zDirection = #".}

proc newCartoDB*(
  options: CartoDBOptions
): CartoDB {.importjs: "(new olNs_source_CartoDB.default(#))".}
