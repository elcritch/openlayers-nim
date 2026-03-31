import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_IsLike from 'ol/format/filter/IsLike.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_IsLike)".}

type
  IsLike* = ref object of JsRoot
proc newIsLike*(propertyName: cstring, pattern: cstring, wildCard: JsObject = jsUndefined, singleChar: JsObject = jsUndefined, escapeChar: JsObject = jsUndefined, matchCase: JsObject = jsUndefined): IsLike {.importjs: "(new olNs_format_filter_IsLike.default(#, #, #, #, #, #))".}
