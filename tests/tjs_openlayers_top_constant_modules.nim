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
  test "default exports are accessible":
    discard getOlCollectionEventType()
    discard getOlImageState()
    discard getOlMapBrowserEventType()
    discard getOlMapEventType()
    discard getOlMapProperty()
    discard getOlObjectEventType()
    discard getOlTileState()
    discard getOlViewHint()
    discard getOlViewProperty()
    check true
