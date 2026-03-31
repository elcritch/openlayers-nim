import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Observable from 'ol/Observable.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Observable)".}

type
  OlObservable* = ref object of JsRoot
proc newOlObservable*(): OlObservable {.importjs: "(new olNs_Observable.default())".}
proc changed*(self: OlObservable) {.importjs: "#.changed()".}
proc getRevision*(self: OlObservable): float {.importjs: "#.getRevision()".}
proc onInternal*(self: OlObservable, typeVal: JsObject, listener: JsObject): JsObject {.importjs: "#.onInternal(#, #)".}
proc onceInternal*(self: OlObservable, typeVal: JsObject, listener: JsObject): JsObject {.importjs: "#.onceInternal(#, #)".}
proc unInternal*(self: OlObservable, typeVal: JsObject, listener: JsObject) {.importjs: "#.unInternal(#, #)".}

proc unByKey*(key: JsObject) {.importjs: "olNs_Observable.unByKey(#)".}
