# CLAUDE.md

Personal **Claude Code plugin marketplace**, not an app. Root is the marketplace (`.claude-plugin/marketplace.json`, name `lcsjunior`); each plugin lives in `plugins/<name>/`. `install.sh` installs them all. No build/test — editing prompts *is* the work. Validate with `claude plugin validate .`.

```
.claude-plugin/marketplace.json
install.sh
plugins/
└── do/    # generic catch-all, including the Spec-Driven Development flow (pt-BR)
```

Plugin commands/skills are namespaced by plugin name (`/do:*`) — no way to drop the prefix.

## Add a plugin

Create `plugins/<name>/.claude-plugin/plugin.json` (+ `agents/`, `commands/`, `skills/`), add an entry to `marketplace.json` (`"source": "./plugins/<name>"`), and add the name to `PLUGINS` in `install.sh`.

## The Spec-Driven Development (SDD) flow, inside `do`

Four subagents run in order, each consuming the previous artifact into `./tasks/prd-[feature]/` of the target project:

`prd-creator` → `prd.md` → `techspec-creator` → `techspec.md` → `task-executor` → `tasks.md` + code → `task-reviewer` → `codereview.md` (**APROVADO** or **REPROVADO**; REPROVADO loops back to the executor).

Load-bearing invariants when editing these agents:
- The four filenames are a hard interface — rename one only across all agents.
- **"Mapeamento de camadas"**: mandatory `techspec.md` section; executor follows it, reviewer blocks on layer violations.
- APROVADO/REPROVADO gate: any blocking finding = REPROVADO. Only APROVADO ends the cycle.
- Prompts are Portuguese, terse; respect the target project's `.claude/rules/` and `.claude/skills/`.
