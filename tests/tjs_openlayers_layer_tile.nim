import std/unittest

import jsffi
import openlayers/layer/tile
import openlayers/source/osm

suite "openlayers/layer/tile bindings":
  test "tile layer constructor is usable":
    let source = newOlOSM(jsUndefined)
    let layerOpts = newJsObject()
    layerOpts["source"] = source
    let layer = newOlTileLayer(layerOpts)
    check layer != nil
