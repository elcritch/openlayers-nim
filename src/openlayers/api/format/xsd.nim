import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_xsd from 'ol/format/xsd.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_xsd)".}

proc readBoolean*(node: JsObject): bool {.importjs: "olNs_format_xsd.readBoolean(#)".}
proc readBooleanString*(string: cstring): bool {.importjs: "olNs_format_xsd.readBooleanString(#)".}
proc readDateTime*(node: JsObject): float {.importjs: "olNs_format_xsd.readDateTime(#)".}
proc readDecimal*(node: JsObject): float {.importjs: "olNs_format_xsd.readDecimal(#)".}
proc readDecimalString*(string: cstring): float {.importjs: "olNs_format_xsd.readDecimalString(#)".}
proc readPositiveInteger*(node: JsObject): float {.importjs: "olNs_format_xsd.readPositiveInteger(#)".}
proc readNonNegativeIntegerString*(string: cstring): float {.importjs: "olNs_format_xsd.readNonNegativeIntegerString(#)".}
proc readString*(node: JsObject): cstring {.importjs: "olNs_format_xsd.readString(#)".}
proc writeBooleanTextNode*(node: JsObject, bool: bool) {.importjs: "olNs_format_xsd.writeBooleanTextNode(#, #)".}
proc writeCDATASection*(node: JsObject, string: cstring) {.importjs: "olNs_format_xsd.writeCDATASection(#, #)".}
proc writeDateTimeTextNode*(node: JsObject, dateTime: float) {.importjs: "olNs_format_xsd.writeDateTimeTextNode(#, #)".}
proc writeDecimalTextNode*(node: JsObject, decimal: float) {.importjs: "olNs_format_xsd.writeDecimalTextNode(#, #)".}
proc writeNonNegativeIntegerTextNode*(node: JsObject, nonNegativeInteger: float) {.importjs: "olNs_format_xsd.writeNonNegativeIntegerTextNode(#, #)".}
proc writeStringTextNode*(node: JsObject, string: cstring) {.importjs: "olNs_format_xsd.writeStringTextNode(#, #)".}
