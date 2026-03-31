import std/unittest

import jsffi
import openlayers

suite "openlayers aggregate module":
  test "re-exports remain available":
    check compiles(newOlMap())
    check newOlCollection() != nil
    check newOlTileRange(0.0, 1.0, 0.0, 1.0) != nil
    check compiles(fromLonLat(jsUndefined))
    check compiles(toLonLat(jsUndefined))
