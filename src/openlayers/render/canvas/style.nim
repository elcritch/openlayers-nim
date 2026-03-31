import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_style from 'ol/render/canvas/style.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_style)".}

proc rulesToStyleFunction*(rules: JsObject): JsObject {.importjs: "olNs_render_canvas_style.rulesToStyleFunction(#)".}
proc flatStylesToStyleFunction*(flatStyles: JsObject): JsObject {.importjs: "olNs_render_canvas_style.flatStylesToStyleFunction(#)".}
proc buildRuleSet*(rules: JsObject, context: JsObject): JsObject {.importjs: "olNs_render_canvas_style.buildRuleSet(#, #)".}
proc buildStyle*(flatStyle: JsObject, context: JsObject): JsObject {.importjs: "olNs_render_canvas_style.buildStyle(#, #)".}
