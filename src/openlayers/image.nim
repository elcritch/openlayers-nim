import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olImageModule from 'ol/Image.js';".}
when defined(esmModules):
  {.emit: "import ImageWrapper from 'ol/Image.js';".}

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
