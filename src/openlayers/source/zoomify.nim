import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Zoomify from 'ol/source/Zoomify.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Zoomify)".}

type
  Zoomify* = ref object of JsRoot
proc newZoomify*(options: JsObject): Zoomify {.importjs: "(new olNs_source_Zoomify.default(#))".}
