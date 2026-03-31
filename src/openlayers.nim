import std/[os, strutils]
import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

const olModuleDir = block:
  let srcDir = currentSourcePath().parentDir
  srcDir.parentDir / "deps" / "openlayers" / "src" / "ol"

const olModuleBase = block:
  let normalized = olModuleDir.replace("\\", "/")
  when defined(windows):
    "file:///" & normalized
  else:
    "file://" & normalized

const
  viewImportPath = olModuleBase & "/View.js"
  tileLayerImportPath = olModuleBase & "/layer/Tile.js"
  osmImportPath = olModuleBase & "/source/OSM.js"
  projImportPath = olModuleBase & "/proj.js"

{.emit: "import View from '" & viewImportPath & "';".}
{.emit: "import TileLayer from '" & tileLayerImportPath & "';".}
{.emit: "import OSM from '" & osmImportPath & "';".}
{.emit: "import {fromLonLat, toLonLat} from '" & projImportPath & "';".}

type
  OlView* {.importc: "View".} = ref object of JsRoot
  OlTileLayer* {.importc: "TileLayer".} = ref object of JsRoot
  OlOsmSource* {.importc: "OSM".} = ref object of JsRoot

proc newOlView*(options: JsObject = jsUndefined): OlView {.importjs: "(new View(#))".}

proc getCenter*(view: OlView): seq[float] {.importjs: "#.getCenter()".}
proc setCenter*(view: OlView, center: seq[float]) {.importjs: "#.setCenter(#)".}
proc getZoom*(view: OlView): float {.importjs: "#.getZoom()".}
proc setZoom*(view: OlView, zoom: float) {.importjs: "#.setZoom(#)".}

proc newOsmSource*(
  options: JsObject = jsUndefined
): OlOsmSource {.importjs: "(new OSM(#))".}

proc newTileLayer*(
  options: JsObject = jsUndefined
): OlTileLayer {.importjs: "(new TileLayer(#))".}

proc getSource*(layer: OlTileLayer): OlOsmSource {.importjs: "#.getSource()".}

proc fromLonLat*(coordinate: seq[float]): seq[float] {.importc.}
proc fromLonLat*(coordinate: seq[float], projection: cstring): seq[float] {.importc.}
proc toLonLat*(coordinate: seq[float]): seq[float] {.importc.}
proc toLonLat*(coordinate: seq[float], projection: cstring): seq[float] {.importc.}

when defined(openlayersWithMap):
  const mapImportPath = olModuleBase & "/Map.js"
  {.emit: "import Map from '" & mapImportPath & "';".}

  type OlMap* {.importc: "Map".} = ref object of JsRoot

  proc newOlMap*(options: JsObject = jsUndefined): OlMap {.importjs: "(new Map(#))".}
  proc getView*(map: OlMap): OlView {.importjs: "#.getView()".}
  proc setView*(map: OlMap, view: OlView) {.importjs: "#.setView(#)".}
  proc addLayer*(map: OlMap, layer: OlTileLayer) {.importjs: "#.addLayer(#)".}
