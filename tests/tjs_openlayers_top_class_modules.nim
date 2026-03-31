import std/unittest

import jsffi
import openlayers/collection
import openlayers/dataTile
import openlayers/disposable
import openlayers/feature
import openlayers/geolocation
import openlayers/image
import openlayers/imageCanvas
import openlayers/imageTile
import openlayers/kinetic
import openlayers/mapBrowserEvent
import openlayers/mapBrowserEventHandler
import openlayers/mapEvent
import openlayers/baseObject
import openlayers/observable
import openlayers/overlay
import openlayers/tile
import openlayers/tileQueue
import openlayers/tileRange
import openlayers/vectorRenderTile
import openlayers/vectorTile

suite "openlayers top class modules":
  test "constructors are available via wrappers":
    check newOlCollection() != nil
    check newOlDisposable() != nil
    check newOlFeature() != nil
    check newOlGeolocation() != nil
    check newOlBaseObject() != nil
    check newOlObservable() != nil
    check newOlKinetic(1.0, 1.0, 1.0) != nil
    check newOlTileRange(0.0, 1.0, 0.0, 1.0) != nil

    check compiles(newOlDataTile(jsUndefined))
    check compiles(newOlImageWrapper(jsUndefined, jsUndefined, 1.0, jsUndefined))
    check compiles(newOlImageCanvas(jsUndefined, 1.0, 1.0, jsUndefined))
    check compiles(
      newOlImageTile(jsUndefined, jsUndefined, "", jsUndefined, jsUndefined)
    )
    check compiles(newOlMapBrowserEvent("click", jsUndefined, jsUndefined))
    check compiles(newOlMapBrowserEventHandler(jsUndefined))
    check compiles(newOlMapEvent("moveend", jsUndefined))
    check compiles(newOlOverlay())
    check compiles(newOlTile(jsUndefined, jsUndefined))
    check compiles(newOlTileQueue(jsUndefined, jsUndefined))
    check compiles(
      newOlVectorRenderTile(
        jsUndefined, jsUndefined, jsUndefined, jsUndefined, jsUndefined
      )
    )
    check compiles(
      newOlVectorTile(jsUndefined, jsUndefined, "", jsUndefined, jsUndefined)
    )
