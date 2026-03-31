import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olObjectModule from 'ol/Object.js';".}
when defined(esmModules):
  {.emit: "import BaseObject from 'ol/Object.js';".}

type OlBaseObject* = ref object of JsRoot

proc newOlBaseObject*(): OlBaseObject {.importjs: "(new BaseObject())".}
