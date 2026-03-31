import std/unittest

import jsffi
import openlayers/map
import openlayers/view
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/source/osm
import openlayers/source/xyz
import openlayers/source/vector
import openlayers/source/tileJSON
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/interaction/select
import openlayers/control/attribution
import openlayers/control/defaults

suite "typed options wrappers":
  test "map/view options compile":
    check compiles(
      (
        block:
          let viewOpts = newViewOptions()
          viewOpts.center = jsUndefined
          viewOpts.constrainRotation = true
          viewOpts.constrainRotation = 4.0
          viewOpts.zoom = 3.0
          viewOpts.padding = @[10.0, 10.0, 10.0, 10.0]
          let viewObj = newView(viewOpts)

          let mapOpts = newMapOptions()
          mapOpts.target = "map".cstring
          mapOpts.view = viewObj
          mapOpts.layers = jsUndefined
          mapOpts.pixelRatio = 2.0
          discard newMap(mapOpts)
      )
    )

  test "layer and source options compile":
    check compiles(
      (
        block:
          let osmOpts = newOSMOptions()
          osmOpts.url = "https://tile.openstreetmap.org/{z}/{x}/{y}.png".cstring
          osmOpts.maxZoom = 19.0
          let osmSource = newOSM(osmOpts)

          let tileLayerOpts = newTileLayerOptions()
          tileLayerOpts.source = osmSource
          tileLayerOpts.className = "base".cstring
          let tileLayer = newTileLayer(tileLayerOpts)
          discard tileLayer

          let xyzOpts = newXYZOptions()
          xyzOpts.url = "https://example.com/{z}/{x}/{y}.png".cstring
          xyzOpts.tileSize = 512.0
          xyzOpts.urls = @["https://a.example.com/{z}/{x}/{y}.png".cstring]
          discard newXYZ(xyzOpts)

          let vectorSourceOpts = newVectorSourceOptions()
          vectorSourceOpts.url = "https://example.com/data.geojson".cstring
          vectorSourceOpts.wrapX = false
          let vectorSource = newVectorSource(vectorSourceOpts)

          let vectorLayerOpts = newVectorLayerOptions()
          vectorLayerOpts.source = vectorSource
          vectorLayerOpts.declutter = true
          vectorLayerOpts.background = "white".cstring
          discard newVectorLayer(vectorLayerOpts)

          let tileJsonConfig = newTileJSONConfig()
          tileJsonConfig.tiles = @["https://example.com/tiles/{z}/{x}/{y}.png".cstring]
          tileJsonConfig.maxzoom = 14.0

          let tileJsonOpts = newTileJSONOptions()
          tileJsonOpts.tileJSON = tileJsonConfig
          tileJsonOpts.tileSize = 256.0
          discard newTileJSON(tileJsonOpts)
      )
    )

  test "style, interaction, and control options compile":
    check compiles(
      (
        block:
          let fillOpts = newFillOptions()
          fillOpts.color = "rgba(255, 255, 255, 0.6)".cstring
          let fillObj = newFill(fillOpts)

          let strokeOpts = newStrokeOptions()
          strokeOpts.color = "#3399CC".cstring
          strokeOpts.width = 1.25
          let strokeObj = newStroke(strokeOpts)

          let styleOpts = newStyleOptions()
          styleOpts.fill = fillObj
          styleOpts.stroke = strokeObj
          let styleObj = newStyle(styleOpts)

          let selectOpts = newSelectOptions()
          selectOpts.style = styleObj
          selectOpts.multi = true
          selectOpts.hitTolerance = 5.0
          discard newSelect(selectOpts)

          let attributionOpts = newAttributionOptions()
          attributionOpts.collapsible = false
          attributionOpts.attributions = @["example attribution".cstring]
          let attribution = newAttribution(attributionOpts)

          let defaultsOpts = newControlDefaultsOptions()
          defaultsOpts.attribution = true
          defaultsOpts.attributionOptions = attributionOpts
          discard defaults(defaultsOpts)
      )
    )
