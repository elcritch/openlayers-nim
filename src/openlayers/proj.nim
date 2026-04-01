import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_proj from 'ol/proj.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_proj)".}

proc disableCoordinateWarning*(
  disable: JsObject = jsUndefined
) {.importjs: "olNs_proj.disableCoordinateWarning(#)".}

proc cloneTransform*(
  input: seq[float], output: JsObject = jsUndefined
): seq[float] {.importjs: "olNs_proj.cloneTransform(#, #)".}

proc identityTransform*(
  input: seq[float], output: JsObject = jsUndefined
): seq[float] {.importjs: "olNs_proj.identityTransform(#, #)".}

proc addProjection*(projection: JsObject) {.importjs: "olNs_proj.addProjection(#)".}
proc addProjections*(projections: JsObject) {.importjs: "olNs_proj.addProjections(#)".}
proc get*(projectionLike: JsObject): JsObject {.importjs: "olNs_proj.get(#)".}
proc getPointResolution*(
  projection: JsObject,
  resolution: float,
  point: JsObject,
  units: JsObject = jsUndefined,
): float {.importjs: "olNs_proj.getPointResolution(#, #, #, #)".}

proc addEquivalentProjections*(
  projections: JsObject
) {.importjs: "olNs_proj.addEquivalentProjections(#)".}

proc addEquivalentTransforms*(
  projections1: JsObject,
  projections2: JsObject,
  forwardTransform: JsObject,
  inverseTransform: JsObject,
) {.importjs: "olNs_proj.addEquivalentTransforms(#, #, #, #)".}

proc clearAllProjections*() {.importjs: "olNs_proj.clearAllProjections()".}
proc createProjection*(
  projection: JsObject, defaultCode: cstring
): JsObject {.importjs: "olNs_proj.createProjection(#, #)".}

proc createTransformFromCoordinateTransform*(
  coordTransform: JsObject
): JsObject {.importjs: "olNs_proj.createTransformFromCoordinateTransform(#)".}

proc addCoordinateTransforms*(
  source: JsObject, destination: JsObject, forward: JsObject, inverse: JsObject
) {.importjs: "olNs_proj.addCoordinateTransforms(#, #, #, #)".}

proc fromLonLat*(
  coordinate: JsObject, projection: JsObject = jsUndefined
): JsObject {.importjs: "olNs_proj.fromLonLat(#, #)".}

proc fromLonLat*(
  coordinate: seq[float], projection: JsObject = jsUndefined
): JsObject {.importjs: "olNs_proj.fromLonLat(#, #)".}

proc toLonLat*(
  coordinate: JsObject, projection: JsObject = jsUndefined
): JsObject {.importjs: "olNs_proj.toLonLat(#, #)".}

proc equivalent*(
  projection1: JsObject, projection2: JsObject
): bool {.importjs: "olNs_proj.equivalent(#, #)".}

proc getTransformFromProjections*(
  source: JsObject, destination: JsObject
): JsObject {.importjs: "olNs_proj.getTransformFromProjections(#, #)".}

proc getTransform*(
  source: JsObject, destination: JsObject
): JsObject {.importjs: "olNs_proj.getTransform(#, #)".}

proc transform*(
  coordinate: JsObject, source: JsObject, destination: JsObject
): JsObject {.importjs: "olNs_proj.transform(#, #, #)".}

proc transformExtent*(
  extent: JsObject,
  source: JsObject,
  destination: JsObject,
  stops: JsObject = jsUndefined,
): JsObject {.importjs: "olNs_proj.transformExtent(#, #, #, #)".}

proc transformWithProjections*(
  point: JsObject, sourceProjection: JsObject, destinationProjection: JsObject
): JsObject {.importjs: "olNs_proj.transformWithProjections(#, #, #)".}

proc setUserProjection*(
  projection: JsObject
) {.importjs: "olNs_proj.setUserProjection(#)".}

proc clearUserProjection*() {.importjs: "olNs_proj.clearUserProjection()".}
proc getUserProjection*(): JsObject {.importjs: "olNs_proj.getUserProjection()".}
proc useGeographic*() {.importjs: "olNs_proj.useGeographic()".}
proc toUserCoordinate*(
  coordinate: seq[float], sourceProjection: JsObject
): seq[float] {.importjs: "olNs_proj.toUserCoordinate(#, #)".}

proc fromUserCoordinate*(
  coordinate: seq[float], destProjection: JsObject
): seq[float] {.importjs: "olNs_proj.fromUserCoordinate(#, #)".}

proc toUserExtent*(
  extent: JsObject, sourceProjection: JsObject
): JsObject {.importjs: "olNs_proj.toUserExtent(#, #)".}

proc fromUserExtent*(
  extent: JsObject, destProjection: JsObject
): JsObject {.importjs: "olNs_proj.fromUserExtent(#, #)".}

proc toUserResolution*(
  resolution: float, sourceProjection: JsObject
): float {.importjs: "olNs_proj.toUserResolution(#, #)".}

proc fromUserResolution*(
  resolution: float, destProjection: JsObject
): float {.importjs: "olNs_proj.fromUserResolution(#, #)".}

proc createSafeCoordinateTransform*(
  sourceProj: JsObject, destProj: JsObject, transform: JsObject
): JsObject {.importjs: "olNs_proj.createSafeCoordinateTransform(#, #, #)".}

proc addCommon*() {.importjs: "olNs_proj.addCommon()".}

proc getMETERS_PER_UNIT*(): JsObject {.importjs: "(olNs_proj.METERS_PER_UNIT)".}
proc getProjection*(): JsObject {.importjs: "(olNs_proj.Projection)".}
