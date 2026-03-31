import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_XMLFeature from 'ol/format/XMLFeature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_XMLFeature)".}

type
  OlXMLFeature* = ref object of JsRoot
proc newOlXMLFeature*(): OlXMLFeature {.importjs: "(new olNs_format_XMLFeature.default())".}
