import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_Cluster from 'ol/source/Cluster.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Cluster)".}

type
  Cluster* = ref object of JsRoot
proc newCluster*(): Cluster {.importjs: "(new olNs_source_Cluster.default())".}
