import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olCollectionEventTypeModule from 'ol/CollectionEventType.js';".}
when defined(esmModules):
  {.emit: "import collectionEventTypeDefault from 'ol/CollectionEventType.js';".}
proc getOlCollectionEventType*(): JsObject {.importjs: "(collectionEventTypeDefault)".}
