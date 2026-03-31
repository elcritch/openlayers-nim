import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olObservableModule from 'ol/Observable.js';".}
{.emit: "import Observable from 'ol/Observable.js';".}

proc hasObservableModule*(): bool {.
  importjs: "(typeof olObservableModule !== 'undefined')"
.}

proc hasObservableConstructor*(): bool {.
  importjs: "(typeof Observable === 'function')"
.}

type OlObservable* = ref object of JsRoot

proc newOlObservable*(): OlObservable {.importjs: "(new Observable())".}

proc unByKey*(key: JsObject): void {.importjs: "olObservableModule.unByKey(#)".}
