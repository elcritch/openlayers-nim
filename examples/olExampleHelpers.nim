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

proc jsArray2*(a: float, b: float): JsObject {.importjs: "[#, #]".}
proc jsArray1*(a: JsObject): JsObject {.importjs: "[#]".}

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
