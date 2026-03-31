import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Collection from 'ol/Collection.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Collection)".}

type
  Collection* = ref object of JsRoot
proc newCollection*(): Collection {.importjs: "(new olNs_Collection.default())".}
