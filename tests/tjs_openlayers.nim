import std/unittest

when not defined(js):
  suite "openlayers bindings":
    test "requires JavaScript backend":
      check true

import jsffi
import openlayers

suite "openlayers bindings":
  test "modules are loaded":
    check openLayersLoaded()
    check hasMapConstructor()

  test "coordinate transforms round trip":
    let mercator = fromLonLat(@[10.0, 20.0])
    check mercator.len == 2
    let lonLat = toLonLat(mercator)
    check abs(lonLat[0] - 10.0) < 0.000001
    check abs(lonLat[1] - 20.0) < 0.000001

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

  test "tile layer can hold an OSM source":
    let source = newOsmSource()
    let layerOpts = newJsObject()
    layerOpts["source"] = source
    let layer = newTileLayer(layerOpts)
    check layer.getSource() == source

