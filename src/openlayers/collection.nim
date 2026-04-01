import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_Collection from 'ol/Collection.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_Collection)".}

type Collection* = ref object of JsRoot
proc newCollection*(): Collection {.importjs: "(new olNs_Collection.default())".}
proc clear*(self: Collection) {.importjs: "#.clear()".}
proc extend*(self: Collection, arr: JsObject): Collection {.importjs: "#.extend(#)".}
proc extend*[T](self: Collection, arr: seq[T]): Collection {.importjs: "#.extend(#)".}
proc getLength*(self: Collection): float {.importjs: "#.getLength()".}
proc item*(self: Collection, index: float): JsObject {.importjs: "#.item(#)".}

type CollectionOptions* = ref object of JsRoot

proc newCollectionOptions*(): CollectionOptions {.importjs: "({})".}
proc `unique=`*(options: CollectionOptions, value: bool) {.importjs: "#.unique = #".}

proc newCollection*(
  options: CollectionOptions
): Collection {.importjs: "(new olNs_Collection.default(#))".}
