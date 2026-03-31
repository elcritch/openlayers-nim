import std/unittest

import jsffi
import openlayers/view

suite "openlayers/view bindings":
  test "module namespace is available":
    discard getNamespace()

  test "constructor and core methods compile":
    check compiles(newOlView(jsUndefined))
    let view = newOlView(jsUndefined)
    check compiles(view.getZoom())
    check compiles(view.setZoom(4.5))
    check compiles(view.getCenter())
    check compiles(view.setCenter(jsUndefined))
