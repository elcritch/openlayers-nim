import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_OWS from 'ol/format/OWS.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_OWS)".}

type
  OlOWS* = ref object of JsRoot
proc newOlOWS*(): OlOWS {.importjs: "(new olNs_format_OWS.default())".}
