import std/os
import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

const
  openLayersBundleDir* = block:
    let srcDir = currentSourcePath().parentDir
    srcDir.parentDir / "deps" / "openlayers_bundle"
  openLayersBundleJsPath* = openLayersBundleDir / "ol.js"
  defaultOpenLayersBundleUrl* = "https://cdn.jsdelivr.net/npm/ol@latest/dist/ol.js"
  defaultOpenLayersCssUrl* = "https://cdn.jsdelivr.net/npm/ol@latest/ol.css"

proc openLayersLoaded*(): bool {.importjs: "(typeof ol !== 'undefined')".}
proc hasMapConstructor*(): bool {.
  importjs: "(typeof ol !== 'undefined' && typeof ol.Map === 'function')"
.}

type
  OlView* = ref object of JsRoot
  OlTileLayer* = ref object of JsRoot
  OlOsmSource* = ref object of JsRoot
  OlMap* = ref object of JsRoot

proc newOlView*(
  options: JsObject = jsUndefined
): OlView {.importjs: "(new ol.View(#))".}

proc getCenter*(view: OlView): seq[float] {.importjs: "#.getCenter()".}
proc setCenter*(view: OlView, center: seq[float]) {.importjs: "#.setCenter(#)".}
proc getZoom*(view: OlView): float {.importjs: "#.getZoom()".}
proc setZoom*(view: OlView, zoom: float) {.importjs: "#.setZoom(#)".}

proc newOsmSource*(
  options: JsObject = jsUndefined
): OlOsmSource {.importjs: "(new ol.source.OSM(#))".}

proc newTileLayer*(
  options: JsObject = jsUndefined
): OlTileLayer {.importjs: "(new ol.layer.Tile(#))".}

proc getSource*(layer: OlTileLayer): OlOsmSource {.importjs: "#.getSource()".}

proc newOlMap*(options: JsObject = jsUndefined): OlMap {.importjs: "(new ol.Map(#))".}
proc getView*(map: OlMap): OlView {.importjs: "#.getView()".}
proc setView*(map: OlMap, view: OlView) {.importjs: "#.setView(#)".}
proc addLayer*(map: OlMap, layer: OlTileLayer) {.importjs: "#.addLayer(#)".}

proc fromLonLat*(
  coordinate: seq[float]
): seq[float] {.importjs: "ol.proj.fromLonLat(#)".}

proc fromLonLat*(
  coordinate: seq[float], projection: cstring
): seq[float] {.importjs: "ol.proj.fromLonLat(#, #)".}

proc toLonLat*(coordinate: seq[float]): seq[float] {.importjs: "ol.proj.toLonLat(#)".}
proc toLonLat*(
  coordinate: seq[float], projection: cstring
): seq[float] {.importjs: "ol.proj.toLonLat(#, #)".}
