import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_net from 'ol/net.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_net)".}

proc jsonp*(url: cstring, callback: JsObject, errback: JsObject = jsUndefined, callbackParam: JsObject = jsUndefined) {.importjs: "olNs_net.jsonp(#, #, #, #)".}
proc getJSON*(url: cstring): JsObject {.importjs: "olNs_net.getJSON(#)".}
proc resolveUrl*(base: cstring, url: cstring): cstring {.importjs: "olNs_net.resolveUrl(#, #)".}
proc overrideXHR*(xhr: JsObject) {.importjs: "olNs_net.overrideXHR(#)".}
proc restoreXHR*() {.importjs: "olNs_net.restoreXHR()".}
