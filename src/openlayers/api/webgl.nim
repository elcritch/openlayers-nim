import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl from 'ol/webgl.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl)".}

proc getContext*(canvas: JsObject, attributes: JsObject = jsUndefined): JsObject {.importjs: "olNs_webgl.getContext(#, #)".}
proc getSupportedExtensions*(): JsObject {.importjs: "olNs_webgl.getSupportedExtensions()".}

proc getARRAY_BUFFER*(): float {.importjs: "(olNs_webgl.ARRAY_BUFFER)".}
proc getELEMENT_ARRAY_BUFFER*(): float {.importjs: "(olNs_webgl.ELEMENT_ARRAY_BUFFER)".}
proc getSTREAM_DRAW*(): float {.importjs: "(olNs_webgl.STREAM_DRAW)".}
proc getSTATIC_DRAW*(): float {.importjs: "(olNs_webgl.STATIC_DRAW)".}
proc getDYNAMIC_DRAW*(): float {.importjs: "(olNs_webgl.DYNAMIC_DRAW)".}
proc getUNSIGNED_BYTE*(): float {.importjs: "(olNs_webgl.UNSIGNED_BYTE)".}
proc getUNSIGNED_SHORT*(): float {.importjs: "(olNs_webgl.UNSIGNED_SHORT)".}
proc getUNSIGNED_INT*(): float {.importjs: "(olNs_webgl.UNSIGNED_INT)".}
proc getFLOAT*(): float {.importjs: "(olNs_webgl.FLOAT)".}
