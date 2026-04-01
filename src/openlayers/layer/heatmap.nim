import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_layer_Heatmap from 'ol/layer/Heatmap.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Heatmap)".}

type Heatmap* = ref object of JsRoot
proc newHeatmap*(): Heatmap {.importjs: "(new olNs_layer_Heatmap.default())".}
proc getBlur*(self: Heatmap): float {.importjs: "#.getBlur()".}
proc setBlur*(self: Heatmap, blur: float) {.importjs: "#.setBlur(#)".}
proc getRadius*(self: Heatmap): float {.importjs: "#.getRadius()".}
proc setRadius*(self: Heatmap, radius: float) {.importjs: "#.setRadius(#)".}

type HeatmapOptions* = ref object of JsRoot

proc newHeatmapOptions*(): HeatmapOptions {.importjs: "({})".}
proc `className=`*(
  options: HeatmapOptions, value: cstring
) {.importjs: "#.className = #".}

proc `opacity=`*(options: HeatmapOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: HeatmapOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: HeatmapOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: HeatmapOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: HeatmapOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(
  options: HeatmapOptions, value: float
) {.importjs: "#.minResolution = #".}

proc `maxResolution=`*(
  options: HeatmapOptions, value: float
) {.importjs: "#.maxResolution = #".}

proc `minZoom=`*(options: HeatmapOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: HeatmapOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `gradient=`*(
  options: HeatmapOptions, value: seq[cstring]
) {.importjs: "#.gradient = #".}

proc `radius=`*(options: HeatmapOptions, value: JsObject) {.importjs: "#.radius = #".}
proc `radius=`*(options: HeatmapOptions, value: RootRef) {.importjs: "#.radius = #".}
proc `blur=`*(options: HeatmapOptions, value: JsObject) {.importjs: "#.blur = #".}
proc `blur=`*(options: HeatmapOptions, value: RootRef) {.importjs: "#.blur = #".}
proc `weight=`*(options: HeatmapOptions, value: JsObject) {.importjs: "#.weight = #".}
proc `weight=`*(options: HeatmapOptions, value: RootRef) {.importjs: "#.weight = #".}
proc `weight=`*(
  options: HeatmapOptions, value: proc(feature: JsObject): float
) {.importjs: "#.weight = #".}

proc `filter=`*(options: HeatmapOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `filter=`*(options: HeatmapOptions, value: RootRef) {.importjs: "#.filter = #".}
proc `variables=`*(
  options: HeatmapOptions, value: JsObject
) {.importjs: "#.variables = #".}

proc `variables=`*(
  options: HeatmapOptions, value: RootRef
) {.importjs: "#.variables = #".}

proc `variables=`*[T](
  options: HeatmapOptions, value: seq[T]
) {.importjs: "#.variables = #".}

proc `source=`*(options: HeatmapOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: HeatmapOptions, value: RootRef) {.importjs: "#.source = #".}
proc `properties=`*(
  options: HeatmapOptions, value: JsObject
) {.importjs: "#.properties = #".}

proc `properties=`*(
  options: HeatmapOptions, value: RootRef
) {.importjs: "#.properties = #".}

proc newHeatmap*(
  options: HeatmapOptions
): Heatmap {.importjs: "(new olNs_layer_Heatmap.default(#))".}
