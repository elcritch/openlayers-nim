when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as proj from 'ol/proj.js';".}

proc fromLonLat*(coordinate: seq[float]): seq[float] {.importjs: "proj.fromLonLat(#)".}

proc fromLonLat*(
  coordinate: seq[float], projection: cstring
): seq[float] {.importjs: "proj.fromLonLat(#, #)".}

proc toLonLat*(coordinate: seq[float]): seq[float] {.importjs: "proj.toLonLat(#)".}

proc toLonLat*(
  coordinate: seq[float], projection: cstring
): seq[float] {.importjs: "proj.toLonLat(#, #)".}
