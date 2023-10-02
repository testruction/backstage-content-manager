#!/usr/bin/env bash
set -euo pipefail

# node bin/hb.js --stdout true \
#   --template templates/packages/app/src/components/Root/Root.tsx.hbs \
#   --input values/plugins.yaml

node bin/njk.js --stdout true \
  --template templates/packages/app/src/components/Root/Root.tsx.njk \
  --input values/plugins.yaml
