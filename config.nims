import os
import strutils

--nimcache:".nimcache"
--path:"src"

task test, "Run tests":
  let olBundlePath = "deps/openlayers_bundle/ol.js"
  if not fileExists(olBundlePath):
    exec "nim c -r tools/setup_openlayers_bundle.nim"
  for testFile in listFiles("tests"):
    if testFile.endsWith(".nim"):
      if testFile.extractFilename().startsWith("tjs_"):
        exec "nim js -d:nodejs -r " & testFile
      else:
        exec "nim c -r " & testFile
  for testFile in listFiles("examples"):
    if testFile.endsWith(".nim"):
      exec "nim c " & testFile

task setupOpenLayers, "Download bundled OpenLayers assets from the CDN":
  exec "nim c -r tools/setup_openlayers_bundle.nim"
