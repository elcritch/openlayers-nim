import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olCollectionEventTypeModule from 'ol/CollectionEventType.js';".}
{.emit: "import collectionEventTypeDefault from 'ol/CollectionEventType.js';".}

proc hasCollectionEventTypeModule*(): bool {.
  importjs: "(typeof olCollectionEventTypeModule !== 'undefined')"
.}

proc hasCollectionEventTypeDefaultExport*(): bool {.
  importjs: "(typeof collectionEventTypeDefault !== 'undefined')"
.}

proc getOlCollectionEventType*(): JsObject {.importjs: "(collectionEventTypeDefault)".}
