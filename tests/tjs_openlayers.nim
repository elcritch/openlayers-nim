import std/unittest

import jsffi
import openlayers

suite "openlayers aggregate module":
  test "re-exports remain available":
    check compiles(newMap())
    check newCollection() != nil
    check newFeature() != nil
    check compiles(newView(jsUndefined))
    check compiles(fromLonLat(jsUndefined))
    check compiles(toLonLat(jsUndefined))
