import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_index from 'ol/index.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_index)".}

proc getCollection*(): JsObject {.importjs: "(olNs_index.Collection)".}
proc getDisposable*(): JsObject {.importjs: "(olNs_index.Disposable)".}
proc getFeature*(): JsObject {.importjs: "(olNs_index.Feature)".}
proc getGeolocation*(): JsObject {.importjs: "(olNs_index.Geolocation)".}
proc getGraticule*(): JsObject {.importjs: "(olNs_index.Graticule)".}
proc getImageCanvas*(): JsObject {.importjs: "(olNs_index.ImageCanvas)".}
proc getImageTile*(): JsObject {.importjs: "(olNs_index.ImageTile)".}
proc getKinetic*(): JsObject {.importjs: "(olNs_index.Kinetic)".}
proc getMap*(): JsObject {.importjs: "(olNs_index.Map)".}
proc getMapBrowserEvent*(): JsObject {.importjs: "(olNs_index.MapBrowserEvent)".}
proc getMapBrowserEventHandler*(): JsObject {.importjs: "(olNs_index.MapBrowserEventHandler)".}
proc getMapEvent*(): JsObject {.importjs: "(olNs_index.MapEvent)".}
proc getObject*(): JsObject {.importjs: "(olNs_index.Object)".}
proc getObservable*(): JsObject {.importjs: "(olNs_index.Observable)".}
proc getOverlay*(): JsObject {.importjs: "(olNs_index.Overlay)".}
proc getTile*(): JsObject {.importjs: "(olNs_index.Tile)".}
proc getTileQueue*(): JsObject {.importjs: "(olNs_index.TileQueue)".}
proc getTileRange*(): JsObject {.importjs: "(olNs_index.TileRange)".}
proc getVectorRenderTile*(): JsObject {.importjs: "(olNs_index.VectorRenderTile)".}
proc getVectorTile*(): JsObject {.importjs: "(olNs_index.VectorTile)".}
proc getView*(): JsObject {.importjs: "(olNs_index.View)".}
proc getImage*(): JsObject {.importjs: "(olNs_index.Image)".}
proc getImageWrapper*(): JsObject {.importjs: "(olNs_index.ImageWrapper)".}
proc getVERSION*(): JsObject {.importjs: "(olNs_index.VERSION)".}
proc getGetUid*(): JsObject {.importjs: "(olNs_index.getUid)".}
