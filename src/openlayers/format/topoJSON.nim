import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_TopoJSON from 'ol/format/TopoJSON.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_TopoJSON)".}

type
  TopoJSON* = ref object of JsRoot
proc newTopoJSON*(): TopoJSON {.importjs: "(new olNs_format_TopoJSON.default())".}
