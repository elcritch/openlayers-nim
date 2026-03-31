import std/unittest

import openlayers/proj

suite "openlayers/proj bindings":
  test "coordinate transforms round trip":
    let mercator = fromLonLat(@[10.0, 20.0])
    check mercator.len == 2

    let lonLat = toLonLat(mercator)
    check abs(lonLat[0] - 10.0) < 0.000001
    check abs(lonLat[1] - 20.0) < 0.000001
