import jsffi
import openlayers/events/condition as conditionNs
import openlayers/map as mapNs
import openlayers/source/vector as vectorSourceNs

discard mapNs.getNamespace()
discard vectorSourceNs.getNamespace()
discard conditionNs.getNamespace()

proc newMapWithOptions*(
  options: JsObject
): JsObject {.importjs: "(new olNs_Map.default(#))".}

proc newVectorSourceWithOptions*(
  options: JsObject
): JsObject {.importjs: "(new olNs_source_Vector.default(#))".}

proc getElementById*(id: cstring): JsObject {.importjs: "document.getElementById(#)".}
proc isTruthy*(value: JsObject): bool {.importjs: "Boolean(#)".}
proc detachMap*(
  mapObj: JsObject
) {.importjs: "(function(m){ if (m && m.setTarget) { m.setTarget(null); } })(#)".}

proc jsArray1*(a: JsObject): JsObject {.importjs: "[#]".}
proc jsArray2*(a: float, b: float): JsObject {.importjs: "[#, #]".}

proc addInteraction*(
  mapObj: JsObject, interaction: JsObject
) {.importjs: "#.addInteraction(#)".}

proc removeInteraction*(
  mapObj: JsObject, interaction: JsObject
) {.importjs: "#.removeInteraction(#)".}

proc makeColorStyleFn*(
  styleForSet: JsObject, styleForReturn: JsObject
): JsObject {.
  importjs:
    "(function(feature){ const color = feature.get('COLOR') || 'rgb(238, 238, 238)'; #.getFill().setColor(color); return #; })"
.}

proc makeAltClickConditionFn*(
  clickFn: JsObject, altKeyOnlyFn: JsObject
): JsObject {.
  importjs:
    "(function(mapBrowserEvent){ return #(mapBrowserEvent) && #(mapBrowserEvent); })"
.}

proc getClickConditionFn*(): JsObject {.importjs: "(olNs_events_condition.click)".}

proc getPointerMoveConditionFn*(): JsObject {.
  importjs: "(olNs_events_condition.pointerMove)"
.}

proc getNeverConditionFn*(): JsObject {.importjs: "(olNs_events_condition.never)".}

proc getAltKeyOnlyConditionFn*(): JsObject {.
  importjs: "(olNs_events_condition.altKeyOnly)"
.}

proc installSelectHoverStatus*(
  selectInteraction: JsObject
) {.
  importjs:
    "(function(){ const status = document.getElementById('status'); #.on('select', function(e){ if (e.selected.length > 0) { status.innerHTML = e.selected[0].get('ECO_NAME'); } else { status.innerHTML = '&nbsp;'; } }); })()"
.}

proc installSelectTypeController*(
  mapObj: JsObject,
  selectSingleClick: JsObject,
  selectClick: JsObject,
  selectPointerMove: JsObject,
  selectAltClick: JsObject,
) {.
  importjs:
    "(function(){ const map = #; const singleClick = #; const click = #; const pointerMove = #; const altClick = #; const selectElement = document.getElementById('type'); const status = document.getElementById('status'); let activeSelect = null; const changeInteraction = function(){ if (activeSelect !== null) { map.removeInteraction(activeSelect); } const value = selectElement.value; if (value === 'singleclick') { activeSelect = singleClick; } else if (value === 'click') { activeSelect = click; } else if (value === 'pointermove') { activeSelect = pointerMove; } else if (value === 'altclick') { activeSelect = altClick; } else { activeSelect = null; } if (activeSelect !== null) { map.addInteraction(activeSelect); activeSelect.on('select', function(e){ status.innerHTML = '&nbsp;' + e.target.getFeatures().getLength() + ' selected features (last operation selected ' + e.selected.length + ' and deselected ' + e.deselected.length + ' features)'; }); } else { status.innerHTML = '&nbsp;0 selected features'; } }; selectElement.onchange = changeInteraction; changeInteraction(); })()"
.}

proc installOpacitySlider*(
  layerForOpacity: JsObject
) {.
  importjs:
    "(function(){ const opacityInput = document.getElementById('opacity-input'); const opacityOutput = document.getElementById('opacity-output'); function update(){ const opacity = parseFloat(opacityInput.value); #.setOpacity(opacity); opacityOutput.innerText = opacity.toFixed(2); } opacityInput.addEventListener('input', update); update(); })()"
.}

proc extendCollection*(
  collection: JsObject, items: JsObject
): JsObject {.importjs: "#.extend(#)".}

proc installAttributionResizeBehavior*(
  mapForSize: JsObject,
  attributionForCollapsible: JsObject,
  attributionForCollapsed: JsObject,
  mapForOn: JsObject,
) {.
  importjs:
    "(function(){ const checkSize = function(){ const small = #.getSize()[0] < 600; #.setCollapsible(small); #.setCollapsed(small); }; #.on('change:size', checkSize); checkSize(); })()"
.}

proc installCenterControls*(
  mapObj: JsObject, viewObj: JsObject, sourceObj: JsObject
) {.
  importjs:
    "(function(){ const map = #; const view = #; const source = #; const zoomToSwitzerland = document.getElementById('zoomtoswitzerland'); const zoomToLausanne = document.getElementById('zoomtolausanne'); const centerLausanne = document.getElementById('centerlausanne'); zoomToSwitzerland.addEventListener('click', function(){ const feature = source.getFeatures()[0]; const polygon = feature.getGeometry(); view.fit(polygon, {padding: [170, 50, 30, 150]}); }, false); zoomToLausanne.addEventListener('click', function(){ const feature = source.getFeatures()[1]; const point = feature.getGeometry(); view.fit(point, {padding: [170, 50, 30, 150], minResolution: 50}); }, false); centerLausanne.addEventListener('click', function(){ const feature = source.getFeatures()[1]; const point = feature.getGeometry(); const size = map.getSize(); view.centerOn(point.getCoordinates(), size, [570, 500]); }, false); })()"
.}
