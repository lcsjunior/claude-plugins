#!/usr/bin/env bash
# Install every plugin from this marketplace into Claude Code (user scope).
set -euo pipefail

MARKETPLACE="lcsjunior/claude-plugins"
MARKETPLACE_NAME="lcsjunior"

# All plugins in this repo. Add new plugin names here as the marketplace grows.
PLUGINS=(
  do
)

echo "==> Adding marketplace: $MARKETPLACE"
claude plugin marketplace add "$MARKETPLACE" || \
  claude plugin marketplace update "$MARKETPLACE_NAME"

for plugin in "${PLUGINS[@]}"; do
  echo "==> Installing $plugin@$MARKETPLACE_NAME"
  claude plugin install "$plugin@$MARKETPLACE_NAME"
done

echo "==> Done. Run /reload-plugins inside Claude Code to activate."
