import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Geolocation from 'ol/Geolocation.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Geolocation)".}

type
  Geolocation* = ref object of JsRoot
proc newGeolocation*(): Geolocation {.importjs: "(new olNs_Geolocation.default())".}
