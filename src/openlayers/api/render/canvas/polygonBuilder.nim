import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_render_canvas_PolygonBuilder from 'ol/render/canvas/PolygonBuilder.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_render_canvas_PolygonBuilder)".}

type
  OlCanvasPolygonBuilder* = ref object of JsRoot
proc newOlCanvasPolygonBuilder*(): OlCanvasPolygonBuilder {.importjs: "(new olNs_render_canvas_PolygonBuilder.default())".}
proc handleStrokeOffset*(self: OlCanvasPolygonBuilder, drawGeometryCallback: JsObject): bool {.importjs: "#.handleStrokeOffset_(#)".}
