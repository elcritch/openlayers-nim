import jsffi

import ../source/osm

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import TileLayer from 'ol/layer/Tile.js';".}

type OlTileLayer* = ref object of JsRoot

proc newTileLayer*(
  options: JsObject = jsUndefined
): OlTileLayer {.importjs: "(new TileLayer(#))".}

proc getSource*(layer: OlTileLayer): OlOsmSource {.importjs: "#.getSource()".}
