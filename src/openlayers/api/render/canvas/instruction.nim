import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_Instruction from 'ol/render/canvas/Instruction.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_Instruction)".}

proc getFillInstruction*(): JsObject {.importjs: "(olNs_render_canvas_Instruction.fillInstruction)".}
proc getStrokeInstruction*(): JsObject {.importjs: "(olNs_render_canvas_Instruction.strokeInstruction)".}
proc getBeginPathInstruction*(): JsObject {.importjs: "(olNs_render_canvas_Instruction.beginPathInstruction)".}
proc getClosePathInstruction*(): JsObject {.importjs: "(olNs_render_canvas_Instruction.closePathInstruction)".}
