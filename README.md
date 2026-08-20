# claude-plugins

Personal Claude Code plugin marketplace. Plugins live in `plugins/<name>/`.

## Install everything

```
curl -fsSL https://raw.githubusercontent.com/lcsjunior/claude-plugins/main/install.sh | bash
```

Then run `/reload-plugins` in Claude Code.

## Plugins

- **`do`** — generic catch-all: `/do:commit-conventional`; Spec-Driven Development flow: `/do:prd`, `/do:techspec`, `/do:execute`, `/do:review`.

## Recommended extras

| Tool | What it does | Install |
| --- | --- | --- |
| `/skill-creator` | Create, edit, and test skills | See [anthropics/skills](https://github.com/anthropics/skills) |
| `/context7-mcp` | Up-to-date library/framework docs (Context7) | [context7.com](https://context7.com/) |

[anthropics/skills](https://github.com/anthropics/skills) also documents how to install Anthropic's official skills plugin.

## Add a plugin

1. Create `plugins/<name>/` with `.claude-plugin/plugin.json` and any `agents/`, `commands/`, `skills/`.
2. Add it to `.claude-plugin/marketplace.json` and to `PLUGINS` in `install.sh`.
3. Validate: `claude plugin validate .`
