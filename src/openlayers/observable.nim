import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olObservableModule from 'ol/Observable.js';".}
when defined(esmModules):
  {.emit: "import Observable from 'ol/Observable.js';".}
type OlObservable* = ref object of JsRoot

proc newOlObservable*(): OlObservable {.importjs: "(new Observable())".}

proc unByKey*(key: JsObject): void {.importjs: "olObservableModule.unByKey(#)".}
