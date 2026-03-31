import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_BaseTile from 'ol/layer/BaseTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_BaseTile)".}

type BaseTileLayer* = ref object of JsRoot
proc newBaseTileLayer*(): BaseTileLayer {.
  importjs: "(new olNs_layer_BaseTile.default())"
.}

type BaseTileLayerOptions* = ref object of JsRoot

proc newBaseTileLayerOptions*(): BaseTileLayerOptions {.importjs: "({})".}
proc `className=`*(
  options: BaseTileLayerOptions, value: cstring
) {.importjs: "#.className = #".}

proc `opacity=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.opacity = #".}

proc `visible=`*(
  options: BaseTileLayerOptions, value: bool
) {.importjs: "#.visible = #".}

proc `extent=`*(
  options: BaseTileLayerOptions, value: JsObject
) {.importjs: "#.extent = #".}

proc `extent=`*(
  options: BaseTileLayerOptions, value: RootRef
) {.importjs: "#.extent = #".}

proc `zIndex=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.zIndex = #".}

proc `minResolution=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxResolution=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minZoom=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.minZoom = #".}

proc `maxZoom=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.maxZoom = #".}

proc `preload=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.preload = #".}

proc `source=`*(
  options: BaseTileLayerOptions, value: JsObject
) {.importjs: "#.source = #".}

proc `source=`*(
  options: BaseTileLayerOptions, value: RootRef
) {.importjs: "#.source = #".}

proc `map=`*(options: BaseTileLayerOptions, value: JsObject) {.importjs: "#.map = #".}
proc `map=`*(options: BaseTileLayerOptions, value: RootRef) {.importjs: "#.map = #".}
proc `background=`*(
  options: BaseTileLayerOptions, value: JsObject
) {.importjs: "#.background = #".}

proc `background=`*(
  options: BaseTileLayerOptions, value: RootRef
) {.importjs: "#.background = #".}

proc `useInterimTilesOnError=`*(
  options: BaseTileLayerOptions, value: bool
) {.importjs: "#.useInterimTilesOnError = #".}

proc `properties=`*(
  options: BaseTileLayerOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc `properties=`*(
  options: BaseTileLayerOptions, value: RootRef
) {.importjs: "#.properties = #".}

proc `cacheSize=`*(
  options: BaseTileLayerOptions, value: float
) {.importjs: "#.cacheSize = #".}

proc newBaseTileLayer*(
  options: BaseTileLayerOptions
): BaseTileLayer {.importjs: "(new olNs_layer_BaseTile.default(#))".}
