import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_css from 'ol/css.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_css)".}

proc getFontParameters*(fontSpec: cstring): JsObject {.importjs: "olNs_css.getFontParameters(#)".}

proc getCLASS_HIDDEN*(): cstring {.importjs: "(olNs_css.CLASS_HIDDEN)".}
proc getCLASS_SELECTABLE*(): cstring {.importjs: "(olNs_css.CLASS_SELECTABLE)".}
proc getCLASS_UNSELECTABLE*(): cstring {.importjs: "(olNs_css.CLASS_UNSELECTABLE)".}
proc getCLASS_UNSUPPORTED*(): cstring {.importjs: "(olNs_css.CLASS_UNSUPPORTED)".}
proc getCLASS_CONTROL*(): cstring {.importjs: "(olNs_css.CLASS_CONTROL)".}
proc getCLASS_COLLAPSED*(): cstring {.importjs: "(olNs_css.CLASS_COLLAPSED)".}
proc getFontWeights*(): JsObject {.importjs: "(olNs_css.fontWeights)".}
