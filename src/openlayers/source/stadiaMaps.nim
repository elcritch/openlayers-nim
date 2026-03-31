import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_source_StadiaMaps from 'ol/source/StadiaMaps.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_source_StadiaMaps)".}

type
  OlStadiaMaps* = ref object of JsRoot
proc newOlStadiaMaps*(options: JsObject): OlStadiaMaps {.importjs: "(new olNs_source_StadiaMaps.default(#))".}
