import os
import strutils

--nimcache:".nimcache"
--path:"src"
--define:esmModules

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
  for exampleFile in listFiles("examples"):
    if exampleFile.endsWith(".nim") and exampleFile.extractFilename() != "server.nim":
      exec "nim js " & exampleFile
  exec "nim c -r examples/server.nim"

task buildWeb, "Compile Nim to JS, then bundle with Bun":
  discard buildNimAndBundleJs(
    nimEntry = "src/main.nim",
    nimFlags = "-d:release",
    cssEntries = @["src/styles.css"],
    run = true
  )

