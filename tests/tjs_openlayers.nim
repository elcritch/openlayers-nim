import std/unittest

import openlayers

suite "openlayers aggregate module":
  test "re-exports remain available":
    check openLayersLoaded()
    check hasMapConstructor()
    check hasCollectionConstructor()
    check hasControlNamespace()
    check hasTileRangeConstructor()
    check hasMapEventTypeDefaultExport()

    let mercator = fromLonLat(@[10.0, 20.0])
    let lonLat = toLonLat(mercator)
    check abs(lonLat[0] - 10.0) < 0.000001
    check abs(lonLat[1] - 20.0) < 0.000001
