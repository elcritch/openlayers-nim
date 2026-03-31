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
  test "namespaces are exposed":
    check hasControlNamespace()
    check hasInteractionNamespace()
    check hasLayerNamespace()
    check hasSourceNamespace()
    check hasStyleNamespace()
    check hasGeomNamespace()
    check hasFormatNamespace()
    check hasTilegridNamespace()
    check hasRenderNamespace()
    check hasWebglNamespace()
