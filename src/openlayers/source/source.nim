import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Source from 'ol/source/Source.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Source)".}

type
  OlSource* = ref object of JsRoot
proc newOlSource*(): OlSource {.importjs: "(new olNs_source_Source.default())".}
