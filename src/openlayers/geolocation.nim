import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olGeolocationModule from 'ol/Geolocation.js';".}
when defined(esmModules):
  {.emit: "import Geolocation from 'ol/Geolocation.js';".}
type OlGeolocation* = ref object of JsRoot

proc newOlGeolocation*(): OlGeolocation {.importjs: "(new Geolocation())".}
