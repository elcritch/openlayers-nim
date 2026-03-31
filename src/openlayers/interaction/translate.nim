import jsffi

when not defined(js):
  {.fatal: "openlayers bindings require Nim's JavaScript backend.".}

when defined(esmModules):
  {.
    emit: "import * as olNs_interaction_Translate from 'ol/interaction/Translate.js';"
  .}

proc getNamespace*(): JsObject {.importjs: "(olNs_interaction_Translate)".}

type Translate* = ref object of JsRoot
proc newTranslate*(
  options: JsObject = jsUndefined
): Translate {.importjs: "(new olNs_interaction_Translate.default(#))".}

proc getHitTolerance*(self: Translate): float {.importjs: "#.getHitTolerance()".}
proc setHitTolerance*(
  self: Translate, hitTolerance: float
) {.importjs: "#.setHitTolerance(#)".}

type TranslateOptions* = ref object of JsRoot

proc newTranslateOptions*(): TranslateOptions {.importjs: "({})".}
proc `condition=`*(
  options: TranslateOptions, value: JsObject
) {.importjs: "#.condition = #".}

proc `condition=`*(
  options: TranslateOptions, value: RootRef
) {.importjs: "#.condition = #".}

proc `features=`*(
  options: TranslateOptions, value: JsObject
) {.importjs: "#.features = #".}

proc `features=`*(
  options: TranslateOptions, value: RootRef
) {.importjs: "#.features = #".}

proc `layers=`*(options: TranslateOptions, value: JsObject) {.importjs: "#.layers = #".}
proc `layers=`*(options: TranslateOptions, value: RootRef) {.importjs: "#.layers = #".}
proc `layers=`*[T](
  options: TranslateOptions, value: seq[T]
) {.importjs: "#.layers = #".}

proc `filter=`*(options: TranslateOptions, value: JsObject) {.importjs: "#.filter = #".}
proc `filter=`*(options: TranslateOptions, value: RootRef) {.importjs: "#.filter = #".}
proc `hitTolerance=`*(
  options: TranslateOptions, value: float
) {.importjs: "#.hitTolerance = #".}

proc newTranslate*(
  options: TranslateOptions
): Translate {.importjs: "(new olNs_interaction_Translate.default(#))".}
