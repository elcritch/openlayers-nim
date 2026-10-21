## Global bindings must allow a dashboard to handle an unavailable CDN gracefully.
import openlayers/[map, view, properties]
import openlayers/layer/[image, operations]
import openlayers/geom/multiPolygon
import openlayers/render/event

import std/unittest

when defined(openlayers.globalBundle):
  proc bundleAvailable(): bool {.importjs: "(typeof globalThis.ol !== 'undefined')".}

  suite "unavailable browser bundle":
    test "importing bindings and preparing options does not require the bundle":
      check not bundleAvailable()
      let options = newMapOptions()
      options.target = "map"
      let imageOptions = newImageLayerOptions()
      imageOptions.visible = false
