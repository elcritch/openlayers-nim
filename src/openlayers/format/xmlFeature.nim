import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_format_XMLFeature from 'ol/format/XMLFeature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_XMLFeature)".}

type
  XMLFeature* = ref object of JsRoot
proc newXMLFeature*(): XMLFeature {.importjs: "(new olNs_format_XMLFeature.default())".}
