import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Feature from 'ol/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Feature)".}

type Feature* = ref object of JsRoot
proc newFeature*(): Feature {.importjs: "(new olNs_Feature.default())".}

proc createStyleFunction*(
  obj: JsObject
): JsObject {.importjs: "olNs_Feature.createStyleFunction(#)".}
