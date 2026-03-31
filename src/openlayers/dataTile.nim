import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_DataTile from 'ol/DataTile.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_DataTile)".}

type
  DataTile* = ref object of JsRoot
proc newDataTile*(options: JsObject): DataTile {.importjs: "(new olNs_DataTile.default(#))".}
proc getSize*(self: DataTile): JsObject {.importjs: "#.getSize()".}
proc getData*(self: DataTile): JsObject {.importjs: "#.getData()".}
proc getError*(self: DataTile): JsObject {.importjs: "#.getError()".}

proc asImageLike*(data: JsObject): JsObject {.importjs: "olNs_DataTile.asImageLike(#)".}
proc asArrayLike*(data: JsObject): JsObject {.importjs: "olNs_DataTile.asArrayLike(#)".}
proc toArray*(image: JsObject): JsObject {.importjs: "olNs_DataTile.toArray(#)".}

proc getDisposedError*(): JsObject {.importjs: "(olNs_DataTile.disposedError)".}
