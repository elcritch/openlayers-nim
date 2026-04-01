import jsffi
import std/[strutils, parseutils]
import dom
import openlayers/collection
import openlayers/control/attribution
import openlayers/events/condition as conditionNs
import openlayers/feature
import openlayers/geom/simpleGeometry
import openlayers/interaction/select
import openlayers/layer/heatmap
import openlayers/layer/webGLTile
import openlayers/map
import openlayers/source/vector
import openlayers/style/fill
import openlayers/style/style as olStyle
import openlayers/view

type
  StyleFunction* = proc(featureObj: JsObject): JsObject {.closure.}
  ConditionFunction* = proc(mapBrowserEvent: JsObject): bool {.closure.}
  HeatWeightFunction* = proc(featureObj: JsObject): float {.closure.}

proc newMapWithOptions*(options: JsObject): JsObject =
  cast[JsObject](newMap(cast[MapOptions](options)))

proc newVectorSourceWithOptions*(options: JsObject): JsObject =
  cast[JsObject](newVectorSource(cast[VectorSourceOptions](options)))

proc getElementById*(id: cstring): JsObject =
  cast[JsObject](dom.getElementById(id))

proc isTruthy*(value: JsObject): bool =
  value != nil and value != jsUndefined

proc detachMap*(mapObj: JsObject) =
  if isTruthy(mapObj):
    cast[Map](mapObj).setTarget(jsNull)

proc jsArray1*(a: JsObject): JsObject =
  cast[JsObject](@[a])

proc jsArray2*(a: float, b: float): JsObject =
  cast[JsObject](@[a, b])

proc addInteraction*(mapObj: JsObject, interaction: JsObject) =
  cast[Map](mapObj).addInteraction(interaction)

proc removeInteraction*(mapObj: JsObject, interaction: JsObject) =
  cast[Map](mapObj).removeInteraction(interaction)

proc featureString(featureObj: JsObject, key: cstring): string =
  let value = cast[Feature](featureObj).get(key)
  if value == nil or value == jsUndefined:
    return ""
  result = $cast[cstring](value)
  if result == "undefined" or result == "null":
    result = ""

proc makeColorStyleFn*(styleForSet: JsObject, styleForReturn: JsObject): StyleFunction =
  let styleToSet = cast[olStyle.Style](styleForSet)
  let styleToReturn = cast[olStyle.Style](styleForReturn)
  result = proc(featureObj: JsObject): JsObject =
    let color = featureString(featureObj, "COLOR".cstring)
    let fillObj = styleToSet.getFill()
    if fillObj != nil and fillObj != jsUndefined:
      let fillStyle = cast[Fill](fillObj)
      if color.len > 0:
        fillStyle.setColor(color.cstring)
      else:
        fillStyle.setColor("rgb(238, 238, 238)".cstring)
    cast[JsObject](styleToReturn)

proc makeAltClickConditionFn*(
    clickFn: JsObject, altKeyOnlyFn: JsObject
): ConditionFunction =
  discard clickFn
  discard altKeyOnlyFn
  result = proc(mapBrowserEvent: JsObject): bool =
    conditionNs.click(mapBrowserEvent) and conditionNs.altKeyOnly(mapBrowserEvent)

proc getClickConditionFn*(): JsObject =
  conditionNs.getClick()

proc getPointerMoveConditionFn*(): JsObject =
  conditionNs.getPointerMove()

proc getNeverConditionFn*(): JsObject =
  conditionNs.getNever()

proc getAltKeyOnlyConditionFn*(): JsObject =
  conditionNs.getAltKeyOnly()

proc installSelectHoverStatus*(selectInteraction: JsObject) =
  let statusEl = dom.getElementById("status".cstring)
  if statusEl.isNil:
    return

  let selectObj = cast[Select](selectInteraction)
  discard selectObj.on(
    "select".cstring,
    proc(event: SelectEvent) =
      let selectedFeatures = selected(event)
      if selectedFeatures.len > 0:
        let ecoName = featureString(selectedFeatures[0], "ECO_NAME".cstring)
        if ecoName.len > 0:
          statusEl.innerHTML = ecoName.cstring
        else:
          statusEl.innerHTML = "\u00A0".cstring
      else:
        statusEl.innerHTML = "\u00A0".cstring,
  )

proc installSelectTypeController*(
    mapObj: JsObject,
    selectSingleClick: JsObject,
    selectClick: JsObject,
    selectPointerMove: JsObject,
    selectAltClick: JsObject,
) =
  let selectElement = dom.getElementById("type".cstring)
  let statusEl = dom.getElementById("status".cstring)
  if selectElement.isNil or statusEl.isNil:
    return

  let mapVal = cast[Map](mapObj)
  let singleClick = cast[Select](selectSingleClick)
  let click = cast[Select](selectClick)
  let pointerMove = cast[Select](selectPointerMove)
  let altClick = cast[Select](selectAltClick)
  var activeSelect: Select = nil

  proc onInteractionSelect(event: SelectEvent) =
    let selectedCollection = cast[Collection](event.targetSelect().getFeatures())
    let totalSelected = selectedCollection.getLength().int
    let selectedCount = selected(event).len
    let deselectedCount = deselected(event).len
    statusEl.innerHTML = cstring(
      "\u00A0" & $totalSelected & " selected features (last operation selected " &
        $selectedCount & " and deselected " & $deselectedCount & " features)"
    )

  proc changeInteraction() =
    if activeSelect != nil:
      mapVal.removeInteraction(activeSelect)

    let selectedMode = cast[InputElement](selectElement).value
    case $selectedMode
    of "singleclick":
      activeSelect = singleClick
    of "click":
      activeSelect = click
    of "pointermove":
      activeSelect = pointerMove
    of "altclick":
      activeSelect = altClick
    else:
      activeSelect = nil

    if activeSelect != nil:
      mapVal.addInteraction(activeSelect)
      discard activeSelect.on("select".cstring, onInteractionSelect)
    else:
      statusEl.innerHTML = "\u00A00 selected features".cstring

  proc onTypeChange(event: Event) =
    changeInteraction()

  selectElement.onchange = onTypeChange
  changeInteraction()

