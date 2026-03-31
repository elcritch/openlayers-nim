import std/unittest

import openlayers

suite "openlayers aggregate module":
  test "re-exports remain available":
    discard getControlNamespace()
    discard getOlMapEventType()
    check newOlCollection() != nil
    check newOlTileRange(0.0, 1.0, 0.0, 1.0) != nil

    let mercator = fromLonLat(@[10.0, 20.0])
    let lonLat = toLonLat(mercator)
    check abs(lonLat[0] - 10.0) < 0.000001
    check abs(lonLat[1] - 20.0) < 0.000001
