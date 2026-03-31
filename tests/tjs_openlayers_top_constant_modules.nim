import std/unittest

import openlayers/collectionEventType
import openlayers/imageState
import openlayers/mapBrowserEventType
import openlayers/mapEventType
import openlayers/mapProperty
import openlayers/objectEventType
import openlayers/tileState
import openlayers/viewHint
import openlayers/viewProperty

suite "openlayers top constant modules":
  test "default constant exports are exposed":
    check hasCollectionEventTypeDefaultExport()
    check hasImageStateDefaultExport()
    check hasMapBrowserEventTypeDefaultExport()
    check hasMapEventTypeDefaultExport()
    check hasMapPropertyDefaultExport()
    check hasObjectEventTypeDefaultExport()
    check hasTileStateDefaultExport()
    check hasViewHintDefaultExport()
    check hasViewPropertyDefaultExport()
