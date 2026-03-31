import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_TextFeature from 'ol/format/TextFeature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_TextFeature)".}

type TextFeature* = ref object of JsRoot
proc newTextFeature*(): TextFeature {.
  importjs: "(new olNs_format_TextFeature.default())"
.}
