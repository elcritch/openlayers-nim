import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_control_MousePosition from 'ol/control/MousePosition.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_control_MousePosition)".}

type MousePosition* = ref object of JsRoot
proc newMousePosition*(
  options: JsObject = jsUndefined
): MousePosition {.importjs: "(new olNs_control_MousePosition.default(#))".}

proc getCoordinateFormat*(
  self: MousePosition
): JsObject {.importjs: "#.getCoordinateFormat()".}

proc getProjection*(self: MousePosition): JsObject {.importjs: "#.getProjection()".}
proc handleMouseMove*(
  self: MousePosition, event: JsObject
) {.importjs: "#.handleMouseMove(#)".}

proc handleMouseOut*(
  self: MousePosition, event: JsObject
) {.importjs: "#.handleMouseOut(#)".}

proc setCoordinateFormat*(
  self: MousePosition, format: JsObject
) {.importjs: "#.setCoordinateFormat(#)".}

proc setProjection*(
  self: MousePosition, projection: JsObject
) {.importjs: "#.setProjection(#)".}

type MousePositionOptions* = ref object of JsRoot

proc newMousePositionOptions*(): MousePositionOptions {.importjs: "({})".}
proc `className=`*(
  options: MousePositionOptions, value: cstring
) {.importjs: "#.className = #".}

proc `coordinateFormat=`*(
  options: MousePositionOptions, value: JsObject
) {.importjs: "#.coordinateFormat = #".}

proc `coordinateFormat=`*(
  options: MousePositionOptions, value: RootRef
) {.importjs: "#.coordinateFormat = #".}

proc `projection=`*(
  options: MousePositionOptions, value: JsObject
) {.importjs: "#.projection = #".}

proc `projection=`*(
  options: MousePositionOptions, value: RootRef
) {.importjs: "#.projection = #".}

proc `render=`*(
  options: MousePositionOptions, value: JsObject
) {.importjs: "#.render = #".}

proc `render=`*(
  options: MousePositionOptions, value: RootRef
) {.importjs: "#.render = #".}

proc `target=`*(
  options: MousePositionOptions, value: cstring
) {.importjs: "#.target = #".}

proc `target=`*(
  options: MousePositionOptions, value: JsObject
) {.importjs: "#.target = #".}

proc `target=`*(
  options: MousePositionOptions, value: RootRef
) {.importjs: "#.target = #".}

proc `placeholder=`*(
  options: MousePositionOptions, value: cstring
) {.importjs: "#.placeholder = #".}

proc `wrapX=`*(options: MousePositionOptions, value: bool) {.importjs: "#.wrapX = #".}

proc newMousePosition*(
  options: MousePositionOptions
): MousePosition {.importjs: "(new olNs_control_MousePosition.default(#))".}
