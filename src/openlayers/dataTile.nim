import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_DataTile from 'ol/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_DataTile)".}

type
  OlDataTile* = ref object of JsRoot
proc newOlDataTile*(options: JsObject): OlDataTile {.importjs: "(new olNs_DataTile.default(#))".}
proc getSize*(self: OlDataTile): JsObject {.importjs: "#.getSize()".}
proc getData*(self: OlDataTile): JsObject {.importjs: "#.getData()".}
proc getError*(self: OlDataTile): JsObject {.importjs: "#.getError()".}

proc asImageLike*(data: JsObject): JsObject {.importjs: "olNs_DataTile.asImageLike(#)".}
proc asArrayLike*(data: JsObject): JsObject {.importjs: "olNs_DataTile.asArrayLike(#)".}
proc toArray*(image: JsObject): JsObject {.importjs: "olNs_DataTile.toArray(#)".}

proc getDisposedError*(): JsObject {.importjs: "(olNs_DataTile.disposedError)".}
