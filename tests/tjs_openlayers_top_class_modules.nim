import std/unittest

import jsffi
import openlayers/collection
import openlayers/dataTile
import openlayers/feature
import openlayers/geolocation
import openlayers/image
import openlayers/imageTile
import openlayers/kinetic
import openlayers/map
import openlayers/mapBrowserEvent
import openlayers/mapEvent
import openlayers/observable
import openlayers/overlay
import openlayers/tile
import openlayers/vectorTile
import openlayers/view

suite "openlayers top class modules":
  test "constructors are available via wrappers":
    check newOlCollection() != nil
    check newOlFeature() != nil
    check newOlGeolocation() != nil
    check newOlObservable() != nil
    check newOlKinetic(1.0, 1.0, 1.0) != nil
    check compiles(newOlMap())
    check compiles(newOlView(jsUndefined))

    check compiles(newOlDataTile(jsUndefined))
    check compiles(newOlImageWrapper(jsUndefined, jsUndefined, 1.0, jsUndefined))
    check compiles(
      newOlImageTile(jsUndefined, jsUndefined, "", jsUndefined, jsUndefined)
    )
    check compiles(newOlMapBrowserEvent("click", jsUndefined, jsUndefined))
    check compiles(newOlMapEvent("moveend", jsUndefined))
    check compiles(newOlOverlay())
    check compiles(newOlTile(jsUndefined, jsUndefined))
    check compiles(
      newOlVectorTile(jsUndefined, jsUndefined, "", jsUndefined, jsUndefined)
    )
