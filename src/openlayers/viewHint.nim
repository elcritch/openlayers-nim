import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olViewHintModule from 'ol/ViewHint.js';".}
when defined(esmModules):
  {.emit: "import viewHintDefault from 'ol/ViewHint.js';".}
proc getOlViewHint*(): JsObject {.importjs: "(viewHintDefault)".}
