import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import * as olImageModule from 'ol/Image.js';".}
{.emit: "import ImageWrapper from 'ol/Image.js';".}

proc hasImageModule*(): bool {.importjs: "(typeof olImageModule !== 'undefined')".}
proc hasImageWrapperConstructor*(): bool {.
  importjs: "(typeof ImageWrapper === 'function')"
.}

type OlImageWrapper* = ref object of JsRoot

proc newOlImageWrapper*(
  extent: JsObject, resolution: JsObject, pixelRatio: float, stateOrLoader: JsObject
): OlImageWrapper {.importjs: "(new ImageWrapper(#, #, #, #))".}

proc listenImage*(
  image: JsObject, loadHandler: JsObject, errorHandler: JsObject
): JsObject {.importjs: "olImageModule.listenImage(#, #, #)".}

proc load*(
  image: JsObject, src: JsObject = jsUndefined
): JsObject {.importjs: "olImageModule.load(#, #)".}

proc decodeFallback*(
  image: JsObject, src: JsObject = jsUndefined
): JsObject {.importjs: "olImageModule.decodeFallback(#, #)".}

proc decode*(
  image: JsObject, src: JsObject = jsUndefined
): JsObject {.importjs: "olImageModule.decode(#, #)".}
