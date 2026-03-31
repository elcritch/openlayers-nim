import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_layer from 'ol/layer.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_layer)".}

proc getGraticule*(): JsObject {.importjs: "(olNs_layer.Graticule)".}
proc getGroup*(): JsObject {.importjs: "(olNs_layer.Group)".}
proc getHeatmap*(): JsObject {.importjs: "(olNs_layer.Heatmap)".}
proc getImage*(): JsObject {.importjs: "(olNs_layer.Image)".}
proc getLayer*(): JsObject {.importjs: "(olNs_layer.Layer)".}
proc getTile*(): JsObject {.importjs: "(olNs_layer.Tile)".}
proc getVector*(): JsObject {.importjs: "(olNs_layer.Vector)".}
proc getVectorImage*(): JsObject {.importjs: "(olNs_layer.VectorImage)".}
proc getVectorTile*(): JsObject {.importjs: "(olNs_layer.VectorTile)".}
proc getWebGLPoints*(): JsObject {.importjs: "(olNs_layer.WebGLPoints)".}
proc getWebGLTile*(): JsObject {.importjs: "(olNs_layer.WebGLTile)".}
proc getWebGLVector*(): JsObject {.importjs: "(olNs_layer.WebGLVector)".}
