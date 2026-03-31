import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_interaction from 'ol/interaction.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction)".}

proc getDoubleClickZoom*(): JsObject {.importjs: "(olNs_interaction.DoubleClickZoom)".}
proc getDblClickDragZoom*(): JsObject {.
  importjs: "(olNs_interaction.DblClickDragZoom)"
.}

proc getDragAndDrop*(): JsObject {.importjs: "(olNs_interaction.DragAndDrop)".}
proc getDragBox*(): JsObject {.importjs: "(olNs_interaction.DragBox)".}
proc getDragPan*(): JsObject {.importjs: "(olNs_interaction.DragPan)".}
proc getDragRotate*(): JsObject {.importjs: "(olNs_interaction.DragRotate)".}
proc getDragRotateAndZoom*(): JsObject {.
  importjs: "(olNs_interaction.DragRotateAndZoom)"
.}

proc getDragZoom*(): JsObject {.importjs: "(olNs_interaction.DragZoom)".}
proc getDraw*(): JsObject {.importjs: "(olNs_interaction.Draw)".}
proc getExtent*(): JsObject {.importjs: "(olNs_interaction.Extent)".}
proc getInteraction*(): JsObject {.importjs: "(olNs_interaction.Interaction)".}
proc getKeyboardPan*(): JsObject {.importjs: "(olNs_interaction.KeyboardPan)".}
proc getKeyboardZoom*(): JsObject {.importjs: "(olNs_interaction.KeyboardZoom)".}
proc getLink*(): JsObject {.importjs: "(olNs_interaction.Link)".}
proc getModify*(): JsObject {.importjs: "(olNs_interaction.Modify)".}
proc getMouseWheelZoom*(): JsObject {.importjs: "(olNs_interaction.MouseWheelZoom)".}
proc getPinchRotate*(): JsObject {.importjs: "(olNs_interaction.PinchRotate)".}
proc getPinchZoom*(): JsObject {.importjs: "(olNs_interaction.PinchZoom)".}
proc getPointer*(): JsObject {.importjs: "(olNs_interaction.Pointer)".}
proc getSelect*(): JsObject {.importjs: "(olNs_interaction.Select)".}
proc getSnap*(): JsObject {.importjs: "(olNs_interaction.Snap)".}
proc getTranslate*(): JsObject {.importjs: "(olNs_interaction.Translate)".}
proc getDefaults*(): JsObject {.importjs: "(olNs_interaction.defaults)".}
