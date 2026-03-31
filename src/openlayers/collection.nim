import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olCollectionModule from 'ol/Collection.js';".}
{.emit: "import Collection from 'ol/Collection.js';".}

proc hasCollectionModule*(): bool {.
  importjs: "(typeof olCollectionModule !== 'undefined')"
.}

proc hasCollectionConstructor*(): bool {.
  importjs: "(typeof Collection === 'function')"
.}

type OlCollection* = ref object of JsRoot

proc newOlCollection*(): OlCollection {.importjs: "(new Collection())".}
