import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when not defined(openlayers.noEsmModules):
  {.emit: "import * as olNs_array from 'ol/array.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_array)".}

proc binarySearch*(haystack: JsObject, needle: JsObject, comparator: JsObject = jsUndefined): float {.importjs: "olNs_array.binarySearch(#, #, #)".}
proc ascending*(a: JsObject, b: JsObject): float {.importjs: "olNs_array.ascending(#, #)".}
proc descending*(a: JsObject, b: JsObject): float {.importjs: "olNs_array.descending(#, #)".}
proc linearFindNearest*(arr: seq[float], target: float, direction: JsObject): float {.importjs: "olNs_array.linearFindNearest(#, #, #)".}
proc reverseSubArray*(arr: JsObject, begin: float, endVal: float) {.importjs: "olNs_array.reverseSubArray(#, #, #)".}
proc extend*(arr: JsObject, data: JsObject) {.importjs: "olNs_array.extend(#, #)".}
proc remove*(arr: JsObject, obj: JsObject): bool {.importjs: "olNs_array.remove(#, #)".}
proc equals*(arr1: JsObject, arr2: JsObject): bool {.importjs: "olNs_array.equals(#, #)".}
proc stableSort*(arr: JsObject, compareFnc: JsObject) {.importjs: "olNs_array.stableSort(#, #)".}
proc isSorted*(arr: JsObject, funcVal: JsObject = jsUndefined, strict: JsObject = jsUndefined): bool {.importjs: "olNs_array.isSorted(#, #, #)".}
