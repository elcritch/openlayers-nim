import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_Not from 'ol/format/filter/Not.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_Not)".}

type
  OlNot* = ref object of JsRoot
proc newOlNot*(condition: JsObject): OlNot {.importjs: "(new olNs_format_filter_Not.default(#))".}
