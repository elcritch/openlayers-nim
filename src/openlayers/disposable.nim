import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olDisposableModule from 'ol/Disposable.js';".}
when defined(esmModules):
  {.emit: "import Disposable from 'ol/Disposable.js';".}
type OlDisposable* = ref object of JsRoot

proc newOlDisposable*(): OlDisposable {.importjs: "(new Disposable())".}
