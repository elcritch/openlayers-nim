import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olFeatureModule from 'ol/Feature.js';".}
when defined(esmModules):
  {.emit: "import Feature from 'ol/Feature.js';".}

type OlFeature* = ref object of JsRoot

proc newOlFeature*(): OlFeature {.importjs: "(new Feature())".}

proc createStyleFunction*(
  obj: JsObject
): JsObject {.importjs: "olFeatureModule.createStyleFunction(#)".}
