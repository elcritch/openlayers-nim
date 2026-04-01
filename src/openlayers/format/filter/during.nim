import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_During from 'ol/format/filter/During.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_During)".}

type
  During* = ref object of JsRoot
proc newDuring*(propertyName: cstring, begin: cstring, endVal: cstring): During {.importjs: "(new olNs_format_filter_During.default(#, #, #))".}
