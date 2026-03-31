import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_geodesic from 'ol/geom/flat/geodesic.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_geodesic)".}

proc greatCircleArc*(lon1: float, lat1: float, lon2: float, lat2: float, projection: JsObject, squaredTolerance: float): seq[float] {.importjs: "olNs_geom_flat_geodesic.greatCircleArc(#, #, #, #, #, #)".}
proc meridian*(lon: float, lat1: float, lat2: float, projection: JsObject, squaredTolerance: float): seq[float] {.importjs: "olNs_geom_flat_geodesic.meridian(#, #, #, #, #)".}
proc parallel*(lat: float, lon1: float, lon2: float, projection: JsObject, squaredTolerance: float): seq[float] {.importjs: "olNs_geom_flat_geodesic.parallel(#, #, #, #, #)".}
