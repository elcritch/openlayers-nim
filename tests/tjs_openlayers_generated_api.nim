import std/unittest

import jsffi
import openlayers/map as apiMap
import openlayers/view as apiView
import openlayers/proj as apiProj
import openlayers/layer/tile as apiLayerTile
import openlayers/layer/vector as apiLayerVector
import openlayers/source/osm as apiSourceOsm
import openlayers/source/vector as apiSourceVector
import openlayers/events/condition as apiEventsCondition
import openlayers/control as apiControl
import openlayers/interaction/defaults as apiInteractionDefaults
import openlayers/interaction/draw as apiInteractionDraw
import openlayers/format/geoJSON as apiFormatGeoJson
import openlayers/format/wkt as apiFormatWkt
import openlayers/geom/point as apiGeomPoint
import openlayers/geom/polygon as apiGeomPolygon
import openlayers/style/style as apiStyleStyle
import openlayers/style/fill as apiStyleFill
import openlayers/style/stroke as apiStyleStroke

suite "generated openlayers wrappers":
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
