import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Icon from 'ol/style/Icon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Icon)".}

type
  Icon* = ref object of JsRoot
proc newIcon*(options: JsObject = jsUndefined): Icon {.importjs: "(new olNs_style_Icon.default(#))".}
proc setAnchor*(self: Icon, anchor: seq[float]) {.importjs: "#.setAnchor(#)".}
proc getColor*(self: Icon): JsObject {.importjs: "#.getColor()".}
proc setColor*(self: Icon, color: JsObject) {.importjs: "#.setColor(#)".}
proc getSrc*(self: Icon): cstring {.importjs: "#.getSrc()".}
proc setSrc*(self: Icon, src: cstring) {.importjs: "#.setSrc(#)".}
proc getWidth*(self: Icon): float {.importjs: "#.getWidth()".}
proc getHeight*(self: Icon): float {.importjs: "#.getHeight()".}
