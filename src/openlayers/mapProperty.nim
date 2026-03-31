import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olMapPropertyModule from 'ol/MapProperty.js';".}
{.emit: "import mapPropertyDefault from 'ol/MapProperty.js';".}

proc hasMapPropertyModule*(): bool {.
  importjs: "(typeof olMapPropertyModule !== 'undefined')"
.}

proc hasMapPropertyDefaultExport*(): bool {.
  importjs: "(typeof mapPropertyDefault !== 'undefined')"
.}

proc getOlMapProperty*(): JsObject {.importjs: "(mapPropertyDefault)".}
