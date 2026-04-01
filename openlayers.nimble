version       = "0.1.0"
author        = "Jaremy Creechley"
description   = "openlayer javascript bindings"
license       = "BSD-2-Clause"
srcDir        = "src"

requires "https://github.com/elcritch/bunnery"


feature "dev":
  requires "karax"

feature "reference":
  requires "p5nim"
  requires "ajax"
  requires "https://github.com/openlayers/openlayers"

