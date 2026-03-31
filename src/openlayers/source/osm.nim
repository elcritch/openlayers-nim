import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import OSM from 'ol/source/OSM.js';".}

type OlOsmSource* = ref object of JsRoot

proc newOsmSource*(
  options: JsObject = jsUndefined
): OlOsmSource {.importjs: "(new OSM(#))".}
