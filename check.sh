#!/usr/bin/env bash
# Fails on a broken internal link. Lists the <mark> placeholders still open; with --launch they fail the run too.
set -euo pipefail
cd "$(dirname "$0")/legal"

status=0
for f in *.html; do
  for target in $(grep -oE 'href="[a-z-]+"' "$f" | sed -E 's/href="(.*)"/\1/' | sort -u); do
    if [ ! -f "$target.html" ]; then
      echo "BROKEN LINK in $f: $target"
      status=1
    fi
  done
done

open=$(grep -c '<mark>' *.html | grep -v ':0' || true)
if [ -n "$open" ]; then
  echo "Open placeholders (file:count):"
  echo "$open"
  if [ "${1:-}" = "--launch" ]; then status=1; fi
fi
exit $status
