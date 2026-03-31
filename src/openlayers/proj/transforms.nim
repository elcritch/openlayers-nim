import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_proj_transforms from 'ol/proj/transforms.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj_transforms)".}

proc clear*() {.importjs: "olNs_proj_transforms.clear()".}
proc add*(source: JsObject, destination: JsObject, transformFn: JsObject) {.importjs: "olNs_proj_transforms.add(#, #, #)".}
proc remove*(source: JsObject, destination: JsObject): JsObject {.importjs: "olNs_proj_transforms.remove(#, #)".}
proc get*(sourceCode: cstring, destinationCode: cstring): JsObject {.importjs: "olNs_proj_transforms.get(#, #)".}
