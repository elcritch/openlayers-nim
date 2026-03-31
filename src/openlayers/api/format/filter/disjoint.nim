import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Disjoint from 'ol/format/filter/Disjoint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Disjoint)".}

type
  OlDisjoint* = ref object of JsRoot
proc newOlDisjoint*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): OlDisjoint {.importjs: "(new olNs_format_filter_Disjoint.default(#, #, #))".}
