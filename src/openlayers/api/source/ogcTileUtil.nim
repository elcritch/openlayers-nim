import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_ogcTileUtil from 'ol/source/ogcTileUtil.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_ogcTileUtil)".}

proc appendCollectionsQueryParam*(tileUrlTemplate: cstring, collections: seq[cstring]): cstring {.importjs: "olNs_source_ogcTileUtil.appendCollectionsQueryParam(#, #)".}
proc getMapTileUrlTemplate*(links: JsObject, mediaType: JsObject = jsUndefined, collections: JsObject = jsUndefined): cstring {.importjs: "olNs_source_ogcTileUtil.getMapTileUrlTemplate(#, #, #)".}
proc getVectorTileUrlTemplate*(links: JsObject, mediaType: JsObject = jsUndefined, supportedMediaTypes: JsObject = jsUndefined, collections: JsObject = jsUndefined): cstring {.importjs: "olNs_source_ogcTileUtil.getVectorTileUrlTemplate(#, #, #, #)".}
proc parseTileMatrixSet*(sourceInfo: JsObject, tileMatrixSet: JsObject, tileUrlTemplate: JsObject = jsUndefined, tileMatrixSetLimits: JsObject = jsUndefined): JsObject {.importjs: "olNs_source_ogcTileUtil.parseTileMatrixSet(#, #, #, #)".}
proc getTileSetInfo*(sourceInfo: JsObject): JsObject {.importjs: "olNs_source_ogcTileUtil.getTileSetInfo(#)".}
