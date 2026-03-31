import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Geolocation from 'ol/Geolocation.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Geolocation)".}

type
  Geolocation* = ref object of JsRoot
proc newGeolocation*(): Geolocation {.importjs: "(new olNs_Geolocation.default())".}

type
  GeolocationOptions* = ref object of JsRoot

proc newGeolocationOptions*(): GeolocationOptions {.importjs: "({})".}
proc `tracking=`*(options: GeolocationOptions, value: bool) {.importjs: "#.tracking = #".}
proc `trackingOptions=`*(options: GeolocationOptions, value: JsObject) {.importjs: "#.trackingOptions = #".}
proc `trackingOptions=`*(options: GeolocationOptions, value: RootRef) {.importjs: "#.trackingOptions = #".}
proc `projection=`*(options: GeolocationOptions, value: JsObject) {.importjs: "#.projection = #".}
proc `projection=`*(options: GeolocationOptions, value: RootRef) {.importjs: "#.projection = #".}

proc newGeolocation*(options: GeolocationOptions): Geolocation {.importjs: "(new olNs_Geolocation.default(#))".}
