import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olViewPropertyModule from 'ol/ViewProperty.js';".}
{.emit: "import viewPropertyDefault from 'ol/ViewProperty.js';".}

proc hasViewPropertyModule*(): bool {.
  importjs: "(typeof olViewPropertyModule !== 'undefined')"
.}

proc hasViewPropertyDefaultExport*(): bool {.
  importjs: "(typeof viewPropertyDefault !== 'undefined')"
.}

proc getOlViewProperty*(): JsObject {.importjs: "(viewPropertyDefault)".}
