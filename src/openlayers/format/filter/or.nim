import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_filter_Or from 'ol/format/filter/Or.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Or)".}

type
  Or* = ref object of JsRoot
proc newOr*(args: JsObject = jsUndefined): Or {.importjs: "(new olNs_format_filter_Or.default(#))".}
