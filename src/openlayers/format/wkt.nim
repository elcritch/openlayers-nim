import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_WKT from 'ol/format/WKT.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_WKT)".}

type
  WKT* = ref object of JsRoot
proc newWKT*(options: JsObject = jsUndefined): WKT {.importjs: "(new olNs_format_WKT.default(#))".}

type
  WKTOptions* = ref object of JsRoot

proc newWKTOptions*(): WKTOptions {.importjs: "({})".}
proc `splitCollection=`*(options: WKTOptions, value: bool) {.importjs: "#.splitCollection = #".}

proc newWKT*(options: WKTOptions): WKT {.importjs: "(new olNs_format_WKT.default(#))".}
