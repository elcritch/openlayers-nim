import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_Feature from 'ol/format/Feature.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_Feature)".}

type
  FeatureFormat* = ref object of JsRoot
proc newFeatureFormat*(): FeatureFormat {.importjs: "(new olNs_format_Feature.default())".}

proc transformGeometryWithOptions*(geometry: JsObject, write: bool, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.transformGeometryWithOptions(#, #, #)".}
proc transformExtentWithOptions*(extent: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.transformExtentWithOptions(#, #)".}
proc createRenderFeature*(objectVal: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.createRenderFeature(#, #)".}
proc createGeometry*(objectVal: JsObject, options: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_Feature.createGeometry(#, #)".}
