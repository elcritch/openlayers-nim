import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_encodeUtil from 'ol/render/webgl/encodeUtil.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_encodeUtil)".}

proc colorEncodeIdAndPack*(id: float, array: JsObject = jsUndefined): seq[float] {.importjs: "olNs_render_webgl_encodeUtil.colorEncodeIdAndPack(#, #)".}
proc colorDecodeId*(color: seq[float]): float {.importjs: "olNs_render_webgl_encodeUtil.colorDecodeId(#)".}
