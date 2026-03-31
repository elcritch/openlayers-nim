import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_OSMXML from 'ol/format/OSMXML.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_OSMXML)".}

type OSMXML* = ref object of JsRoot
proc newOSMXML*(): OSMXML {.importjs: "(new olNs_format_OSMXML.default())".}
