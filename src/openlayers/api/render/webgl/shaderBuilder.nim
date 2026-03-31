import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_ShaderBuilder from 'ol/render/webgl/ShaderBuilder.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_ShaderBuilder)".}

proc getCOMMON_HEADER*(): JsObject {.importjs: "(olNs_render_webgl_ShaderBuilder.COMMON_HEADER)".}
