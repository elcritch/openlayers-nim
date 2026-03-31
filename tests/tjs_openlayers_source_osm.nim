import std/unittest

import jsffi
import openlayers/source/osm

suite "openlayers/source/osm bindings":
  test "can construct OSM source":
    let source = newOlOSM(jsUndefined)
    check source != nil
    discard getATTRIBUTION()
