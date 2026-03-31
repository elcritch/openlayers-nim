import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_And from 'ol/format/filter/And.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_And)".}

type
  OlAnd* = ref object of JsRoot
proc newOlAnd*(args: JsObject = jsUndefined): OlAnd {.importjs: "(new olNs_format_filter_And.default(#))".}
