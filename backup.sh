#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")" || exit 1
if [ -z "$(git status --porcelain)" ]; then echo "Nothing to backup."; exit 0; fi
git add -A
git commit -m "Auto backup: $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
