import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_format_filter_Contains from 'ol/format/filter/Contains.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Contains)".}

type Contains* = ref object of JsRoot
proc newContains*(
  geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined
): Contains {.importjs: "(new olNs_format_filter_Contains.default(#, #, #))".}
