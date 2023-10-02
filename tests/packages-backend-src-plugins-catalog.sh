#!/usr/bin/env bash
set -euo pipefail

node utils/content-manager/src/index.ts \
  --stdout true \
  --template templates/packages/backend/src/plugins/catalog.ts.njk \
  --input values/plugins.yaml
