import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olFeatureModule from 'ol/Feature.js';".}
{.emit: "import Feature from 'ol/Feature.js';".}

proc hasFeatureModule*(): bool {.importjs: "(typeof olFeatureModule !== 'undefined')".}
proc hasFeatureConstructor*(): bool {.importjs: "(typeof Feature === 'function')".}

type OlFeature* = ref object of JsRoot

proc newOlFeature*(): OlFeature {.importjs: "(new Feature())".}

proc createStyleFunction*(
  obj: JsObject
): JsObject {.importjs: "olFeatureModule.createStyleFunction(#)".}
