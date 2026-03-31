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
    check newCollection() != nil
    check newFeature() != nil
    check newGeolocation() != nil
    check newObservable() != nil
    check newKinetic(1.0, 1.0, 1.0) != nil
    check compiles(newMap())
    check compiles(newView(jsUndefined))

    check compiles(newDataTile(jsUndefined))
    check compiles(newImageWrapper(jsUndefined, jsUndefined, 1.0, jsUndefined))
    check compiles(
      newImageTile(jsUndefined, jsUndefined, "", jsUndefined, jsUndefined)
    )
    check compiles(newMapBrowserEvent("click", jsUndefined, jsUndefined))
    check compiles(newMapEvent("moveend", jsUndefined))
    check compiles(newOverlay())
    check compiles(newTile(jsUndefined, jsUndefined))
    check compiles(
      newVectorTile(jsUndefined, jsUndefined, "", jsUndefined, jsUndefined)
    )
