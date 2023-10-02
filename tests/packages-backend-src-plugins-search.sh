#!/usr/bin/env bash
set -euo pipefail

# node bin/hb.js --stdout true \
#   --template templates/packages/backend/src/plugins/search.ts.hbs \
#   --input values/plugins.yaml

node bin/njk.js --stdout true \
  --template templates/packages/backend/src/plugins/search.ts.njk \
  --input values/plugins.yaml
