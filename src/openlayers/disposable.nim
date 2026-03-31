import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olDisposableModule from 'ol/Disposable.js';".}
{.emit: "import Disposable from 'ol/Disposable.js';".}

proc hasDisposableModule*(): bool {.
  importjs: "(typeof olDisposableModule !== 'undefined')"
.}

proc hasDisposableConstructor*(): bool {.
  importjs: "(typeof Disposable === 'function')"
.}

type OlDisposable* = ref object of JsRoot

proc newOlDisposable*(): OlDisposable {.importjs: "(new Disposable())".}
