import std/unittest

import jsffi
import openlayers

suite "openlayers aggregate module":
  test "re-exports remain available":
    check compiles(newOlMap())
    check newOlCollection() != nil
    check newOlFeature() != nil
    check compiles(newOlView(jsUndefined))
    check compiles(fromLonLat(jsUndefined))
    check compiles(toLonLat(jsUndefined))
