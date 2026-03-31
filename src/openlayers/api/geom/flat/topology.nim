import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_geom_flat_topology from 'ol/geom/flat/topology.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_geom_flat_topology)".}

proc lineStringIsClosed*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float): bool {.importjs: "olNs_geom_flat_topology.lineStringIsClosed(#, #, #, #)".}
