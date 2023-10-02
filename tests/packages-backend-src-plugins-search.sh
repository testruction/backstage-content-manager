#!/usr/bin/env bash
set -euo pipefail

node utils/content-manager/src/index.ts \
  --stdout true \
  --template templates/packages/backend/src/plugins/search.ts.njk \
  --input values/plugins.yaml
