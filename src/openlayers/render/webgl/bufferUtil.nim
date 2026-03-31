import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_webgl_bufferUtil from 'ol/render/webgl/bufferUtil.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_webgl_bufferUtil)".}

proc writePointFeatureToBuffers*(instructions: JsObject, elementIndex: float, instanceAttributesBuffer: JsObject, customAttributesSize: float, bufferPositions: JsObject = jsUndefined): JsObject {.importjs: "olNs_render_webgl_bufferUtil.writePointFeatureToBuffers(#, #, #, #, #)".}
proc writeLineSegmentToBuffers*(instructions: JsObject, segmentStartIndex: float, segmentEndIndex: float, beforeSegmentIndex: float, afterSegmentIndex: float, instanceAttributesArray: seq[float], customAttributes: seq[float], toWorldTransform: JsObject, currentLength: float, currentAngleTangentSum: float): JsObject {.importjs: "olNs_render_webgl_bufferUtil.writeLineSegmentToBuffers(#, #, #, #, #, #, #, #, #, #)".}
proc writePolygonTrianglesToBuffers*(instructions: JsObject, polygonStartIndex: float, vertexArray: seq[float], indexArray: seq[float], customAttributesSize: float): float {.importjs: "olNs_render_webgl_bufferUtil.writePolygonTrianglesToBuffers(#, #, #, #, #)".}

proc getLINESTRING_ANGLE_COSINE_CUTOFF*(): JsObject {.importjs: "(olNs_render_webgl_bufferUtil.LINESTRING_ANGLE_COSINE_CUTOFF)".}
