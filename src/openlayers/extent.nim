import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_extent from 'ol/extent.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_extent)".}

proc boundingExtent*(coordinates: JsObject): JsObject {.importjs: "olNs_extent.boundingExtent(#)".}
proc buffer*(extent: JsObject, value: float, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.buffer(#, #, #)".}
proc clone*(extent: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.clone(#, #)".}
proc closestSquaredDistanceXY*(extent: JsObject, x: float, y: float): float {.importjs: "olNs_extent.closestSquaredDistanceXY(#, #, #)".}
proc containsCoordinate*(extent: JsObject, coordinate: JsObject): bool {.importjs: "olNs_extent.containsCoordinate(#, #)".}
proc containsExtent*(extent1: JsObject, extent2: JsObject): bool {.importjs: "olNs_extent.containsExtent(#, #)".}
proc containsXY*(extent: JsObject, x: float, y: float): bool {.importjs: "olNs_extent.containsXY(#, #, #)".}
proc coordinateRelationship*(extent: JsObject, coordinate: JsObject): JsObject {.importjs: "olNs_extent.coordinateRelationship(#, #)".}
proc createEmpty*(): JsObject {.importjs: "olNs_extent.createEmpty()".}
proc createOrUpdate*(minX: float, minY: float, maxX: float, maxY: float, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.createOrUpdate(#, #, #, #, #)".}
proc createOrUpdateEmpty*(dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.createOrUpdateEmpty(#)".}
proc createOrUpdateFromCoordinate*(coordinate: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.createOrUpdateFromCoordinate(#, #)".}
proc createOrUpdateFromCoordinates*(coordinates: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.createOrUpdateFromCoordinates(#, #)".}
proc createOrUpdateFromFlatCoordinates*(flatCoordinates: seq[float], offset: float, endVal: float, stride: float, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.createOrUpdateFromFlatCoordinates(#, #, #, #, #)".}
proc createOrUpdateFromRings*(rings: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.createOrUpdateFromRings(#, #)".}
proc equals*(extent1: JsObject, extent2: JsObject): bool {.importjs: "olNs_extent.equals(#, #)".}
proc approximatelyEquals*(extent1: JsObject, extent2: JsObject, tolerance: float): bool {.importjs: "olNs_extent.approximatelyEquals(#, #, #)".}
proc extend*(extent1: JsObject, extent2: JsObject): JsObject {.importjs: "olNs_extent.extend(#, #)".}
proc extendCoordinate*(extent: JsObject, coordinate: JsObject) {.importjs: "olNs_extent.extendCoordinate(#, #)".}
proc extendCoordinates*(extent: JsObject, coordinates: JsObject): JsObject {.importjs: "olNs_extent.extendCoordinates(#, #)".}
proc extendFlatCoordinates*(extent: JsObject, flatCoordinates: seq[float], offset: float, endVal: float, stride: float): JsObject {.importjs: "olNs_extent.extendFlatCoordinates(#, #, #, #, #)".}
proc extendRings*(extent: JsObject, rings: JsObject): JsObject {.importjs: "olNs_extent.extendRings(#, #)".}
proc extendXY*(extent: JsObject, x: float, y: float) {.importjs: "olNs_extent.extendXY(#, #, #)".}
proc forEachCorner*(extent: JsObject, callback: JsObject): JsObject {.importjs: "olNs_extent.forEachCorner(#, #)".}
proc getArea*(extent: JsObject): float {.importjs: "olNs_extent.getArea(#)".}
proc getBottomLeft*(extent: JsObject): JsObject {.importjs: "olNs_extent.getBottomLeft(#)".}
proc getBottomRight*(extent: JsObject): JsObject {.importjs: "olNs_extent.getBottomRight(#)".}
proc getCenter*(extent: JsObject): JsObject {.importjs: "olNs_extent.getCenter(#)".}
proc getCorner*(extent: JsObject, corner: JsObject): JsObject {.importjs: "olNs_extent.getCorner(#, #)".}
proc getEnlargedArea*(extent1: JsObject, extent2: JsObject): float {.importjs: "olNs_extent.getEnlargedArea(#, #)".}
proc getForViewAndSize*(center: JsObject, resolution: float, rotation: float, size: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.getForViewAndSize(#, #, #, #, #)".}
proc getRotatedViewport*(center: JsObject, resolution: float, rotation: float, size: JsObject): seq[float] {.importjs: "olNs_extent.getRotatedViewport(#, #, #, #)".}
proc getHeight*(extent: JsObject): float {.importjs: "olNs_extent.getHeight(#)".}
proc getIntersectionArea*(extent1: JsObject, extent2: JsObject): float {.importjs: "olNs_extent.getIntersectionArea(#, #)".}
proc getIntersection*(extent1: JsObject, extent2: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.getIntersection(#, #, #)".}
proc getMargin*(extent: JsObject): float {.importjs: "olNs_extent.getMargin(#)".}
proc getSize*(extent: JsObject): JsObject {.importjs: "olNs_extent.getSize(#)".}
proc getTopLeft*(extent: JsObject): JsObject {.importjs: "olNs_extent.getTopLeft(#)".}
proc getTopRight*(extent: JsObject): JsObject {.importjs: "olNs_extent.getTopRight(#)".}
proc getWidth*(extent: JsObject): float {.importjs: "olNs_extent.getWidth(#)".}
proc intersects*(extent1: JsObject, extent2: JsObject): bool {.importjs: "olNs_extent.intersects(#, #)".}
proc isEmpty*(extent: JsObject): bool {.importjs: "olNs_extent.isEmpty(#)".}
proc returnOrUpdate*(extent: JsObject, dest: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.returnOrUpdate(#, #)".}
proc scaleFromCenter*(extent: JsObject, value: float) {.importjs: "olNs_extent.scaleFromCenter(#, #)".}
proc intersectsSegment*(extent: JsObject, start: JsObject, endVal: JsObject): bool {.importjs: "olNs_extent.intersectsSegment(#, #, #)".}
proc applyTransform*(extent: JsObject, transformFn: JsObject, dest: JsObject = jsUndefined, stops: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.applyTransform(#, #, #, #)".}
proc wrapX*(extent: JsObject, projection: JsObject): JsObject {.importjs: "olNs_extent.wrapX(#, #)".}
proc wrapAndSliceX*(extent: JsObject, projection: JsObject, multiWorld: JsObject = jsUndefined): JsObject {.importjs: "olNs_extent.wrapAndSliceX(#, #, #)".}
