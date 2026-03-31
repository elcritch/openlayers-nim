import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olImageStateModule from 'ol/ImageState.js';".}
{.emit: "import imageStateDefault from 'ol/ImageState.js';".}

proc hasImageStateModule*(): bool {.
  importjs: "(typeof olImageStateModule !== 'undefined')"
.}

proc hasImageStateDefaultExport*(): bool {.
  importjs: "(typeof imageStateDefault !== 'undefined')"
.}

proc getOlImageState*(): JsObject {.importjs: "(imageStateDefault)".}
