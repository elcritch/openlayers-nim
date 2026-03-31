import std/unittest

import openlayers/map

suite "openlayers/map bindings":
  test "map constructor wrapper is usable":
    check compiles(newMap())
