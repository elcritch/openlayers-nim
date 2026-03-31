import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

{.emit: "import View from 'ol/View.js';".}

proc openLayersLoaded*(): bool {.importjs: "(typeof View === 'function')".}

type OlView* = ref object of JsRoot

proc newOlView*(options: JsObject = jsUndefined): OlView {.importjs: "(new View(#))".}

proc getCenter*(view: OlView): seq[float] {.importjs: "#.getCenter()".}
proc setCenter*(view: OlView, center: seq[float]) {.importjs: "#.setCenter(#)".}
proc getZoom*(view: OlView): float {.importjs: "#.getZoom()".}
proc setZoom*(view: OlView, zoom: float) {.importjs: "#.setZoom(#)".}
