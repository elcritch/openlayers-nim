import std/unittest

import openlayers/control
import openlayers/interaction
import openlayers/layer
import openlayers/source
import openlayers/style
import openlayers/geom
import openlayers/format
import openlayers/tilegrid
import openlayers/render
import openlayers/webgl

suite "openlayers top namespace modules":
  test "namespaces are accessible":
    discard getControlNamespace()
    discard getInteractionNamespace()
    discard getLayerNamespace()
    discard getSourceNamespace()
    discard getStyleNamespace()
    discard getGeomNamespace()
    discard getFormatNamespace()
    discard getTilegridNamespace()
    discard getRenderNamespace()
    discard getWebglNamespace()
    check true