proc installOpacitySlider*(layerForOpacity: JsObject) =
  let opacityInput = dom.getElementById("opacity-input".cstring)
  let opacityOutput = dom.getElementById("opacity-output".cstring)
  if opacityInput.isNil or opacityOutput.isNil:
    return

  let layer = cast[WebGLTileLayer](layerForOpacity)

  proc updateOpacity() =
    let raw = $cast[InputElement](opacityInput).value
    var opacity = 1.0
    try:
      opacity = parseFloat(raw)
    except ValueError:
      opacity = 1.0
    layer.setOpacity(opacity)
    opacityOutput.innerText = formatFloat(opacity, ffDecimal, 2).cstring

  proc onInput(event: Event) =
    updateOpacity()

  opacityInput.addEventListener("input".cstring, onInput)
  updateOpacity()

proc extendCollection*(collection: JsObject, items: JsObject): JsObject =
  cast[JsObject](cast[Collection](collection).extend(items))

proc installAttributionResizeBehavior*(
    mapForSize: JsObject,
    attributionForCollapsible: JsObject,
    attributionForCollapsed: JsObject,
    mapForOn: JsObject,
) =
  let mapSize = cast[Map](mapForSize)
  let collapsible = cast[Attribution](attributionForCollapsible)
  let collapsed = cast[Attribution](attributionForCollapsed)
  let mapOn = cast[Map](mapForOn)

  proc checkSize() =
    let mapSizeValue = mapSize.getSize()
    let small = mapSizeValue.len > 0 and mapSizeValue[0] < 600.0
    collapsible.setCollapsible(small)
    collapsed.setCollapsed(small)

  discard mapOn.on(
    "change:size".cstring,
    proc(event: JsObject) =
      checkSize(),
  )
  checkSize()

proc installCenterControls*(mapObj: JsObject, viewObj: JsObject, sourceObj: JsObject) =
  let zoomToSwitzerland = dom.getElementById("zoomtoswitzerland".cstring)
  let zoomToLausanne = dom.getElementById("zoomtolausanne".cstring)
  let centerLausanne = dom.getElementById("centerlausanne".cstring)
  if zoomToSwitzerland.isNil or zoomToLausanne.isNil or centerLausanne.isNil:
    return

  let mapVal = cast[Map](mapObj)
  let viewVal = cast[View](viewObj)
  let sourceVal = cast[VectorSource](sourceObj)

  proc withFeature(index: int, cb: proc(feature: Feature)) =
    let features = sourceVal.getFeatures()
    if index >= 0 and index < features.len:
      cb(cast[Feature](features[index]))

  proc onZoomSwitzerland(event: Event) =
    withFeature(
      0,
      proc(feature: Feature) =
        let fitOptions = newFitOptions()
        fitOptions.padding = @[170.0, 50.0, 30.0, 150.0]
        viewVal.fit(feature.getGeometry(), fitOptions),
    )

  proc onZoomLausanne(event: Event) =
    withFeature(
      1,
      proc(feature: Feature) =
        let fitOptions = newFitOptions()
        fitOptions.padding = @[170.0, 50.0, 30.0, 150.0]
        fitOptions.minResolution = 50.0
        viewVal.fit(feature.getGeometry(), fitOptions),
    )

  proc onCenterLausanne(event: Event) =
    withFeature(
      1,
      proc(feature: Feature) =
        let point = cast[SimpleGeometry](feature.getGeometry())
        viewVal.centerOn(point.getCoordinates(), mapVal.getSize(), @[570.0, 500.0]),
    )

  zoomToSwitzerland.addEventListener("click".cstring, onZoomSwitzerland, false)
  zoomToLausanne.addEventListener("click".cstring, onZoomLausanne, false)
  centerLausanne.addEventListener("click".cstring, onCenterLausanne, false)

proc makeEarthquakesHeatWeightFn*(): HeatWeightFunction =
  result = proc(featureObj: JsObject): float =
    let name = featureString(featureObj, "name".cstring)
    if name.len < 3:
      return 0.0
    let magnitudeText = name[2 .. ^1]
    var magnitude = 0.0
    if parseutils.parseFloat(magnitudeText, magnitude) <= 0:
      return 0.0
    magnitude - 5.0

proc installHeatmapControls*(heatmapLayerObj: JsObject) =
  let blurInput = dom.getElementById("blur".cstring)
  let radiusInput = dom.getElementById("radius".cstring)
  if blurInput.isNil or radiusInput.isNil:
    return

  let heatmapLayer = cast[Heatmap](heatmapLayerObj)

  proc inputIntValue(el: Element, fallback: int): int =
    let raw = $cast[InputElement](el).value
    var parsed = 0
    if parseutils.parseInt(raw, parsed) > 0:
      return parsed
    fallback

  proc updateBlur() =
    heatmapLayer.setBlur(float(inputIntValue(blurInput, 15)))

  proc updateRadius() =
    heatmapLayer.setRadius(float(inputIntValue(radiusInput, 5)))

  proc onBlurInput(event: Event) =
    updateBlur()

  proc onRadiusInput(event: Event) =
    updateRadius()

  blurInput.addEventListener("input".cstring, onBlurInput)
  radiusInput.addEventListener("input".cstring, onRadiusInput)
  updateBlur()
  updateRadius()
