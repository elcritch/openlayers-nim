import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olImageStateModule from 'ol/ImageState.js';".}
when defined(esmModules):
  {.emit: "import imageStateDefault from 'ol/ImageState.js';".}
proc getOlImageState*(): JsObject {.importjs: "(imageStateDefault)".}
