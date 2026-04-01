import jsffi
import karax/[karaxdsl, vdom]
import openlayers/feature
import openlayers/format/geoJSON
import openlayers/geom/circle
import openlayers/geom/geometry
import openlayers/layer/tile
import openlayers/layer/vector
import openlayers/map
import openlayers/source/osm
import openlayers/source/vector
import openlayers/style/circle as circleStyleNs
import openlayers/style/fill
import openlayers/style/stroke
import openlayers/style/style
import openlayers/view

import olExampleHelpers

when isMainModule:
  import karax/karax

const geoJsonSample =
  """{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "geometry": {
        "type": "Point",
        "coordinates": [0, 0]
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "LineString",
        "coordinates": [[4000000, -2000000], [8000000, 2000000]]
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "LineString",
        "coordinates": [[4000000, 2000000], [8000000, -2000000]]
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "Polygon",
        "coordinates": [[[-5000000, -1000000], [-3000000, -1000000], [-4000000, 1000000], [-5000000, -1000000]]]
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "MultiLineString",
        "coordinates": [
          [[-1000000, -750000], [-1000000, 750000]],
          [[1000000, -750000], [1000000, 750000]],
          [[-750000, -1000000], [750000, -1000000]],
          [[-750000, 1000000], [750000, 1000000]]
        ]
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [[[-5000000, 6000000], [-3000000, 6000000], [-3000000, 8000000], [-5000000, 8000000], [-5000000, 6000000]]],
          [[[-2000000, 6000000], [0, 6000000], [0, 8000000], [-2000000, 8000000], [-2000000, 6000000]]],
          [[[1000000, 6000000], [3000000, 6000000], [3000000, 8000000], [1000000, 8000000], [1000000, 6000000]]]
        ]
      }
    },
    {
      "type": "Feature",
      "geometry": {
        "type": "GeometryCollection",
        "geometries": [
          {
            "type": "LineString",
            "coordinates": [[-5000000, -5000000], [0, -5000000]]
          },
          {
            "type": "Point",
            "coordinates": [4000000, -5000000]
          },
          {
            "type": "Polygon",
            "coordinates": [[[1000000, -6000000], [3000000, -6000000], [2000000, -4000000], [1000000, -6000000]]]
          }
        ]
      }
    }
  ]
}"""

var
  initialized = false
  mapObj: JsObject = jsUndefined

proc makeStyleFunction(
    pointStyle: Style,
    lineStyle: Style,
    polygonStyle: Style,
    multiPolygonStyle: Style,
    geometryCollectionStyle: Style,
    circleStyle: Style,
): proc(featureObj: JsObject): JsObject =
  result = proc(featureObj: JsObject): JsObject =
    let feature = cast[Feature](featureObj)
    let geometryType = $cast[Geometry](feature.getGeometry()).getType()
    case geometryType
    of "Point", "MultiPoint":
      cast[JsObject](pointStyle)
    of "LineString", "MultiLineString":
      cast[JsObject](lineStyle)
    of "Polygon":
      cast[JsObject](polygonStyle)
    of "MultiPolygon":
      cast[JsObject](multiPolygonStyle)
    of "GeometryCollection":
      cast[JsObject](geometryCollectionStyle)
    of "Circle":
      cast[JsObject](circleStyle)
    else:
      cast[JsObject](pointStyle)

proc createDom*(): VNode =
  result = buildHtml(tdiv(class = "example-shell")):
    h2:
      text "GeoJSON"
    tdiv(id = "map", class = "map")

