import jsffi
import std/[parseutils, strutils]
import dom
import karax/[karaxdsl, vdom]
import openlayers/format/geoJSON
import openlayers/layer/base
import openlayers/layer/group
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/map
import openlayers/proj
import openlayers/source/osm
import openlayers/source/vector
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

var
  initialized = false
  mapObj: JsObject = jsUndefined

proc inputFloatValue(el: Element, fallback: float): float =
  var parsed = 0.0
  let raw = $cast[InputElement](el).value
  if parseutils.parseFloat(raw, parsed) > 0:
    return parsed
  fallback

proc bindBaseLayerInputs(idPrefix: string, layer: BaseLayer) =
  let visibleInput = dom.getElementById((idPrefix & "-visible").cstring)
  let opacityInput = dom.getElementById((idPrefix & "-opacity").cstring)
  let opacityValue = dom.getElementById((idPrefix & "-opacity-value").cstring)
  if visibleInput.isNil or opacityInput.isNil:
    return

  cast[InputElement](visibleInput).checked = layer.getVisible()
  cast[InputElement](opacityInput).value =
    formatFloat(layer.getOpacity(), ffDecimal, 2).cstring
  if not opacityValue.isNil:
    cast[Element](opacityValue).innerText = cast[InputElement](opacityInput).value

  visibleInput.addEventListener(
    "change".cstring,
    proc(event: Event) =
      layer.setVisible(cast[InputElement](visibleInput).checked),
  )

  opacityInput.addEventListener(
    "input".cstring,
    proc(event: Event) =
      let value = inputFloatValue(opacityInput, layer.getOpacity())
      layer.setOpacity(value)
      if not opacityValue.isNil:
        cast[Element](opacityValue).innerText = cast[InputElement](opacityInput).value
    ,
  )

proc bindGroupInputs(idPrefix: string, group: LayerGroup) =
  let visibleInput = dom.getElementById((idPrefix & "-visible").cstring)
  let opacityInput = dom.getElementById((idPrefix & "-opacity").cstring)
  let opacityValue = dom.getElementById((idPrefix & "-opacity-value").cstring)
  if visibleInput.isNil or opacityInput.isNil:
    return

  cast[InputElement](visibleInput).checked = group.getVisible()
  cast[InputElement](opacityInput).value =
    formatFloat(group.getOpacity(), ffDecimal, 2).cstring
  if not opacityValue.isNil:
    cast[Element](opacityValue).innerText = cast[InputElement](opacityInput).value

  visibleInput.addEventListener(
    "change".cstring,
    proc(event: Event) =
      group.setVisible(cast[InputElement](visibleInput).checked),
  )

  opacityInput.addEventListener(
    "input".cstring,
    proc(event: Event) =
      let value = inputFloatValue(opacityInput, group.getOpacity())
      group.setOpacity(value)
      if not opacityValue.isNil:
        cast[Element](opacityValue).innerText = cast[InputElement](opacityInput).value
    ,
  )

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "Layer Groups"
    tdiv(id = "map", class = "map map-with-controls")
    form(class = "example-controls"):
      label:
        text "Overlay Group "
      input(id = "group-visible", `type` = "checkbox")
      text " Visible "
      input(id = "group-opacity", `type` = "range", min = "0", max = "1", step = "0.01")
      span(id = "group-opacity-value"):
        text "1.00"
    form(class = "example-controls"):
      label:
        text "Switzerland "
      input(id = "switzerland-visible", `type` = "checkbox")
      text " Visible "
      input(
        id = "switzerland-opacity",
        `type` = "range",
        min = "0",
        max = "1",
        step = "0.01",
      )
      span(id = "switzerland-opacity-value"):
        text "1.00"
    form(class = "example-controls"):
      label:
        text "Fire Polygons "
      input(id = "fire-visible", `type` = "checkbox")
      text " Visible "
      input(id = "fire-opacity", `type` = "range", min = "0", max = "1", step = "0.01")
      span(id = "fire-opacity-value"):
        text "1.00"

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let baseLayerOptions = newTileLayerOptions()
  baseLayerOptions.source = newOSM()
  let baseLayer = newTileLayer(baseLayerOptions)

  let swissFillOptions = newFillOptions()
  swissFillOptions.color = "rgba(59, 130, 246, 0.15)".cstring
  let swissFill = newFill(swissFillOptions)

  let swissStrokeOptions = newStrokeOptions()
  swissStrokeOptions.color = "rgba(37, 99, 235, 0.9)".cstring
  swissStrokeOptions.width = 2.0
  let swissStroke = newStroke(swissStrokeOptions)

  let swissStyleOptions = newStyleOptions()
  swissStyleOptions.fill = swissFill
  swissStyleOptions.stroke = swissStroke
  let swissStyle = newStyle(swissStyleOptions)

  let swissSourceOptions = newVectorSourceOptions()
  swissSourceOptions.url =
    "/deps/openlayers/examples/data/geojson/switzerland.geojson".cstring
  swissSourceOptions.format = newGeoJSON()
  let swissSource = newVectorSource(swissSourceOptions)

  let swissLayerOptions = newVectorLayerOptions()
  swissLayerOptions.source = swissSource
  swissLayerOptions.style = cast[JsObject](swissStyle)
  swissLayerOptions.opacity = 1.0
  let switzerlandLayer = newVectorLayer(swissLayerOptions)

  let fireStrokeOptions = newStrokeOptions()
  fireStrokeOptions.color = "rgba(220, 38, 38, 0.95)".cstring
  fireStrokeOptions.width = 2.0
  let fireStroke = newStroke(fireStrokeOptions)

  let fireFillOptions = newFillOptions()
  fireFillOptions.color = "rgba(220, 38, 38, 0.08)".cstring
  let fireFill = newFill(fireFillOptions)

  let fireStyleOptions = newStyleOptions()
  fireStyleOptions.stroke = fireStroke
  fireStyleOptions.fill = fireFill
  let fireStyle = newStyle(fireStyleOptions)

  let fireSourceOptions = newVectorSourceOptions()
  fireSourceOptions.url = "/deps/openlayers/examples/data/geojson/fire.json".cstring
  fireSourceOptions.format = newGeoJSON()
  let fireSource = newVectorSource(fireSourceOptions)

  let fireLayerOptions = newVectorLayerOptions()
  fireLayerOptions.source = fireSource
  fireLayerOptions.style = cast[JsObject](fireStyle)
  fireLayerOptions.opacity = 0.9
  let fireLayer = newVectorLayer(fireLayerOptions)

  let overlayGroupOptions = newLayerGroupOptions()
  overlayGroupOptions.layers = @[switzerlandLayer, fireLayer]
  overlayGroupOptions.opacity = 1.0
  let overlayGroup = newLayerGroup(overlayGroupOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = fromLonLat(@[8.2275, 46.8182])
  viewOptions.zoom = 6.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer, overlayGroup]
  mapOptions.target = olExampleHelpers.getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  bindGroupInputs("group", overlayGroup)
  bindBaseLayerInputs("switzerland", cast[BaseLayer](switzerlandLayer))
  bindBaseLayerInputs("fire", cast[BaseLayer](fireLayer))

  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
