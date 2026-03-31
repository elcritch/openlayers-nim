import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olMapBrowserEventTypeModule from 'ol/MapBrowserEventType.js';".}
{.emit: "import mapBrowserEventTypeDefault from 'ol/MapBrowserEventType.js';".}

proc hasMapBrowserEventTypeModule*(): bool {.
  importjs: "(typeof olMapBrowserEventTypeModule !== 'undefined')"
.}

proc hasMapBrowserEventTypeDefaultExport*(): bool {.
  importjs: "(typeof mapBrowserEventTypeDefault !== 'undefined')"
.}

proc getOlMapBrowserEventType*(): JsObject {.importjs: "(mapBrowserEventTypeDefault)".}
