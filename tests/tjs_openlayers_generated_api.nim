import std/unittest

import jsffi
import openlayers/api/map as apiMap
import openlayers/api/view as apiView
import openlayers/api/proj as apiProj
import openlayers/api/layer/tile as apiLayerTile
import openlayers/api/layer/vector as apiLayerVector
import openlayers/api/source/osm as apiSourceOsm
import openlayers/api/source/vector as apiSourceVector
import openlayers/api/events/condition as apiEventsCondition
import openlayers/api/control as apiControl
import openlayers/api/interaction/defaults as apiInteractionDefaults
import openlayers/api/interaction/draw as apiInteractionDraw
import openlayers/api/format/geoJSON as apiFormatGeoJson
import openlayers/api/format/wkt as apiFormatWkt
import openlayers/api/geom/point as apiGeomPoint
import openlayers/api/geom/polygon as apiGeomPolygon
import openlayers/api/style/style as apiStyleStyle
import openlayers/api/style/fill as apiStyleFill
import openlayers/api/style/stroke as apiStyleStroke

suite "generated openlayers/api wrappers":
  test "common generated modules expose namespace objects":
    discard apiMap.getNamespace()
    discard apiView.getNamespace()
    discard apiProj.getNamespace()
    discard apiLayerTile.getNamespace()
    discard apiLayerVector.getNamespace()
    discard apiSourceOsm.getNamespace()
    discard apiSourceVector.getNamespace()
    discard apiEventsCondition.getNamespace()
    discard apiControl.getNamespace()
    discard apiInteractionDefaults.getNamespace()
    discard apiInteractionDraw.getNamespace()
    discard apiFormatGeoJson.getNamespace()
    discard apiFormatWkt.getNamespace()
    discard apiGeomPoint.getNamespace()
    discard apiGeomPolygon.getNamespace()
    discard apiStyleStyle.getNamespace()
    discard apiStyleFill.getNamespace()
    discard apiStyleStroke.getNamespace()

  test "constructors compile for representative generated classes":
    check compiles(apiMap.newOlMap())
    check compiles(apiView.newOlView(jsUndefined))
    check compiles(apiLayerTile.newOlTileLayer(jsUndefined))
    check compiles(apiLayerVector.newOlVectorLayer(jsUndefined))
    check compiles(apiSourceOsm.newOlOSM(jsUndefined))
    check compiles(apiSourceVector.newOlVectorSource())
    check compiles(apiInteractionDraw.newOlDraw(jsUndefined))
    check compiles(apiFormatGeoJson.newOlGeoJSON())
    check compiles(apiFormatWkt.newOlWKT(jsUndefined))
    check compiles(apiGeomPoint.newOlPoint(jsUndefined))
    check compiles(apiGeomPolygon.newOlPolygon(jsUndefined))
    check compiles(apiStyleStyle.newOlStyle(jsUndefined))
    check compiles(apiStyleFill.newOlFill(jsUndefined))
    check compiles(apiStyleStroke.newOlStroke(jsUndefined))

  test "function and constant wrappers remain callable":
    check compiles(apiProj.fromLonLat(jsUndefined))
    check compiles(apiProj.toLonLat(jsUndefined))
    check compiles(apiInteractionDefaults.defaults())
    check compiles(apiGeomPolygon.circular(jsUndefined, 1.0))
    discard apiControl.getZoom()
    discard apiEventsCondition.getAlways()
    discard apiSourceOsm.getATTRIBUTION()
