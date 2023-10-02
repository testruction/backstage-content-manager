#!/usr/bin/env bash
set -euo pipefail

node utils/content-manager/src/index.js \
  --stdout true \
  --template utils/content-manager/src/templates/packages/app/src/components/devtools/CustomDevToolsPage.tsx.njk \
  --input utils/content-manager/plugins.yaml