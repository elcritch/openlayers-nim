import std/unittest

import jsffi
import openlayers/view

suite "openlayers/view bindings":
  test "module is loaded":
    check openLayersLoaded()

  test "view center and zoom accessors":
    let viewOpts = newJsObject()
    viewOpts["center"] = @[0.0, 0.0]
    viewOpts["zoom"] = 3.0
    let view = newOlView(viewOpts)
    check abs(view.getZoom() - 3.0) < 0.000001

    view.setCenter(@[25.0, 35.0])
    let center = view.getCenter()
    check center.len == 2
    check abs(center[0] - 25.0) < 0.000001
    check abs(center[1] - 35.0) < 0.000001

    view.setZoom(4.5)
    check abs(view.getZoom() - 4.5) < 0.000001
