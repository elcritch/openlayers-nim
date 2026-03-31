import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_dom from 'ol/dom.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_dom)".}

proc createCanvasContext2D*(width: JsObject = jsUndefined, height: JsObject = jsUndefined, canvasPool: JsObject = jsUndefined, settings: JsObject = jsUndefined): JsObject {.importjs: "olNs_dom.createCanvasContext2D(#, #, #, #)".}
proc getSharedCanvasContext2D*(): JsObject {.importjs: "olNs_dom.getSharedCanvasContext2D()".}
proc releaseCanvas*(context: JsObject) {.importjs: "olNs_dom.releaseCanvas(#)".}
proc outerWidth*(element: JsObject): float {.importjs: "olNs_dom.outerWidth(#)".}
proc outerHeight*(element: JsObject): float {.importjs: "olNs_dom.outerHeight(#)".}
proc replaceNode*(newNode: JsObject, oldNode: JsObject) {.importjs: "olNs_dom.replaceNode(#, #)".}
proc removeChildren*(node: JsObject) {.importjs: "olNs_dom.removeChildren(#)".}
proc replaceChildren*(node: JsObject, children: JsObject) {.importjs: "olNs_dom.replaceChildren(#, #)".}
proc createMockDiv*(): JsObject {.importjs: "olNs_dom.createMockDiv()".}
proc isCanvas*(obj: JsObject): JsObject {.importjs: "olNs_dom.isCanvas(#)".}
