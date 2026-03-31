import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olCollectionModule from 'ol/Collection.js';".}
when defined(esmModules):
  {.emit: "import Collection from 'ol/Collection.js';".}
type OlCollection* = ref object of JsRoot

proc newOlCollection*(): OlCollection {.importjs: "(new Collection())".}
