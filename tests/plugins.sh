#!/usr/bin/env bash
set -euo pipefail

# packages/backend/src/index.ts
node bin/hb.js --stdout true \
  --template templates/packages/backend/src/index.ts.hbs \
  --input values/plugins.yaml

node bin/hb.js --stdout true \
  --template templates/packages/backend/src/plugins/search.ts.hbs \
  --input values/plugins.yaml

node bin/hb.js --stdout true \
  --template templates/packages/app/src/components/catalog/EntityPage.tsx.hbs \
  --input values/plugins.yaml

node bin/hb.js --stdout true \
  --template templates/packages/app/src/components/search/SearchPage.tsx.hbs \
  --input values/plugins.yaml

node bin/hb.js --stdout true \
  --template templates/packages/app/src/App.tsx.hbs \
  --input values/plugins.yaml
