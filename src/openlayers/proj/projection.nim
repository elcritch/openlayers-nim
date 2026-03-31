import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_Projection from 'ol/proj/Projection.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_Projection)".}

type Projection* = ref object of JsRoot
proc newProjection*(
  options: JsObject
): Projection {.importjs: "(new olNs_proj_Projection.default(#))".}

proc canWrapX*(self: Projection): bool {.importjs: "#.canWrapX()".}
proc getCode*(self: Projection): cstring {.importjs: "#.getCode()".}
proc getExtent*(self: Projection): JsObject {.importjs: "#.getExtent()".}
proc getUnits*(self: Projection): JsObject {.importjs: "#.getUnits()".}
proc getMetersPerUnit*(self: Projection): float {.importjs: "#.getMetersPerUnit()".}
proc getWorldExtent*(self: Projection): JsObject {.importjs: "#.getWorldExtent()".}
proc getAxisOrientation*(
  self: Projection
): cstring {.importjs: "#.getAxisOrientation()".}

proc isGlobal*(self: Projection): bool {.importjs: "#.isGlobal()".}
proc setGlobal*(self: Projection, global: bool) {.importjs: "#.setGlobal(#)".}
proc getDefaultTileGrid*(
  self: Projection
): JsObject {.importjs: "#.getDefaultTileGrid()".}

proc setDefaultTileGrid*(
  self: Projection, tileGrid: JsObject
) {.importjs: "#.setDefaultTileGrid(#)".}

proc setExtent*(self: Projection, extent: JsObject) {.importjs: "#.setExtent(#)".}
proc setWorldExtent*(
  self: Projection, worldExtent: JsObject
) {.importjs: "#.setWorldExtent(#)".}

proc setGetPointResolution*(
  self: Projection, funcVal: JsObject
) {.importjs: "#.setGetPointResolution(#)".}

proc getPointResolutionFunc*(
  self: Projection
): JsObject {.importjs: "#.getPointResolutionFunc()".}

type ProjectionOptions* = ref object of JsRoot

proc newProjectionOptions*(): ProjectionOptions {.importjs: "({})".}
proc `code=`*(options: ProjectionOptions, value: cstring) {.importjs: "#.code = #".}
proc `units=`*(options: ProjectionOptions, value: JsObject) {.importjs: "#.units = #".}
proc `units=`*(options: ProjectionOptions, value: RootRef) {.importjs: "#.units = #".}
proc `extent=`*(
  options: ProjectionOptions, value: JsObject
) {.importjs: "#.extent = #".}

proc `extent=`*(options: ProjectionOptions, value: RootRef) {.importjs: "#.extent = #".}
proc `axisOrientation=`*(
  options: ProjectionOptions, value: cstring
) {.importjs: "#.axisOrientation = #".}

proc `global=`*(options: ProjectionOptions, value: bool) {.importjs: "#.global = #".}
proc `metersPerUnit=`*(
  options: ProjectionOptions, value: float
) {.importjs: "#.metersPerUnit = #".}

proc `worldExtent=`*(
  options: ProjectionOptions, value: JsObject
) {.importjs: "#.worldExtent = #".}

proc `worldExtent=`*(
  options: ProjectionOptions, value: RootRef
) {.importjs: "#.worldExtent = #".}

proc `getPointResolution=`*(
  options: ProjectionOptions, value: JsObject
) {.importjs: "#.getPointResolution = #".}

proc `getPointResolution=`*(
  options: ProjectionOptions, value: RootRef
) {.importjs: "#.getPointResolution = #".}

proc newProjection*(
  options: ProjectionOptions
): Projection {.importjs: "(new olNs_proj_Projection.default(#))".}
