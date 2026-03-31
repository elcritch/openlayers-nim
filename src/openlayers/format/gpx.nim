import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GPX from 'ol/format/GPX.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GPX)".}

type
  GPX* = ref object of JsRoot
proc newGPX*(options: JsObject = jsUndefined): GPX {.importjs: "(new olNs_format_GPX.default(#))".}
proc readMetadata*(self: GPX, source: JsObject): JsObject {.importjs: "#.readMetadata(#)".}
proc readMetadataFromDocument*(self: GPX, doc: JsObject): JsObject {.importjs: "#.readMetadataFromDocument(#)".}
proc readMetadataFromNode*(self: GPX, node: JsObject): JsObject {.importjs: "#.readMetadataFromNode(#)".}
