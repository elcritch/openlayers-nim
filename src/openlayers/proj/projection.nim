import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_Projection from 'ol/proj/Projection.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_Projection)".}

type
  OlProjection* = ref object of JsRoot
proc newOlProjection*(options: JsObject): OlProjection {.importjs: "(new olNs_proj_Projection.default(#))".}
proc canWrapX*(self: OlProjection): bool {.importjs: "#.canWrapX()".}
proc getCode*(self: OlProjection): cstring {.importjs: "#.getCode()".}
proc getExtent*(self: OlProjection): JsObject {.importjs: "#.getExtent()".}
proc getUnits*(self: OlProjection): JsObject {.importjs: "#.getUnits()".}
proc getMetersPerUnit*(self: OlProjection): float {.importjs: "#.getMetersPerUnit()".}
proc getWorldExtent*(self: OlProjection): JsObject {.importjs: "#.getWorldExtent()".}
proc getAxisOrientation*(self: OlProjection): cstring {.importjs: "#.getAxisOrientation()".}
proc isGlobal*(self: OlProjection): bool {.importjs: "#.isGlobal()".}
proc setGlobal*(self: OlProjection, global: bool) {.importjs: "#.setGlobal(#)".}
proc getDefaultTileGrid*(self: OlProjection): JsObject {.importjs: "#.getDefaultTileGrid()".}
proc setDefaultTileGrid*(self: OlProjection, tileGrid: JsObject) {.importjs: "#.setDefaultTileGrid(#)".}
proc setExtent*(self: OlProjection, extent: JsObject) {.importjs: "#.setExtent(#)".}
proc setWorldExtent*(self: OlProjection, worldExtent: JsObject) {.importjs: "#.setWorldExtent(#)".}
proc setGetPointResolution*(self: OlProjection, funcVal: JsObject) {.importjs: "#.setGetPointResolution(#)".}
proc getPointResolutionFunc*(self: OlProjection): JsObject {.importjs: "#.getPointResolutionFunc()".}
