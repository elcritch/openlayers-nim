import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format from 'ol/format.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format)".}

proc getEsriJSON*(): JsObject {.importjs: "(olNs_format.EsriJSON)".}
proc getGeoJSON*(): JsObject {.importjs: "(olNs_format.GeoJSON)".}
proc getGML*(): JsObject {.importjs: "(olNs_format.GML)".}
proc getGPX*(): JsObject {.importjs: "(olNs_format.GPX)".}
proc getIGC*(): JsObject {.importjs: "(olNs_format.IGC)".}
proc getIIIFInfo*(): JsObject {.importjs: "(olNs_format.IIIFInfo)".}
proc getKML*(): JsObject {.importjs: "(olNs_format.KML)".}
proc getMVT*(): JsObject {.importjs: "(olNs_format.MVT)".}
proc getOWS*(): JsObject {.importjs: "(olNs_format.OWS)".}
proc getPolyline*(): JsObject {.importjs: "(olNs_format.Polyline)".}
proc getTopoJSON*(): JsObject {.importjs: "(olNs_format.TopoJSON)".}
proc getWFS*(): JsObject {.importjs: "(olNs_format.WFS)".}
proc getWKB*(): JsObject {.importjs: "(olNs_format.WKB)".}
proc getWKT*(): JsObject {.importjs: "(olNs_format.WKT)".}
proc getWMSCapabilities*(): JsObject {.importjs: "(olNs_format.WMSCapabilities)".}
proc getWMSGetFeatureInfo*(): JsObject {.importjs: "(olNs_format.WMSGetFeatureInfo)".}
proc getWMTSCapabilities*(): JsObject {.importjs: "(olNs_format.WMTSCapabilities)".}
