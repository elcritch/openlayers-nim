import jsffi
import karax/[karaxdsl, vdom]
import openlayers/format/kml
import openlayers/layer/heatmap
import openlayers/layer/tile
import openlayers/map
import openlayers/source/stadiaMaps
import openlayers/source/vector
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var
  initialized = false
  mapObj: JsObject = jsUndefined

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Earthquakes Heatmap"
    tdiv(id = "map", class = "map map-with-controls")
    form(class = "example-controls"):
      label(`for` = "radius"):
        text "Radius"
      input(
        id = "radius", `type` = "range", min = "1", max = "50", step = "1", value = "5"
      )
      label(`for` = "blur"):
        text "Blur"
      input(
        id = "blur", `type` = "range", min = "1", max = "50", step = "1", value = "15"
      )

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let kmlOptions = newKMLOptions()
  kmlOptions.extractStyles = false

  let sourceOptions = newVectorSourceOptions()
  sourceOptions.url =
    "/deps/openlayers/examples/data/kml/2012_Earthquakes_Mag5.kml".cstring
  sourceOptions.format = newKML(kmlOptions)
  let heatSource = newVectorSource(sourceOptions)

  let heatmapOptions = newHeatmapOptions()
  heatmapOptions.source = heatSource
  heatmapOptions.weight = makeEarthquakesHeatWeightFn()
  let heatmapLayer = newHeatmap(heatmapOptions)

  let stadiaOptions = newStadiaMapsOptions()
  stadiaOptions.layer = "stamen_toner".cstring
  let stadiaSource = newStadiaMaps(stadiaOptions)

  let rasterOptions = newTileLayerOptions()
  rasterOptions.source = stadiaSource
  let rasterLayer = newTileLayer(rasterOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[rasterLayer, heatmapLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  installHeatmapControls(cast[JsObject](heatmapLayer))
  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
