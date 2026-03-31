import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Source from 'ol/source/Source.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Source)".}

type
  Source* = ref object of JsRoot
proc newSource*(): Source {.importjs: "(new olNs_source_Source.default())".}

type
  SourceOptions* = ref object of JsRoot

proc newSourceOptions*(): SourceOptions {.importjs: "({})".}
proc `attributions=`*(options: SourceOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: SourceOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: SourceOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: SourceOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `attributionsCollapsible=`*(options: SourceOptions, value: bool) {.importjs: "#.attributionsCollapsible = #".}
proc `projection=`*(options: SourceOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: SourceOptions, value: RootRef) {.importjs: "#.projection = #".}
proc `state=`*(options: SourceOptions, value: JsObject) {.importjs: "#.state = #".}
proc `state=`*(options: SourceOptions, value: RootRef) {.importjs: "#.state = #".}
proc `wrapX=`*(options: SourceOptions, value: bool) {.importjs: "#.wrapX = #".}
proc `interpolate=`*(options: SourceOptions, value: bool) {.importjs: "#.interpolate = #".}

proc newSource*(options: SourceOptions): Source {.importjs: "(new olNs_source_Source.default(#))".}
