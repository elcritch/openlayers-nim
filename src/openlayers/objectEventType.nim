import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olObjectEventTypeModule from 'ol/ObjectEventType.js';".}
{.emit: "import objectEventTypeDefault from 'ol/ObjectEventType.js';".}

proc hasObjectEventTypeModule*(): bool {.
  importjs: "(typeof olObjectEventTypeModule !== 'undefined')"
.}

proc hasObjectEventTypeDefaultExport*(): bool {.
  importjs: "(typeof objectEventTypeDefault !== 'undefined')"
.}

proc getOlObjectEventType*(): JsObject {.importjs: "(objectEventTypeDefault)".}
