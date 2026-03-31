import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Disposable from 'ol/Disposable.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Disposable)".}

type
  OlDisposable* = ref object of JsRoot
proc newOlDisposable*(): OlDisposable {.importjs: "(new olNs_Disposable.default())".}
proc dispose*(self: OlDisposable) {.importjs: "#.dispose()".}
proc disposeInternal*(self: OlDisposable) {.importjs: "#.disposeInternal()".}