proc initExample*(): JsObject =
  if initialized:
    return mapObj
  initialized = true

  let pointStrokeOptions = newStrokeOptions()
  pointStrokeOptions.color = "red".cstring
  pointStrokeOptions.width = 1.0
  let pointStroke = newStroke(pointStrokeOptions)

  let pointImageOptions = circleStyleNs.newCircleStyleOptions()
  pointImageOptions.radius = 5.0
  pointImageOptions.stroke = pointStroke
  let pointImage = circleStyleNs.newCircleStyle(pointImageOptions)

  let pointStyleOptions = newStyleOptions()
  pointStyleOptions.image = pointImage
  let pointStyle = newStyle(pointStyleOptions)

  let lineStrokeOptions = newStrokeOptions()
  lineStrokeOptions.color = "green".cstring
  lineStrokeOptions.width = 1.0
  let lineStroke = newStroke(lineStrokeOptions)

  let lineStyleOptions = newStyleOptions()
  lineStyleOptions.stroke = lineStroke
  let lineStyle = newStyle(lineStyleOptions)

  let polygonStrokeOptions = newStrokeOptions()
  polygonStrokeOptions.color = "blue".cstring
  polygonStrokeOptions.lineDash = @[4.0]
  polygonStrokeOptions.width = 3.0
  let polygonStroke = newStroke(polygonStrokeOptions)

  let polygonFillOptions = newFillOptions()
  polygonFillOptions.color = "rgba(0, 0, 255, 0.1)".cstring
  let polygonFill = newFill(polygonFillOptions)

  let polygonStyleOptions = newStyleOptions()
  polygonStyleOptions.stroke = polygonStroke
  polygonStyleOptions.fill = polygonFill
  let polygonStyle = newStyle(polygonStyleOptions)

  let multiPolygonStrokeOptions = newStrokeOptions()
  multiPolygonStrokeOptions.color = "yellow".cstring
  multiPolygonStrokeOptions.width = 1.0
  let multiPolygonStroke = newStroke(multiPolygonStrokeOptions)

  let multiPolygonFillOptions = newFillOptions()
  multiPolygonFillOptions.color = "rgba(255, 255, 0, 0.1)".cstring
  let multiPolygonFill = newFill(multiPolygonFillOptions)

  let multiPolygonStyleOptions = newStyleOptions()
  multiPolygonStyleOptions.stroke = multiPolygonStroke
  multiPolygonStyleOptions.fill = multiPolygonFill
  let multiPolygonStyle = newStyle(multiPolygonStyleOptions)

  let collectionStrokeOptions = newStrokeOptions()
  collectionStrokeOptions.color = "magenta".cstring
  collectionStrokeOptions.width = 2.0
  let collectionStroke = newStroke(collectionStrokeOptions)

  let collectionFillOptions = newFillOptions()
  collectionFillOptions.color = "magenta".cstring
  let collectionFill = newFill(collectionFillOptions)

  let collectionImageStrokeOptions = newStrokeOptions()
  collectionImageStrokeOptions.color = "magenta".cstring
  let collectionImageStroke = newStroke(collectionImageStrokeOptions)

  let collectionImageOptions = circleStyleNs.newCircleStyleOptions()
  collectionImageOptions.radius = 10.0
  collectionImageOptions.stroke = collectionImageStroke
  let collectionImage = circleStyleNs.newCircleStyle(collectionImageOptions)

  let geometryCollectionStyleOptions = newStyleOptions()
  geometryCollectionStyleOptions.stroke = collectionStroke
  geometryCollectionStyleOptions.fill = collectionFill
  geometryCollectionStyleOptions.image = collectionImage
  let geometryCollectionStyle = newStyle(geometryCollectionStyleOptions)

  let circleStrokeOptions = newStrokeOptions()
  circleStrokeOptions.color = "red".cstring
  circleStrokeOptions.width = 2.0
  let circleStroke = newStroke(circleStrokeOptions)

  let circleFillOptions = newFillOptions()
  circleFillOptions.color = "rgba(255, 0, 0, 0.2)".cstring
  let circleFill = newFill(circleFillOptions)

  let circleStyleOptions = newStyleOptions()
  circleStyleOptions.stroke = circleStroke
  circleStyleOptions.fill = circleFill
  let circleStyle = newStyle(circleStyleOptions)

  let geoJson = newGeoJSON()
  let features = geoJson.readFeatures(geoJsonSample.cstring)

  let vectorSourceOptions = newVectorSourceOptions()
  vectorSourceOptions.features = features
  let vectorSource = newVectorSource(vectorSourceOptions)

  let circleFeature = newFeature()
  circleFeature.setGeometry(newCircle(jsArray2(5000000.0, 7000000.0), 1000000.0))
  vectorSource.addFeature(circleFeature)

  let vectorLayerOptions = newVectorLayerOptions()
  vectorLayerOptions.source = vectorSource
  vectorLayerOptions.style = makeStyleFunction(
    pointStyle, lineStyle, polygonStyle, multiPolygonStyle, geometryCollectionStyle,
    circleStyle,
  )
  let vectorLayer = newVectorLayer(vectorLayerOptions)

  let baseLayerOptions = newTileLayerOptions()
  baseLayerOptions.source = newOSM()
  let baseLayer = newTileLayer(baseLayerOptions)

  let viewOptions = newViewOptions()
  viewOptions.center = jsArray2(0.0, 0.0)
  viewOptions.zoom = 2.0
  let mapView = newView(viewOptions)

  let mapOptions = newMapOptions()
  mapOptions.layers = @[baseLayer, vectorLayer]
  mapOptions.target = getElementById("map".cstring)
  mapOptions.view = mapView
  mapObj = cast[JsObject](newMap(mapOptions))

  result = mapObj

proc cleanupExample*() =
  initialized = false
  mapObj = jsUndefined

when isMainModule:
  proc initStandalone() =
    discard initExample()

  discard setRenderer(createDom, "ROOT", initStandalone)
