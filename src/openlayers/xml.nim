import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_xml from 'ol/xml.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_xml)".}

proc createElementNS*(
  namespaceURI: cstring, qualifiedName: cstring
): JsObject {.importjs: "olNs_xml.createElementNS(#, #)".}

proc getAllTextContent*(
  node: JsObject, normalizeWhitespace: bool
): cstring {.importjs: "olNs_xml.getAllTextContent(#, #)".}

proc getAllTextContent2*(
  node: JsObject, normalizeWhitespace: bool, accumulator: seq[cstring]
): seq[cstring] {.importjs: "olNs_xml.getAllTextContent_(#, #, #)".}

proc isDocument*(objectVal: JsObject): bool {.importjs: "olNs_xml.isDocument(#)".}
proc getAttributeNS*(
  node: JsObject, namespaceURI: cstring, name: cstring
): cstring {.importjs: "olNs_xml.getAttributeNS(#, #, #)".}

proc parse*(xml: cstring): JsObject {.importjs: "olNs_xml.parse(#)".}
proc makeArrayExtender*(
  valueReader: JsObject, thisArg: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeArrayExtender(#, #)".}

proc makeArrayPusher*(
  valueReader: JsObject, thisArg: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeArrayPusher(#, #)".}

proc makeReplacer*(
  valueReader: JsObject, thisArg: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeReplacer(#, #)".}

proc makeObjectPropertyPusher*(
  valueReader: JsObject,
  property: JsObject = jsUndefined,
  thisArg: JsObject = jsUndefined,
): JsObject {.importjs: "olNs_xml.makeObjectPropertyPusher(#, #, #)".}

proc makeObjectPropertySetter*(
  valueReader: JsObject,
  property: JsObject = jsUndefined,
  thisArg: JsObject = jsUndefined,
): JsObject {.importjs: "olNs_xml.makeObjectPropertySetter(#, #, #)".}

proc makeChildAppender*(
  nodeWriter: JsObject, thisArg: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeChildAppender(#, #)".}

proc makeArraySerializer*(
  nodeWriter: JsObject, thisArg: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeArraySerializer(#, #)".}

proc makeSimpleNodeFactory*(
  fixedNodeName: JsObject = jsUndefined, fixedNamespaceURI: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeSimpleNodeFactory(#, #)".}

proc makeSequence*(
  objectVal: JsObject, orderedKeys: seq[cstring]
): JsObject {.importjs: "olNs_xml.makeSequence(#, #)".}

proc makeStructureNS*(
  namespaceURIs: seq[cstring], structure: JsObject, structureNS: JsObject = jsUndefined
): JsObject {.importjs: "olNs_xml.makeStructureNS(#, #, #)".}

proc parseNode*(
  parsersNS: JsObject,
  node: JsObject,
  objectStack: JsObject,
  thisArg: JsObject = jsUndefined,
) {.importjs: "olNs_xml.parseNode(#, #, #, #)".}

proc pushParseAndPop*(
  objectVal: JsObject,
  parsersNS: JsObject,
  node: JsObject,
  objectStack: JsObject,
  thisArg: JsObject = jsUndefined,
): JsObject {.importjs: "olNs_xml.pushParseAndPop(#, #, #, #, #)".}

proc serialize*(
  serializersNS: JsObject,
  nodeFactory: JsObject,
  values: JsObject,
  objectStack: JsObject,
  keys: JsObject = jsUndefined,
  thisArg: JsObject = jsUndefined,
) {.importjs: "olNs_xml.serialize(#, #, #, #, #, #)".}

proc pushSerializeAndPop*(
  objectVal: JsObject,
  serializersNS: JsObject,
  nodeFactory: JsObject,
  values: JsObject,
  objectStack: JsObject,
  keys: JsObject = jsUndefined,
  thisArg: JsObject = jsUndefined,
): JsObject {.importjs: "olNs_xml.pushSerializeAndPop(#, #, #, #, #, #, #)".}

proc registerXMLSerializer*(
  xmlSerializer: JsObject
) {.importjs: "olNs_xml.registerXMLSerializer(#)".}

proc getXMLSerializer*(): JsObject {.importjs: "olNs_xml.getXMLSerializer()".}
proc registerDocument*(document: JsObject) {.importjs: "olNs_xml.registerDocument(#)".}
proc getDocument*(): JsObject {.importjs: "olNs_xml.getDocument()".}

proc getXML_SCHEMA_INSTANCE_URI*(): cstring {.
  importjs: "(olNs_xml.XML_SCHEMA_INSTANCE_URI)"
.}

proc getOBJECT_PROPERTY_NODE_FACTORY*(): JsObject {.
  importjs: "(olNs_xml.OBJECT_PROPERTY_NODE_FACTORY)"
.}
