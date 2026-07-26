# claude-plugins

Personal Claude Code plugin marketplace. Plugins live in `plugins/<name>/`.

## Install everything

```
curl -fsSL https://raw.githubusercontent.com/lcsjunior/claude-plugins/main/install.sh | bash
```

Then run `/reload-plugins` in Claude Code.

## Plugins

- **`sdd`** — Spec-Driven Development flow: `/sdd:prd`, `/sdd:techspec`, `/sdd:execute`, `/sdd:review`.
- **`do`** — generic catch-all: `/do:commit-conventional`.

## Recommended extras

| Tool | What it does | Install |
| --- | --- | --- |
| `/fewer-permission-prompts` | Builds a Bash allowlist from your history to cut permission prompts | Built-in — just run it |
| `/skill-creator` | Create, edit, and test skills | Built-in — just run it |
| `/context7-mcp` | Up-to-date library/framework docs (Context7) | `npx ctx7 setup` |

## Add a plugin

1. Create `plugins/<name>/` with `.claude-plugin/plugin.json` and any `agents/`, `commands/`, `skills/`.
2. Add it to `.claude-plugin/marketplace.json` and to `PLUGINS` in `install.sh`.
3. Validate: `claude plugin validate .`
