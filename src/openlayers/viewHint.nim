import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olViewHintModule from 'ol/ViewHint.js';".}
{.emit: "import viewHintDefault from 'ol/ViewHint.js';".}

proc hasViewHintModule*(): bool {.
  importjs: "(typeof olViewHintModule !== 'undefined')"
.}

proc hasViewHintDefaultExport*(): bool {.
  importjs: "(typeof viewHintDefault !== 'undefined')"
.}

proc getOlViewHint*(): JsObject {.importjs: "(viewHintDefault)".}
