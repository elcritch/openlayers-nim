// Run the same runtime assertions against the actual OpenLayers browser bundle.
import { readFileSync } from 'node:fs';
import { runInThisContext } from 'node:vm';
runInThisContext(readFileSync(new URL('../node_modules/ol/dist/ol.js', import.meta.url), 'utf8'));
