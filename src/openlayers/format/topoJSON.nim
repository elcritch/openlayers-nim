import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_TopoJSON from 'ol/format/TopoJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_TopoJSON)".}

type
  TopoJSON* = ref object of JsRoot
proc newTopoJSON*(): TopoJSON {.importjs: "(new olNs_format_TopoJSON.default())".}

type
  TopoJSONOptions* = ref object of JsRoot

proc newTopoJSONOptions*(): TopoJSONOptions {.importjs: "({})".}
proc `dataProjection=`*(options: TopoJSONOptions, value: JsObject) {.importjs: "#.dataProjection = #".}
proc `dataProjection=`*(options: TopoJSONOptions, value: RootRef) {.importjs: "#.dataProjection = #".}
proc `layerName=`*(options: TopoJSONOptions, value: cstring) {.importjs: "#.layerName = #".}
proc `layers=`*(options: TopoJSONOptions, value: seq[cstring]) {.importjs: "#.layers = #".}

proc newTopoJSON*(options: TopoJSONOptions): TopoJSON {.importjs: "(new olNs_format_TopoJSON.default(#))".}
