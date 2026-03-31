import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_format_filter_ResourceId from 'ol/format/filter/ResourceId.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_format_filter_ResourceId)".}

type
  OlResourceId* = ref object of JsRoot
proc newOlResourceId*(): OlResourceId {.importjs: "(new olNs_format_filter_ResourceId.default())".}
