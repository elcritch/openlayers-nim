import os
import strutils
import bunnery/build
include bunnery/tasks

--nimcache:".nimcache"
--path:"src"
--define:esmModules

let karaxExampleEntries = @[
  "examples/app.nim",
]

proc buildKaraxExamples() =
  for nimEntry in karaxExampleEntries:
    let bundleOut = nimEntry.changeFileExt("bundle.js")
    let bundleDir = parentDir(bundleOut)
    let bundleStem = splitFile(bundleOut).name
    let bunFlags =
      "--outdir=" & quoteShellArg(bundleDir) & " --entry-naming=" &
      quoteShellArg(bundleStem & ".[ext]")
    discard buildNimAndBundleJs(
      nimEntry = nimEntry,
      bundleOut = bundleOut,
      cssEntries = @["node_modules/ol/ol.css", "examples/app.css"],
      bunFlags = bunFlags,
      run = true
    )

task setup, "setup npm / bun":
  exec "deps/bin/bun add ol"

task test, "Run tests":
  setupTask()
  for testFile in listFiles("tests"):
    if testFile.endsWith(".nim"):
      if testFile.extractFilename().startsWith("tjs_"):
        exec "nim js -d:nodejs -r " & testFile
      else:
        exec "nim c -r " & testFile
  for nimEntry in karaxExampleEntries:
    exec "nim js -d:nodejs " & nimEntry

task serveExamples, "Compile example JS and run the async example server":
  setupTask()
  buildKaraxExamples()
  exec "nim c -r examples/server.nim"

task buildWeb, "Build Karax example bundles with bunnery":
  setupTask()
  buildKaraxExamples()

task regenOl, "Regenerate OpenLayers wrappers and API/options reports":
  exec "node scripts/regenerate_ol_bindings_and_reports.mjs"
