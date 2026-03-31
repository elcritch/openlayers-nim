import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_XYZ from 'ol/source/XYZ.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_XYZ)".}

type
  OlXYZ* = ref object of JsRoot
proc newOlXYZ*(options: JsObject = jsUndefined): OlXYZ {.importjs: "(new olNs_source_XYZ.default(#))".}
