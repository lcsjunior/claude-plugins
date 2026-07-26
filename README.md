# claude-plugins

Personal Claude Code plugin marketplace. Plugins live in `plugins/<name>/`.

## Install everything

```
curl -fsSL https://raw.githubusercontent.com/lcsjunior/claude-plugins/main/install.sh | bash
```

Then run `/reload-plugins` in Claude Code.

## Plugins

- **`sdd`** — Spec-Driven Development flow: `/sdd:prd`, `/sdd:techspec`, `/sdd:execute`, `/sdd:review`, `/sdd:commit-conventional`.
- **`do`** — generic catch-all (`/do:*`). Empty for now.

## Add a plugin

1. Create `plugins/<name>/` with `.claude-plugin/plugin.json` and any `agents/`, `commands/`, `skills/`.
2. Add it to `.claude-plugin/marketplace.json` and to `PLUGINS` in `install.sh`.
3. Validate: `claude plugin validate .`
