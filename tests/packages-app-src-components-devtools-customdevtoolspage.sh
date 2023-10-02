#!/usr/bin/env bash
set -euo pipefail

node utils/content-manager/src/index.ts \
  --stdout true \
  --template templates/packages/app/src/components/devtools/CustomDevToolsPage.tsx.njk \
  --input values/plugins.yaml