import std/unittest

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
  test "class constructors are exposed":
    check hasCollectionConstructor()
    check hasDataTileConstructor()
    check hasDisposableConstructor()
    check hasFeatureConstructor()
    check hasGeolocationConstructor()
    check hasImageWrapperConstructor()
    check hasImageCanvasConstructor()
    check hasImageTileConstructor()
    check hasKineticConstructor()
    check hasMapBrowserEventConstructor()
    check hasMapBrowserEventHandlerConstructor()
    check hasMapEventConstructor()
    check hasBaseObjectConstructor()
    check hasObservableConstructor()
    check hasOverlayConstructor()
    check hasTileConstructor()
    check hasTileQueueConstructor()
    check hasTileRangeConstructor()
    check hasVectorRenderTileConstructor()
    check hasVectorTileConstructor()
