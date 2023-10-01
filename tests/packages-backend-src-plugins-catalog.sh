#!/usr/bin/env bash
set -euo pipefail

node bin/hb.js --stdout true \
  --template templates/packages/backend/src/plugins/catalog.ts.hbs \
  --input values/plugins.yaml
