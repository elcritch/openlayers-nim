import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source from 'ol/source.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source)".}

proc sourcesFromTileGrid*(tileGrid: JsObject, factory: JsObject): JsObject {.importjs: "olNs_source.sourcesFromTileGrid(#, #)".}

proc getBingMaps*(): JsObject {.importjs: "(olNs_source.BingMaps)".}
proc getCartoDB*(): JsObject {.importjs: "(olNs_source.CartoDB)".}
proc getCluster*(): JsObject {.importjs: "(olNs_source.Cluster)".}
proc getDataTile*(): JsObject {.importjs: "(olNs_source.DataTile)".}
proc getGeoTIFF*(): JsObject {.importjs: "(olNs_source.GeoTIFF)".}
proc getGoogle*(): JsObject {.importjs: "(olNs_source.Google)".}
proc getIIIF*(): JsObject {.importjs: "(olNs_source.IIIF)".}
proc getImage*(): JsObject {.importjs: "(olNs_source.Image)".}
proc getImageArcGISRest*(): JsObject {.importjs: "(olNs_source.ImageArcGISRest)".}
proc getImageCanvas*(): JsObject {.importjs: "(olNs_source.ImageCanvas)".}
proc getImageMapGuide*(): JsObject {.importjs: "(olNs_source.ImageMapGuide)".}
proc getImageStatic*(): JsObject {.importjs: "(olNs_source.ImageStatic)".}
proc getImageTile*(): JsObject {.importjs: "(olNs_source.ImageTile)".}
proc getImageWMS*(): JsObject {.importjs: "(olNs_source.ImageWMS)".}
proc getOGCMapTile*(): JsObject {.importjs: "(olNs_source.OGCMapTile)".}
proc getOGCVectorTile*(): JsObject {.importjs: "(olNs_source.OGCVectorTile)".}
proc getOSM*(): JsObject {.importjs: "(olNs_source.OSM)".}
proc getRaster*(): JsObject {.importjs: "(olNs_source.Raster)".}
proc getSource*(): JsObject {.importjs: "(olNs_source.Source)".}
proc getStadiaMaps*(): JsObject {.importjs: "(olNs_source.StadiaMaps)".}
proc getTile*(): JsObject {.importjs: "(olNs_source.Tile)".}
proc getTileArcGISRest*(): JsObject {.importjs: "(olNs_source.TileArcGISRest)".}
proc getTileDebug*(): JsObject {.importjs: "(olNs_source.TileDebug)".}
proc getTileImage*(): JsObject {.importjs: "(olNs_source.TileImage)".}
proc getTileJSON*(): JsObject {.importjs: "(olNs_source.TileJSON)".}
proc getTileWMS*(): JsObject {.importjs: "(olNs_source.TileWMS)".}
proc getUrlTile*(): JsObject {.importjs: "(olNs_source.UrlTile)".}
proc getUTFGrid*(): JsObject {.importjs: "(olNs_source.UTFGrid)".}
proc getVector*(): JsObject {.importjs: "(olNs_source.Vector)".}
proc getVectorTile*(): JsObject {.importjs: "(olNs_source.VectorTile)".}
proc getWMTS*(): JsObject {.importjs: "(olNs_source.WMTS)".}
proc getXYZ*(): JsObject {.importjs: "(olNs_source.XYZ)".}
proc getZoomify*(): JsObject {.importjs: "(olNs_source.Zoomify)".}
proc getCreateWMSLoader*(): JsObject {.importjs: "(olNs_source.createWMSLoader)".}
proc getCreateArcGISRestLoader*(): JsObject {.importjs: "(olNs_source.createArcGISRestLoader)".}
proc getCreateStaticLoader*(): JsObject {.importjs: "(olNs_source.createStaticLoader)".}
proc getCreateMapGuideLoader*(): JsObject {.importjs: "(olNs_source.createMapGuideLoader)".}
