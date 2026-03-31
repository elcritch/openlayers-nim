import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_GPX from 'ol/format/GPX.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_GPX)".}

type
  OlGPX* = ref object of JsRoot
proc newOlGPX*(options: JsObject = jsUndefined): OlGPX {.importjs: "(new olNs_format_GPX.default(#))".}
proc readMetadata*(self: OlGPX, source: JsObject): JsObject {.importjs: "#.readMetadata(#)".}
proc readMetadataFromDocument*(self: OlGPX, doc: JsObject): JsObject {.importjs: "#.readMetadataFromDocument(#)".}
proc readMetadataFromNode*(self: OlGPX, node: JsObject): JsObject {.importjs: "#.readMetadataFromNode(#)".}
