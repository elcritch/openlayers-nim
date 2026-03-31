import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_vec_mat4 from 'ol/vec/mat4.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_vec_mat4)".}

proc create*(): JsObject {.importjs: "olNs_vec_mat4.create()".}
proc fromTransform*(mat4: JsObject, transform: JsObject): JsObject {.importjs: "olNs_vec_mat4.fromTransform(#, #)".}
proc orthographic*(left: float, right: float, bottom: float, top: float, near: float, far: float, outVal: JsObject = jsUndefined): JsObject {.importjs: "olNs_vec_mat4.orthographic(#, #, #, #, #, #, #)".}
proc scale*(m: JsObject, x: float, y: float, z: float, outVal: JsObject = jsUndefined): JsObject {.importjs: "olNs_vec_mat4.scale(#, #, #, #, #)".}
proc translate*(m: JsObject, x: float, y: float, z: float, outVal: JsObject = jsUndefined): JsObject {.importjs: "olNs_vec_mat4.translate(#, #, #, #, #)".}
proc translation*(x: float, y: float, z: float, outVal: JsObject = jsUndefined): JsObject {.importjs: "olNs_vec_mat4.translation(#, #, #, #)".}
