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
    if testFile.endsWith(".nim"):
      exec "nim js -d:nodejs " & testFile
