import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_IIIF from 'ol/source/IIIF.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_IIIF)".}

type
  OlIIIF* = ref object of JsRoot
proc newOlIIIF*(options: JsObject = jsUndefined): OlIIIF {.importjs: "(new olNs_source_IIIF.default(#))".}
