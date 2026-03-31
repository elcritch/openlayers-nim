import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Observable from 'ol/Observable.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Observable)".}

type Observable* = ref object of JsRoot
proc newObservable*(): Observable {.importjs: "(new olNs_Observable.default())".}
proc changed*(self: Observable) {.importjs: "#.changed()".}
proc getRevision*(self: Observable): float {.importjs: "#.getRevision()".}
proc onInternal*(
  self: Observable, typeVal: JsObject, listener: JsObject
): JsObject {.importjs: "#.onInternal(#, #)".}

proc onceInternal*(
  self: Observable, typeVal: JsObject, listener: JsObject
): JsObject {.importjs: "#.onceInternal(#, #)".}

proc unInternal*(
  self: Observable, typeVal: JsObject, listener: JsObject
) {.importjs: "#.unInternal(#, #)".}

proc unByKey*(key: JsObject) {.importjs: "olNs_Observable.unByKey(#)".}
