import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_IGC from 'ol/format/IGC.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_IGC)".}

type
  IGC* = ref object of JsRoot
proc newIGC*(options: JsObject = jsUndefined): IGC {.importjs: "(new olNs_format_IGC.default(#))".}

type
  IGCOptions* = ref object of JsRoot

proc newIGCOptions*(): IGCOptions {.importjs: "({})".}
proc `altitudeMode=`*(options: IGCOptions, value: JsObject) {.importjs: "#.altitudeMode = #".}
proc `altitudeMode=`*(options: IGCOptions, value: RootRef) {.importjs: "#.altitudeMode = #".}

proc newIGC*(options: IGCOptions): IGC {.importjs: "(new olNs_format_IGC.default(#))".}
