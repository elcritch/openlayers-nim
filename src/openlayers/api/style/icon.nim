import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_Icon from 'ol/style/Icon.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_Icon)".}

type
  OlIcon* = ref object of JsRoot
proc newOlIcon*(options: JsObject = jsUndefined): OlIcon {.importjs: "(new olNs_style_Icon.default(#))".}
proc setAnchor*(self: OlIcon, anchor: seq[float]) {.importjs: "#.setAnchor(#)".}
proc getColor*(self: OlIcon): JsObject {.importjs: "#.getColor()".}
proc setColor*(self: OlIcon, color: JsObject) {.importjs: "#.setColor(#)".}
proc getSrc*(self: OlIcon): cstring {.importjs: "#.getSrc()".}
proc setSrc*(self: OlIcon, src: cstring) {.importjs: "#.setSrc(#)".}
proc getWidth*(self: OlIcon): float {.importjs: "#.getWidth()".}
proc getHeight*(self: OlIcon): float {.importjs: "#.getHeight()".}
