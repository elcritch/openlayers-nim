import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_Overlay from 'ol/Overlay.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Overlay)".}

type
  Overlay* = ref object of JsRoot
proc newOverlay*(): Overlay {.importjs: "(new olNs_Overlay.default())".}

type
  OverlayOptions* = ref object of JsRoot

proc newOverlayOptions*(): OverlayOptions {.importjs: "({})".}
proc `id=`*(options: OverlayOptions, value: cstring) {.importjs: "#.id = #".}
proc `id=`*(options: OverlayOptions, value: float) {.importjs: "#.id = #".}
proc `element=`*(options: OverlayOptions, value: JsObject) {.importjs: "#.element = #".}
proc `element=`*(options: OverlayOptions, value: RootRef) {.importjs: "#.element = #".}
proc `offset=`*(options: OverlayOptions, value: seq[float]) {.importjs: "#.offset = #".}
proc `position=`*(options: OverlayOptions, value: JsObject) {.importjs: "#.position = #".}
proc `position=`*(options: OverlayOptions, value: RootRef) {.importjs: "#.position = #".}
proc `positioning=`*(options: OverlayOptions, value: JsObject) {.importjs: "#.positioning = #".}
proc `positioning=`*(options: OverlayOptions, value: RootRef) {.importjs: "#.positioning = #".}
proc `stopEvent=`*(options: OverlayOptions, value: bool) {.importjs: "#.stopEvent = #".}
proc `insertFirst=`*(options: OverlayOptions, value: bool) {.importjs: "#.insertFirst = #".}
proc `autoPan=`*(options: OverlayOptions, value: bool) {.importjs: "#.autoPan = #".}
proc `autoPan=`*(options: OverlayOptions, value: JsObject) {.importjs: "#.autoPan = #".}
proc `autoPan=`*(options: OverlayOptions, value: RootRef) {.importjs: "#.autoPan = #".}
proc `className=`*(options: OverlayOptions, value: cstring) {.importjs: "#.className = #".}

proc newOverlay*(options: OverlayOptions): Overlay {.importjs: "(new olNs_Overlay.default(#))".}

type
  PanIntoViewOptions* = ref object of JsRoot

proc newPanIntoViewOptions*(): PanIntoViewOptions {.importjs: "({})".}
proc `animation=`*(options: PanIntoViewOptions, value: JsObject) {.importjs: "#.animation = #".}
proc `animation=`*(options: PanIntoViewOptions, value: RootRef) {.importjs: "#.animation = #".}
proc `margin=`*(options: PanIntoViewOptions, value: float) {.importjs: "#.margin = #".}

type
  PanOptions* = ref object of JsRoot

proc newPanOptions*(): PanOptions {.importjs: "({})".}
proc `duration=`*(options: PanOptions, value: float) {.importjs: "#.duration = #".}
proc `easing=`*(options: PanOptions, value: JsObject) {.importjs: "#.easing = #".}
proc `easing=`*(options: PanOptions, value: RootRef) {.importjs: "#.easing = #".}
