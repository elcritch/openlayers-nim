import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_Canvas from 'ol/webgl/Canvas.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_Canvas)".}

proc createProgram*(gl: JsObject, fragmentSource: cstring, vertexSource: cstring): JsObject {.importjs: "olNs_webgl_Canvas.createProgram(#, #, #)".}
