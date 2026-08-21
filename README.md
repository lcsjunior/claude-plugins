# claude-plugins

Personal [Claude Code](https://code.claude.com) plugin marketplace — not an app, just prompts. Each plugin lives in `plugins/<name>/` and ships agents, commands, and skills that `claude` loads directly.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/lcsjunior/claude-plugins/main/install.sh | bash
```

This adds the `lcsjunior` marketplace and installs every plugin listed in `install.sh`.

> [!TIP]
> Run `/reload-plugins` inside a Claude Code session afterwards to activate the newly installed plugins.

## Plugins

### `do`

Generic catch-all plugin, namespaced as `/do:*`:

| Command | What it does |
| --- | --- |
| `/do:commit-conventional` | Create a git commit following the Conventional Commits spec |
| `/do:jira-commit` | Branch + commit for a Jira card: `TICKET-KEY/slug` branch, `[TICKET-KEY] description` commit |
| `/do:prd` | Kick off the Spec-Driven Development flow — generate `prd.md` |
| `/do:techspec` | Generate `techspec.md` from an existing `prd.md` |
| `/do:execute` | Implement the feature per `techspec.md`, generating `tasks.md` |
| `/do:review` | Review the implementation and emit `codereview.md` |

#### Spec-Driven Development (SDD) flow

Four subagents run in sequence, each consuming the previous step's artifact under `./tasks/prd-[feature]/` of the target project:

```
/do:prd → prd.md → /do:techspec → techspec.md → /do:execute → tasks.md + code → /do:review → codereview.md
```

`codereview.md` ends in **APROVADO** or **REPROVADO** — a REPROVADO loops back to `/do:execute`. Prompts for this flow are written in Portuguese.

## Recommended extras

Not part of this marketplace, but worth installing alongside it:

| Tool | What it does | Install |
| --- | --- | --- |
| `/skill-creator` | Create, edit, and test skills | [anthropics/skills](https://github.com/anthropics/skills) |
| `/context7-mcp` | Up-to-date library/framework docs (Context7) | [context7.com](https://context7.com/) |
| `/create-readme` | Create a README.md for the project | [claudemarketplaces.com](https://claudemarketplaces.com/skills/github/awesome-copilot/create-readme) |
| `/commit` | Sentry-style conventional commits with issue references | [claudemarketplaces.com](https://claudemarketplaces.com/skills/getsentry/skills/commit) |

[anthropics/skills](https://github.com/anthropics/skills) also documents how to install Anthropic's official skills plugin.

## Add a plugin

1. Create `plugins/<name>/` with `.claude-plugin/plugin.json` and any `agents/`, `commands/`, `skills/`.
2. Add an entry to `.claude-plugin/marketplace.json` and the name to `PLUGINS` in `install.sh`.
3. Validate: `claude plugin validate .`

> [!IMPORTANT]
> Bump `version` in the plugin's `plugin.json` on every change — `claude plugin update` only re-syncs a plugin when its version string changes.

## Repository structure

```
.claude-plugin/marketplace.json   marketplace manifest (name: lcsjunior)
install.sh                        installs every plugin listed in PLUGINS
plugins/
└── do/
    ├── .claude-plugin/plugin.json
    ├── agents/                   prd-creator, techspec-creator, task-executor, task-reviewer
    ├── commands/                 prd, techspec, execute, review
    └── skills/                   commit-conventional, jira-commit
```
