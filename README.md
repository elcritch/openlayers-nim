# openlayers-nim

> Important: compile with `-d:esmModules`.
>
> These bindings emit ESM imports for OpenLayers modules, so builds must define
> `esmModules` (for example: `nim js -d:esmModules ...`). The project `nim.cfg`
> already sets this for normal project builds.

Nim bindings for OpenLayers.

## Examples

The interactive example app and individual example modules are in `examples/`.

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

Regenerate wrappers and API/options reports:

- `nim regenOl`
- `npm run gen:ol-all`
