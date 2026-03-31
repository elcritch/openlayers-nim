import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_has from 'ol/has.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_has)".}

proc getSAFARI*(): bool {.importjs: "(olNs_has.SAFARI)".}
proc getSAFARI_BUG_237906*(): bool {.importjs: "(olNs_has.SAFARI_BUG_237906)".}
proc getWEBKIT*(): bool {.importjs: "(olNs_has.WEBKIT)".}
proc getMAC*(): bool {.importjs: "(olNs_has.MAC)".}
proc getDEVICE_PIXEL_RATIO*(): float {.importjs: "(olNs_has.DEVICE_PIXEL_RATIO)".}
proc getWORKER_OFFSCREEN_CANVAS*(): bool {.
  importjs: "(olNs_has.WORKER_OFFSCREEN_CANVAS)"
.}

proc getIMAGE_DECODE*(): bool {.importjs: "(olNs_has.IMAGE_DECODE)".}
proc getCREATE_IMAGE_BITMAP*(): bool {.importjs: "(olNs_has.CREATE_IMAGE_BITMAP)".}
proc getPASSIVE_EVENT_LISTENERS*(): bool {.
  importjs: "(olNs_has.PASSIVE_EVENT_LISTENERS)"
.}
