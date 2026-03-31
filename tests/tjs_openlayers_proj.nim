import std/unittest

import jsffi
import openlayers/proj

suite "openlayers/proj bindings":
  test "projection helpers are callable":
    discard getNamespace()
    check compiles(fromLonLat(jsUndefined))
    check compiles(toLonLat(jsUndefined))
