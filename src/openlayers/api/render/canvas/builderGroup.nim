import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_BuilderGroup from 'ol/render/canvas/BuilderGroup.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_BuilderGroup)".}

type
  OlBuilderGroup* = ref object of JsRoot
proc newOlBuilderGroup*(tolerance: float, maxExtent: JsObject, resolution: float, pixelRatio: float): OlBuilderGroup {.importjs: "(new olNs_render_canvas_BuilderGroup.default(#, #, #, #))".}
proc finish*(self: OlBuilderGroup): JsObject {.importjs: "#.finish()".}
proc getBuilder*(self: OlBuilderGroup, zIndex: float, builderType: JsObject): JsObject {.importjs: "#.getBuilder(#, #)".}
