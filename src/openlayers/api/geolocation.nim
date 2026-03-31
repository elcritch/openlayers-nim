import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Geolocation from 'ol/Geolocation.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Geolocation)".}

type
  OlGeolocation* = ref object of JsRoot
proc newOlGeolocation*(): OlGeolocation {.importjs: "(new olNs_Geolocation.default())".}
