import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_reproj_Image from 'ol/reproj/Image.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_reproj_Image)".}

type
  OlReprojImage* = ref object of JsRoot
proc newOlReprojImage*(sourceProj: JsObject, targetProj: JsObject, targetExtent: JsObject, targetResolution: float, pixelRatio: float, getImageFunction: JsObject, interpolate: bool): OlReprojImage {.importjs: "(new olNs_reproj_Image.default(#, #, #, #, #, #, #))".}
proc getProjection*(self: OlReprojImage): JsObject {.importjs: "#.getProjection()".}
