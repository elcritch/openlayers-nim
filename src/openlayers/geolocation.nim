import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olGeolocationModule from 'ol/Geolocation.js';".}
{.emit: "import Geolocation from 'ol/Geolocation.js';".}

proc hasGeolocationModule*(): bool {.
  importjs: "(typeof olGeolocationModule !== 'undefined')"
.}

proc hasGeolocationConstructor*(): bool {.
  importjs: "(typeof Geolocation === 'function')"
.}

type OlGeolocation* = ref object of JsRoot

proc newOlGeolocation*(): OlGeolocation {.importjs: "(new Geolocation())".}
