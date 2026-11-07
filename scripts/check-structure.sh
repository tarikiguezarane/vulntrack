#!/usr/bin/env bash
# Repository structure test: fails if a mandatory file or directory of the monorepo
# is missing, or if a forbidden file (e.g. a real `.env`) is tracked by Git.
set -euo pipefail

cd "$(dirname "$0")/.."

required=(
  backend
  frontend
  docs
  docker-compose.yml
  .gitignore
  .env.example
  LICENSE
  README.md
  ROADMAP.md
  JOURNAL.md
)

status=0
for path in "${required[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "MISSING: $path"
    status=1
  fi
done

# A real environment file must never be versioned.
if git ls-files --error-unmatch .env >/dev/null 2>&1; then
  echo "FORBIDDEN: .env is tracked by Git"
  status=1
fi

# The licence must be MIT.
if ! grep -q "MIT License" LICENSE; then
  echo "INVALID: LICENSE is not MIT"
  status=1
fi

if [[ $status -eq 0 ]]; then
  echo "Repository structure OK"
fi
exit $status
