import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_resolutionconstraint from 'ol/resolutionconstraint.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_resolutionconstraint)".}

proc createSnapToResolutions*(resolutions: seq[float], smooth: JsObject = jsUndefined, maxExtent: JsObject = jsUndefined, showFullExtent: JsObject = jsUndefined): JsObject {.importjs: "olNs_resolutionconstraint.createSnapToResolutions(#, #, #, #)".}
proc createSnapToPower*(power: float, maxResolution: float, minResolution: JsObject = jsUndefined, smooth: JsObject = jsUndefined, maxExtent: JsObject = jsUndefined, showFullExtent: JsObject = jsUndefined): JsObject {.importjs: "olNs_resolutionconstraint.createSnapToPower(#, #, #, #, #, #)".}
proc createMinMaxResolution*(maxResolution: float, minResolution: float, smooth: JsObject = jsUndefined, maxExtent: JsObject = jsUndefined, showFullExtent: JsObject = jsUndefined): JsObject {.importjs: "olNs_resolutionconstraint.createMinMaxResolution(#, #, #, #, #)".}
