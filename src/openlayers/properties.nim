## Typed access to application-owned properties on OpenLayers observable objects.
import ./[map, feature]
import ./source/image

type PropertyObject* = Map | Feature | ImageSource

proc property*[T](
  obj: PropertyObject, key: cstring, valueType: typedesc[T]
): T {.importjs: "#.get(#)".}

proc setProperty*[T](
  obj: PropertyObject, key: cstring, value: T
) {.importjs: "#.set(#, #)".}
