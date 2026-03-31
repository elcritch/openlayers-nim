import std/unittest

import openlayers/control as controlNs
import openlayers/interaction as interactionNs
import openlayers/layer as layerNs
import openlayers/source as sourceNs
import openlayers/style as styleNs
import openlayers/geom as geomNs
import openlayers/format as formatNs
import openlayers/tilegrid as tilegridNs
import openlayers/render as renderNs
import openlayers/webgl as webglNs

suite "openlayers top namespace modules":
  test "namespaces are accessible":
    discard controlNs.getNamespace()
    discard interactionNs.getNamespace()
    discard layerNs.getNamespace()
    discard sourceNs.getNamespace()
    discard styleNs.getNamespace()
    discard geomNs.getNamespace()
    discard formatNs.getNamespace()
    discard tilegridNs.getNamespace()
    discard renderNs.getNamespace()
    discard webglNs.getNamespace()
    check true
