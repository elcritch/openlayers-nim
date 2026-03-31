import std/unittest

import openlayers/source/osm

suite "openlayers/source/osm bindings":
  test "can construct OSM source":
    let source = newOsmSource()
    check source != nil
