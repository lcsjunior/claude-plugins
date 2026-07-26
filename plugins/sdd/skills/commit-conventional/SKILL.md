---
name: commit-conventional
description: Create a git commit using Conventional Commits style. Stages changes, analyzes diffs, and generates a well-formatted commit message with the appropriate type prefix and optional scope.
---

# Conventional Commit

Create a git commit following the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.

## Message Format

```
<type>(<scope>): <subject>

<body>
```

- **type**: Required. One of the types below.
- **scope**: Optional. A noun describing the area of the codebase (e.g., `agents`, `auth`, `api`, `dx`).
- **subject**: Required. Imperative, lowercase, no period. Max ~50 chars.
- **body**: Optional. Explain the "why", not the "what". Wrap at 72 chars.

## Commit Types

| Type | When to use |
|------|-------------|
| `feat` | New feature for the user |
| `fix` | Bug fix for the user |
| `docs` | Documentation only |
| `style` | Formatting, whitespace, semicolons — no logic change |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `test` | Adding or updating tests |
| `perf` | Performance improvement |
| `build` | Build system or external dependency changes |
| `ci` | CI/CD configuration changes |
| `chore` | Everything else — tooling, config, developer experience, maintenance |

### Common scopes for `chore`

| Scope | Examples |
|-------|---------|
| `agents` | AI agent skills, prompts, tool configs |
| `dx` | Developer experience, editor config, local tooling |
| `deps` | Dependency updates |
| `lint` | Linter or formatter config |
| `docker` | Docker/container config |

## Workflow

1. Run `git status` and `git diff --staged` (and `git diff` for unstaged changes) to understand what changed
2. Run `git log --oneline -5` to see recent commit style for context
3. Classify the change into the appropriate **type** (and optionally a **scope**)
4. Draft a commit message following the format above
5. Stage the relevant files (prefer explicit file paths over `git add -A`)
6. Commit using a HEREDOC for proper formatting:

```bash
git commit -m "$(cat <<'EOF'
type(scope): subject line here

Optional body explaining why this change was made.
EOF
)"
```

## Rules

- NEVER use `--no-verify` unless the user explicitly asks
- NEVER amend a previous commit unless the user explicitly asks
- NEVER commit files that look like secrets (`.env`, credentials, keys)
- If a pre-commit hook fails, fix the issue and create a NEW commit
- Ask the user before committing if the correct type/scope is ambiguous
