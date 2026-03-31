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
          let viewOpts = newOlViewOptions()
          viewOpts.center = jsUndefined
          viewOpts.constrainRotation = true
          viewOpts.constrainRotation = 4.0
          viewOpts.zoom = 3.0
          viewOpts.padding = @[10.0, 10.0, 10.0, 10.0]
          let viewObj = newOlView(viewOpts)

          let mapOpts = newOlMapOptions()
          mapOpts.target = "map".cstring
          mapOpts.view = viewObj
          mapOpts.layers = jsUndefined
          mapOpts.pixelRatio = 2.0
          discard newOlMap(mapOpts)
      )
    )

  test "layer and source options compile":
    check compiles(
      (
        block:
          let osmOpts = newOlOSMOptions()
          osmOpts.url = "https://tile.openstreetmap.org/{z}/{x}/{y}.png".cstring
          osmOpts.maxZoom = 19.0
          let osmSource = newOlOSM(osmOpts)

          let tileLayerOpts = newOlTileLayerOptions()
          tileLayerOpts.source = osmSource
          tileLayerOpts.className = "base".cstring
          let tileLayer = newOlTileLayer(tileLayerOpts)
          discard tileLayer

          let xyzOpts = newOlXYZOptions()
          xyzOpts.url = "https://example.com/{z}/{x}/{y}.png".cstring
          xyzOpts.tileSize = 512.0
          xyzOpts.urls = @["https://a.example.com/{z}/{x}/{y}.png".cstring]
          discard newOlXYZ(xyzOpts)

          let vectorSourceOpts = newOlVectorSourceOptions()
          vectorSourceOpts.url = "https://example.com/data.geojson".cstring
          vectorSourceOpts.wrapX = false
          let vectorSource = newOlVectorSource(vectorSourceOpts)

          let vectorLayerOpts = newOlVectorLayerOptions()
          vectorLayerOpts.source = vectorSource
          vectorLayerOpts.declutter = true
          vectorLayerOpts.background = "white".cstring
          discard newOlVectorLayer(vectorLayerOpts)

          let tileJsonConfig = newOlTileJSONConfig()
          tileJsonConfig.tiles = @["https://example.com/tiles/{z}/{x}/{y}.png".cstring]
          tileJsonConfig.maxzoom = 14.0

          let tileJsonOpts = newOlTileJSONOptions()
          tileJsonOpts.tileJSON = tileJsonConfig
          tileJsonOpts.tileSize = 256.0
          discard newOlTileJSON(tileJsonOpts)
      )
    )

  test "style, interaction, and control options compile":
    check compiles(
      (
        block:
          let fillOpts = newOlFillOptions()
          fillOpts.color = "rgba(255, 255, 255, 0.6)".cstring
          let fillObj = newOlFill(fillOpts)

          let strokeOpts = newOlStrokeOptions()
          strokeOpts.color = "#3399CC".cstring
          strokeOpts.width = 1.25
          let strokeObj = newOlStroke(strokeOpts)

          let styleOpts = newOlStyleOptions()
          styleOpts.fill = fillObj
          styleOpts.stroke = strokeObj
          let styleObj = newOlStyle(styleOpts)

          let selectOpts = newOlSelectOptions()
          selectOpts.style = styleObj
          selectOpts.multi = true
          selectOpts.hitTolerance = 5.0
          discard newOlSelect(selectOpts)

          let attributionOpts = newOlAttributionOptions()
          attributionOpts.collapsible = false
          attributionOpts.attributions = @["example attribution".cstring]
          let attribution = newOlAttribution(attributionOpts)

          let defaultsOpts = newOlControlDefaultsOptions()
          defaultsOpts.attribution = true
          defaultsOpts.attributionOptions = attributionOpts
          discard defaults(defaultsOpts)
      )
    )
