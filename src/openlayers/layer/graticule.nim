import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer_Graticule from 'ol/layer/Graticule.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer_Graticule)".}

type
  Graticule* = ref object of JsRoot
proc newGraticule*(): Graticule {.importjs: "(new olNs_layer_Graticule.default())".}

type
  GraticuleOptions* = ref object of JsRoot

proc newGraticuleOptions*(): GraticuleOptions {.importjs: "({})".}
proc `className=`*(options: GraticuleOptions, value: cstring) {.importjs: "#.className = #".}
proc `opacity=`*(options: GraticuleOptions, value: float) {.importjs: "#.opacity = #".}
proc `visible=`*(options: GraticuleOptions, value: bool) {.importjs: "#.visible = #".}
proc `extent=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.extent = #".}
proc `extent=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `zIndex=`*(options: GraticuleOptions, value: float) {.importjs: "#.zIndex = #".}
proc `minResolution=`*(options: GraticuleOptions, value: float) {.importjs: "#.minResolution = #".}
proc `maxResolution=`*(options: GraticuleOptions, value: float) {.importjs: "#.maxResolution = #".}
proc `minZoom=`*(options: GraticuleOptions, value: float) {.importjs: "#.minZoom = #".}
proc `maxZoom=`*(options: GraticuleOptions, value: float) {.importjs: "#.maxZoom = #".}
proc `maxLines=`*(options: GraticuleOptions, value: float) {.importjs: "#.maxLines = #".}
proc `strokeStyle=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.strokeStyle = #".}
proc `strokeStyle=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.strokeStyle = #".}
proc `targetSize=`*(options: GraticuleOptions, value: float) {.importjs: "#.targetSize = #".}
proc `showLabels=`*(options: GraticuleOptions, value: bool) {.importjs: "#.showLabels = #".}
proc `lonLabelFormatter=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.lonLabelFormatter = #".}
proc `lonLabelFormatter=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.lonLabelFormatter = #".}
proc `latLabelFormatter=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.latLabelFormatter = #".}
proc `latLabelFormatter=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.latLabelFormatter = #".}
proc `lonLabelPosition=`*(options: GraticuleOptions, value: float) {.importjs: "#.lonLabelPosition = #".}
proc `latLabelPosition=`*(options: GraticuleOptions, value: float) {.importjs: "#.latLabelPosition = #".}
proc `lonLabelStyle=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.lonLabelStyle = #".}
proc `lonLabelStyle=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.lonLabelStyle = #".}
proc `latLabelStyle=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.latLabelStyle = #".}
proc `latLabelStyle=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.latLabelStyle = #".}
proc `intervals=`*(options: GraticuleOptions, value: seq[float]) {.importjs: "#.intervals = #".}
proc `wrapX=`*(options: GraticuleOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `properties=`*(options: GraticuleOptions, value: JsObject) {.importjs: "#.properties = #".}
proc `properties=`*(options: GraticuleOptions, value: RootRef) {.importjs: "#.properties = #".}

proc newGraticule*(options: GraticuleOptions): Graticule {.importjs: "(new olNs_layer_Graticule.default(#))".}
