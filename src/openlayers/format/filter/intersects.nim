import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit:
      "import * as olNs_format_filter_Intersects from 'ol/format/filter/Intersects.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Intersects)".}

type Intersects* = ref object of JsRoot
proc newIntersects*(
  geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined
): Intersects {.importjs: "(new olNs_format_filter_Intersects.default(#, #, #))".}
