import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_style_flat from 'ol/style/flat.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_style_flat)".}

proc createDefaultStyle*(): JsObject {.importjs: "olNs_style_flat.createDefaultStyle()".}
