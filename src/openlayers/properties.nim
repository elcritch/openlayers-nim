## Typed access to application-owned properties on OpenLayers observable objects.
import ./[map, feature]
import ./source/imageStatic

type PropertyObject* = Map | Feature | Static

proc property*[T](
  obj: PropertyObject, key: cstring, valueType: typedesc[T]
): T {.importjs: "#.get(#)".}

proc setProperty*[T](
  obj: PropertyObject, key: cstring, value: T
) {.importjs: "#.set(#, #)".}
