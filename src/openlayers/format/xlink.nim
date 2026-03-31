import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_xlink from 'ol/format/xlink.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_xlink)".}

proc readHref*(node: JsObject): cstring {.importjs: "olNs_format_xlink.readHref(#)".}
