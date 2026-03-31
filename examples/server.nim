import std/[asynchttpserver, asyncdispatch, os, strutils, uri]

const
  host = "127.0.0.1"
  port = Port(8080)

proc mimeType(path: string): string =
  case splitFile(path).ext.toLowerAscii()
  of ".html": "text/html; charset=utf-8"
  of ".js": "text/javascript; charset=utf-8"
  of ".css": "text/css; charset=utf-8"
  of ".json", ".geojson": "application/json; charset=utf-8"
  of ".svg": "image/svg+xml"
  of ".png": "image/png"
  of ".jpg", ".jpeg": "image/jpeg"
  of ".gif": "image/gif"
  of ".ico": "image/x-icon"
  of ".map": "application/json; charset=utf-8"
  else: "text/plain; charset=utf-8"

proc resolveRequestedFile(requestPath: string): string =
  var pathPart = requestPath
  if pathPart.len == 0 or pathPart == "/":
    pathPart = "/examples/examples.html"

  let decoded = decodeUrl(pathPart)
  var relative = decoded
  if relative.startsWith("/"):
    relative = relative[1 .. ^1]

  let normalized = normalizedPath(relative)
  if normalized.len == 0 or normalized == "." or normalized.startsWith(".."):
    return ""

  result = getCurrentDir() / normalized
  if dirExists(result):
    result = result / "index.html"

proc handleRequest(req: Request) {.async.} =
  let filePath = resolveRequestedFile(req.url.path)
  if filePath.len == 0 or not fileExists(filePath):
    await req.respond(Http404, "Not found")
    return

  let headers = newHttpHeaders()
  headers["Content-Type"] = mimeType(filePath)
  headers["Cache-Control"] = "no-cache"

  await req.respond(Http200, readFile(filePath), headers)

when isMainModule:
  let server = newAsyncHttpServer()
  echo "Serving OpenLayers examples at http://" & host & ":" & $port.int &
    "/examples/examples.html"
  waitFor server.serve(port, handleRequest, address = host)
