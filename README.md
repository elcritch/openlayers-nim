# openlayers-nim

> Important: compile with `-d:esmModules`.
>
> These bindings emit ESM imports for OpenLayers modules, so builds must define
> `esmModules` (for example: `nim js -d:esmModules ...`). The project `nim.cfg`
> already sets this for normal project builds.

Nim bindings for OpenLayers.

Regenerate wrappers and API/options reports:

- `nim regenOl`
- `npm run gen:ol-all`
