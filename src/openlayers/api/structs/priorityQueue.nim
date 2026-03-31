import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.emit: "import * as olNs_structs_PriorityQueue from 'ol/structs/PriorityQueue.js';".}

proc getNamespace*(): JsObject {.importjs: "(olNs_structs_PriorityQueue)".}

type
  OlPriorityQueue* = ref object of JsRoot
proc newOlPriorityQueue*(priorityFunction: JsObject, keyFunction: JsObject): OlPriorityQueue {.importjs: "(new olNs_structs_PriorityQueue.default(#, #))".}
proc clear*(self: OlPriorityQueue) {.importjs: "#.clear()".}
proc dequeue*(self: OlPriorityQueue): JsObject {.importjs: "#.dequeue()".}
proc enqueue*(self: OlPriorityQueue, element: JsObject): bool {.importjs: "#.enqueue(#)".}
proc getCount*(self: OlPriorityQueue): float {.importjs: "#.getCount()".}
proc isEmpty*(self: OlPriorityQueue): bool {.importjs: "#.isEmpty()".}
proc isKeyQueued*(self: OlPriorityQueue, key: cstring): bool {.importjs: "#.isKeyQueued(#)".}
proc isQueued*(self: OlPriorityQueue, element: JsObject): bool {.importjs: "#.isQueued(#)".}
proc reprioritize*(self: OlPriorityQueue) {.importjs: "#.reprioritize()".}

proc getDROP*(): float {.importjs: "(olNs_structs_PriorityQueue.DROP)".}
