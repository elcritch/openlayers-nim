import std/unittest

import openlayers/map

suite "openlayers/map bindings":
  test "map constructor is available":
    check hasMapConstructor()
