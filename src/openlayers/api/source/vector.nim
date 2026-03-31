import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Vector from 'ol/source/Vector.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Vector)".}

type
  OlVectorSource* = ref object of JsRoot
proc newOlVectorSource*(): OlVectorSource {.importjs: "(new olNs_source_Vector.default())".}
