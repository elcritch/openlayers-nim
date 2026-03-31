import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_webgl_TileTexture from 'ol/webgl/TileTexture.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_webgl_TileTexture)".}

type
  OlTileTexture* = ref object of JsRoot
proc newOlTileTexture*(options: JsObject): OlTileTexture {.importjs: "(new olNs_webgl_TileTexture.default(#))".}
proc getPixelData*(self: OlTileTexture, renderCol: float, renderRow: float): JsObject {.importjs: "#.getPixelData(#, #)".}
