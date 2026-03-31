import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_Projection from 'ol/proj/Projection.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_Projection)".}

type
  Projection* = ref object of JsRoot
proc newProjection*(options: JsObject): Projection {.importjs: "(new olNs_proj_Projection.default(#))".}
proc canWrapX*(self: Projection): bool {.importjs: "#.canWrapX()".}
proc getCode*(self: Projection): cstring {.importjs: "#.getCode()".}
proc getExtent*(self: Projection): JsObject {.importjs: "#.getExtent()".}
proc getUnits*(self: Projection): JsObject {.importjs: "#.getUnits()".}
proc getMetersPerUnit*(self: Projection): float {.importjs: "#.getMetersPerUnit()".}
proc getWorldExtent*(self: Projection): JsObject {.importjs: "#.getWorldExtent()".}
proc getAxisOrientation*(self: Projection): cstring {.importjs: "#.getAxisOrientation()".}
proc isGlobal*(self: Projection): bool {.importjs: "#.isGlobal()".}
proc setGlobal*(self: Projection, global: bool) {.importjs: "#.setGlobal(#)".}
proc getDefaultTileGrid*(self: Projection): JsObject {.importjs: "#.getDefaultTileGrid()".}
proc setDefaultTileGrid*(self: Projection, tileGrid: JsObject) {.importjs: "#.setDefaultTileGrid(#)".}
proc setExtent*(self: Projection, extent: JsObject) {.importjs: "#.setExtent(#)".}
proc setWorldExtent*(self: Projection, worldExtent: JsObject) {.importjs: "#.setWorldExtent(#)".}
proc setGetPointResolution*(self: Projection, funcVal: JsObject) {.importjs: "#.setGetPointResolution(#)".}
proc getPointResolutionFunc*(self: Projection): JsObject {.importjs: "#.getPointResolutionFunc()".}
