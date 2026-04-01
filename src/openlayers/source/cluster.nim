import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_source_Cluster from 'ol/source/Cluster.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_Cluster)".}

type
  Cluster* = ref object of JsRoot
proc newCluster*(): Cluster {.importjs: "(new olNs_source_Cluster.default())".}

type
  ClusterOptions* = ref object of JsRoot

proc newClusterOptions*(): ClusterOptions {.importjs: "({})".}
proc `attributions=`*(options: ClusterOptions, value: JsObject) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ClusterOptions, value: RootRef) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ClusterOptions, value: cstring) {.importjs: "#.attributions = #".}
proc `attributions=`*(options: ClusterOptions, value: seq[cstring]) {.importjs: "#.attributions = #".}
proc `distance=`*(options: ClusterOptions, value: float) {.importjs: "#.distance = #".}
proc `minDistance=`*(options: ClusterOptions, value: float) {.importjs: "#.minDistance = #".}
proc `geometryFunction=`*(options: ClusterOptions, value: JsObject) {.importjs: "#.geometryFunction = #".}
proc `geometryFunction=`*(options: ClusterOptions, value: RootRef) {.importjs: "#.geometryFunction = #".}
proc `createCluster=`*(options: ClusterOptions, value: JsObject) {.importjs: "#.createCluster = #".}
proc `createCluster=`*(options: ClusterOptions, value: RootRef) {.importjs: "#.createCluster = #".}
proc `createCluster=`*[T](options: ClusterOptions, value: seq[T]) {.importjs: "#.createCluster = #".}
proc `source=`*(options: ClusterOptions, value: JsObject) {.importjs: "#.source = #".}
proc `source=`*(options: ClusterOptions, value: RootRef) {.importjs: "#.source = #".}
proc `wrapX=`*(options: ClusterOptions, value: bool) {.importjs: "#.wrapX = #".}

proc newCluster*(options: ClusterOptions): Cluster {.importjs: "(new olNs_source_Cluster.default(#))".}
