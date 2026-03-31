import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_transform from 'ol/transform.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_transform)".}

proc create*(): JsObject {.importjs: "olNs_transform.create()".}
proc reset*(transform: JsObject): JsObject {.importjs: "olNs_transform.reset(#)".}
proc multiply*(transform1: JsObject, transform2: JsObject): JsObject {.importjs: "olNs_transform.multiply(#, #)".}
proc set*(transform: JsObject, a: float, b: float, c: float, d: float, e: float, f: float): JsObject {.importjs: "olNs_transform.set(#, #, #, #, #, #, #)".}
proc setFromArray*(transform1: JsObject, transform2: JsObject): JsObject {.importjs: "olNs_transform.setFromArray(#, #)".}
proc apply*(transform: JsObject, coordinate: JsObject): JsObject {.importjs: "olNs_transform.apply(#, #)".}
proc rotate*(transform: JsObject, angle: float): JsObject {.importjs: "olNs_transform.rotate(#, #)".}
proc scale*(transform: JsObject, x: float, y: float): JsObject {.importjs: "olNs_transform.scale(#, #, #)".}
proc makeScale*(target: JsObject, x: float, y: float): JsObject {.importjs: "olNs_transform.makeScale(#, #, #)".}
proc translate*(transform: JsObject, dx: float, dy: float): JsObject {.importjs: "olNs_transform.translate(#, #, #)".}
proc compose*(transform: JsObject, dx1: float, dy1: float, sx: float, sy: float, angle: float, dx2: float, dy2: float): JsObject {.importjs: "olNs_transform.compose(#, #, #, #, #, #, #, #)".}
proc composeCssTransform*(dx1: float, dy1: float, sx: float, sy: float, angle: float, dx2: float, dy2: float): cstring {.importjs: "olNs_transform.composeCssTransform(#, #, #, #, #, #, #)".}
proc invert*(source: JsObject): JsObject {.importjs: "olNs_transform.invert(#)".}
proc makeInverse*(target: JsObject, source: JsObject): JsObject {.importjs: "olNs_transform.makeInverse(#, #)".}
proc determinant*(mat: JsObject): float {.importjs: "olNs_transform.determinant(#)".}
proc toString*(mat: JsObject): cstring {.importjs: "olNs_transform.toString(#)".}
proc fromString*(cssTransform: cstring): JsObject {.importjs: "olNs_transform.fromString(#)".}
proc equivalent*(cssTransform1: cstring, cssTransform2: cstring): bool {.importjs: "olNs_transform.equivalent(#, #)".}
