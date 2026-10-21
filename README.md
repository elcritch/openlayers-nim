# openlayers-nim

Nim JS bindings for OpenLayers. It follows typescript bidings mostly. Mostly generated with Codex, but guided to provide mostly sane API choices. PRs for more bindings / typed APIs accepted.

The best "docs" are to follow the OpenLayers docs and the ported examples below.

## Examples

The interactive example app and individual example modules are in `examples/`. It uses Karax to switch between the examples.

- Main router app: `examples/app.nim`
- Per-example modules:
  - `examples/simple.nim`
  - `examples/semiTransparentLayer.nim`
  - `examples/selectFeatures.nim`
  - `examples/selectHoverFeatures.nim`
  - `examples/drawFeatures.nim`
  - `examples/earthquakesHeatmap.nim`
  - `examples/drawModifyTraceSnap.nim`
  - `examples/layerOpacity.nim`
  - `examples/attributions.nim`
  - `examples/center.nim`
  - `examples/iconSymbolizer.nim`
  - `examples/markerAnimation.nim`
  - `examples/geoJSON.nim`
  - `examples/layerGroups.nim`

Build the app:

- `nim js -d:nodejs examples/app.nim`

Serve examples locally:

- `nim r examples/server.nim`
- Open `http://127.0.0.1:8080/examples/examples.html`

You can also build any individual example module directly, for example:

- `nim js -d:nodejs examples/drawFeatures.nim`

## Options

This module assumes ESM style modules, which can be opted out of by passing `-d:openlayers.noEsmModules`.

### Browser script bundles

Version 0.4.0 adds `-d:openlayers.globalBundle` for applications that load the
OpenLayers browser `ol.js` script before their compiled Nim JavaScript. ESM remains
the default. `-d:openlayers.noEsmModules` still only suppresses imports for callers
that provide their own namespace aliases.

Use direct imports of the supported map modules: `map`, `view`, `feature`, `overlay`,
`mapBrowserEvent`, `proj`, `extent`; `geom/geometry`, `geom/point`, `geom/multiPolygon`;
`layer/tile`, `layer/vector`, `layer/image`; `source/osm`, `source/xyz`, `source/vector`,
`source/image`, `source/imageStatic`; `style/style`, `style/fill`, `style/stroke`, `style/circle`,
`style/text`; `control/attribution` and `render/event`. The umbrella `openlayers`
module also imports APIs outside this browser subset and should be used with ESM.
Missing browser globals are left undefined, allowing the application to display
its own loading or unavailable state before constructing a map.

`layer/operations` exposes common visibility, opacity, extent and render-event
methods on concrete tile, vector and image layers. `properties` provides typed
access to custom observable properties without converting the entire object to
`JsObject`. Geometry, feature lookup, style arrays, animation and image-source
options also have typed overloads for map applications.

`nim test` runs runtime assertions against both the installed ESM package and its
actual browser bundle, as well as the existing binding checks and Karax build.
