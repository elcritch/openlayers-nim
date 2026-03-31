import os
import strutils
import bunnery/build

--nimcache:".nimcache"
--path:"src"
--define:esmModules

let karaxExampleEntries = @[
  "examples/simple.nim",
  "examples/semiTransparentLayer.nim",
  "examples/selectFeatures.nim",
  "examples/selectHoverFeatures.nim",
  "examples/layerOpacity.nim",
  "examples/attributions.nim",
  "examples/center.nim",
]

proc buildKaraxExamples() =
  for nimEntry in karaxExampleEntries:
    let bundleOut = nimEntry.changeFileExt("bundle.js")
    discard buildNimAndBundleJs(
      nimEntry = nimEntry,
      bundleOut = bundleOut,
      run = true
    )

task test, "Run tests":
  for testFile in listFiles("tests"):
    if testFile.endsWith(".nim"):
      if testFile.extractFilename().startsWith("tjs_"):
        exec "nim js -d:nodejs -r " & testFile
      else:
        exec "nim c -r " & testFile
  for testFile in listFiles("examples"):
    if testFile.endsWith(".nim") and testFile.extractFilename() != "server.nim":
      exec "nim js -d:nodejs " & testFile

task serveExamples, "Compile example JS and run the async example server":
  buildKaraxExamples()
  exec "nim c -r examples/server.nim"

task buildWeb, "Build Karax example bundles with bunnery":
  buildKaraxExamples()
