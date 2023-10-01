#!/usr/bin/env bash
set -euo pipefail

# packages/backend/src/index.ts
node bin/hb.js --stdout true \
  --template templates/packages/backend/src/index.ts.hbs \
  --input values/plugins.yaml
