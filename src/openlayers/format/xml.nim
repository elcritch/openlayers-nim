import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_XML from 'ol/format/XML.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_XML)".}

type XML* = ref object of JsRoot
proc newXML*(): XML {.importjs: "(new olNs_format_XML.default())".}
proc read*(self: XML, source: JsObject): JsObject {.importjs: "#.read(#)".}
proc readFromDocument*(
  self: XML, doc: JsObject
): JsObject {.importjs: "#.readFromDocument(#)".}

proc readFromNode*(
  self: XML, node: JsObject
): JsObject {.importjs: "#.readFromNode(#)".}
