## Shared public layer methods for the concrete tile, vector and image wrappers.
import ./[tile, vector, image]
import ../render/event
import ../source/[vector, image]

import std/jsffi

type ConcreteLayer* = TileLayer | VectorLayer | ImageLayer

proc setVisible*(layer: ConcreteLayer, visible: bool) {.importjs: "#.setVisible(#)".}
proc setOpacity*(layer: ConcreteLayer, opacity: float) {.importjs: "#.setOpacity(#)".}
proc changed*(layer: ConcreteLayer) {.importjs: "#.changed()".}
proc setExtent*(layer: ConcreteLayer, bounds: seq[float]) {.importjs: "#.setExtent(#)".}
proc clearExtent*(layer: ConcreteLayer) {.importjs: "#.setExtent(undefined)".}
proc getSource*(layer: ImageLayer): ImageSource {.importjs: "#.getSource()".}
proc getSource*(layer: VectorLayer): VectorSource {.importjs: "#.getSource()".}
proc setSource*(layer: ImageLayer, source: ImageSource) {.importjs: "#.setSource(#)".}
proc on*(
  layer: ConcreteLayer, event: cstring, listener: proc(event: RenderEvent)
): JsObject {.importjs: "#.on(#, #)".}
