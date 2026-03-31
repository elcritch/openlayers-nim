import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Not from 'ol/format/filter/Not.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Not)".}

type Not* = ref object of JsRoot
proc newNot*(
  condition: JsObject
): Not {.importjs: "(new olNs_format_filter_Not.default(#))".}
