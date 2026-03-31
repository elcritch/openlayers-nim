import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter from 'ol/format/filter.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter)".}

proc andVal*(args: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.and(#)".}
proc orVal*(args: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.or(#)".}
proc notVal*(condition: JsObject): JsObject {.importjs: "olNs_format_filter.not(#)".}
proc bbox*(geometryName: cstring, extent: JsObject, srsName: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.bbox(#, #, #)".}
proc contains*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.contains(#, #, #)".}
proc intersects*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.intersects(#, #, #)".}
proc disjoint*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.disjoint(#, #, #)".}
proc within*(geometryName: cstring, geometry: JsObject, srsName: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.within(#, #, #)".}
proc dwithin*(geometryName: cstring, geometry: JsObject, distance: float, unit: cstring, srsName: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.dwithin(#, #, #, #, #)".}
proc equalTo*(propertyName: cstring, expression: JsObject, matchCase: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.equalTo(#, #, #)".}
proc notEqualTo*(propertyName: cstring, expression: JsObject, matchCase: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.notEqualTo(#, #, #)".}
proc lessThan*(propertyName: cstring, expression: float): JsObject {.importjs: "olNs_format_filter.lessThan(#, #)".}
proc lessThanOrEqualTo*(propertyName: cstring, expression: float): JsObject {.importjs: "olNs_format_filter.lessThanOrEqualTo(#, #)".}
proc greaterThan*(propertyName: cstring, expression: float): JsObject {.importjs: "olNs_format_filter.greaterThan(#, #)".}
proc greaterThanOrEqualTo*(propertyName: cstring, expression: float): JsObject {.importjs: "olNs_format_filter.greaterThanOrEqualTo(#, #)".}
proc isNull*(propertyName: cstring): JsObject {.importjs: "olNs_format_filter.isNull(#)".}
proc between*(propertyName: cstring, lowerBoundary: float, upperBoundary: float): JsObject {.importjs: "olNs_format_filter.between(#, #, #)".}
proc like*(propertyName: cstring, pattern: cstring, wildCard: JsObject = jsUndefined, singleChar: JsObject = jsUndefined, escapeChar: JsObject = jsUndefined, matchCase: JsObject = jsUndefined): JsObject {.importjs: "olNs_format_filter.like(#, #, #, #, #, #)".}
proc during*(propertyName: cstring, begin: cstring, endVal: cstring): JsObject {.importjs: "olNs_format_filter.during(#, #, #)".}
proc resourceId*(rid: JsObject): JsObject {.importjs: "olNs_format_filter.resourceId(#)".}
