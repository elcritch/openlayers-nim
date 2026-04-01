import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_Disjoint from 'ol/format/filter/Disjoint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Disjoint)".}

type
  Disjoint* = ref object of JsRoot
proc newDisjoint*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): Disjoint {.importjs: "(new olNs_format_filter_Disjoint.default(#, #, #))".}
