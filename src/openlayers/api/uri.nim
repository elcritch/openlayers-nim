import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_uri from 'ol/uri.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_uri)".}

proc appendParams*(uri: cstring, params: JsObject): cstring {.importjs: "olNs_uri.appendParams(#, #)".}
proc renderXYZTemplate*(templateVal: cstring, z: float, x: float, y: float, maxY: JsObject = jsUndefined): cstring {.importjs: "olNs_uri.renderXYZTemplate(#, #, #, #, #)".}
proc pickUrl*(urls: seq[cstring], z: float, x: float, y: float): cstring {.importjs: "olNs_uri.pickUrl(#, #, #, #)".}
proc expandUrl*(url: cstring): seq[cstring] {.importjs: "olNs_uri.expandUrl(#)".}
