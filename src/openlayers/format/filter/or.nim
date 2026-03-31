import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Or from 'ol/format/filter/Or.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Or)".}

type
  OlOr* = ref object of JsRoot
proc newOlOr*(args: JsObject = jsUndefined): OlOr {.importjs: "(new olNs_format_filter_Or.default(#))".}
