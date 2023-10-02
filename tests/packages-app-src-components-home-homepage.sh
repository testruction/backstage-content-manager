#!/usr/bin/env bash
set -euo pipefail

node bin/hb.js --stdout true \
  --template templates/packages/app/src/components/home/HomePage.tsx.hbs \
  --input values/plugins.yaml
