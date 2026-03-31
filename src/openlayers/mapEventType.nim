import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olMapEventTypeModule from 'ol/MapEventType.js';".}
{.emit: "import mapEventTypeDefault from 'ol/MapEventType.js';".}

proc hasMapEventTypeModule*(): bool {.
  importjs: "(typeof olMapEventTypeModule !== 'undefined')"
.}

proc hasMapEventTypeDefaultExport*(): bool {.
  importjs: "(typeof mapEventTypeDefault !== 'undefined')"
.}

proc getOlMapEventType*(): JsObject {.importjs: "(mapEventTypeDefault)".}
