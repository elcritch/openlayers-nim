import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_style from 'ol/render/webgl/style.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_style)".}

proc computeHash*(input: JsObject): cstring {.importjs: "olNs_render_webgl_style.computeHash(#)".}
proc parseLiteralStyle*(style: JsObject, variables: JsObject = jsUndefined, filter: JsObject = jsUndefined): JsObject {.importjs: "olNs_render_webgl_style.parseLiteralStyle(#, #, #)".}
