#!/usr/bin/env bash
set -euo pipefail

# Serve the app from the repo root, preferring Node for auto-open, then Python.
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

if command -v npx >/dev/null 2>&1; then
  npx -y http-server -o
  exit 0
fi

if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server 8080
  exit 0
fi

if command -v python >/dev/null 2>&1; then
  python -m http.server 8080
  exit 0
fi

cat <<'EOF'
No Python or Node found. You can:
  1) Install Node: https://nodejs.org
  2) Install Python: https://python.org/downloads/ (check "Add Python to PATH" on Windows)
  3) Install the XMLUI CLI: https://github.com/xmlui-org/cli
EOF
exit 1
