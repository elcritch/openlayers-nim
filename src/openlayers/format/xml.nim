import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_XML from 'ol/format/XML.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_XML)".}

type
  OlXML* = ref object of JsRoot
proc newOlXML*(): OlXML {.importjs: "(new olNs_format_XML.default())".}
proc read*(self: OlXML, source: JsObject): JsObject {.importjs: "#.read(#)".}
proc readFromDocument*(self: OlXML, doc: JsObject): JsObject {.importjs: "#.readFromDocument(#)".}
proc readFromNode*(self: OlXML, node: JsObject): JsObject {.importjs: "#.readFromNode(#)".}
