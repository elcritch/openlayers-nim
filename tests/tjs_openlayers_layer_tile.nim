import std/unittest

import jsffi
import openlayers/layer/tile
import openlayers/source/osm

suite "openlayers/layer/tile bindings":
  test "tile layer can hold an OSM source":
    let source = newOsmSource()
    let layerOpts = newJsObject()
    layerOpts["source"] = source
    let layer = newTileLayer(layerOpts)
    check layer.getSource() == source
