---
name: jira-commit
description: Start or commit work against a Jira card in one step. Given a Jira ticket key (e.g. PROJ-1234) and the card's description, builds a "TICKET-KEY/slug" branch (or checks it out if it already exists), stages all changes, and drafts a "[TICKET-KEY] description" commit message for approval. Use whenever the user gives a Jira ticket number and description together, or asks to create/checkout a branch for a Jira card, or commit against one — even if they just paste the card's title.
---

# Jira Commit

Turn a Jira ticket key + card description into a correctly named branch and a
correctly formatted commit, with the user approving both before anything is
written to git.

## 1. Get the inputs

You need two things: the ticket key (e.g. `PROJ-1234`) and the card
description/title. Take them from the user's message — the first
`LETTERS-NUMBERS` token is the ticket key, the rest of the line is the
description. If either is missing or the ticket key doesn't look like a Jira
key, ask for it before doing anything else. Never invent or guess either one.

## 2. Build the branch name

Format: `TICKET-KEY/slug`, e.g. `XXXX-1111/implementar-integracao-pagamento`.

The slug is derived from the description's core words, **in whatever language
the description is written in** — do not translate it to English just
because this skill's instructions are in English. Unlike the commit message
(step 3), the slug needs to be ASCII-safe: branch names get matched by
shells, CI, and older tooling that don't always cope well with accents.

- lowercase, words joined with hyphens, punctuation dropped
- strip accents/non-ASCII letters to their closest ASCII letter
  (`integração` → `integracao`, `serviço` → `servico`)
- 32 characters max

To fit the limit, trim in this order and stop as soon as it fits — each step
is a fallback for when the previous one wasn't enough, not something to apply
by default:
1. Drop connector words that carry no meaning alone — articles, prepositions,
   conjunctions (`com`, `de`, `para`, `e`, `the`, `for`, `and`, ...). These
   rarely belong in a slug regardless of length.
2. Still too long? Drop the generic action verb, if there is one
   (`implementar`, `criar`, `adicionar`, `corrigir`, `implement`, `add`,
   `fix`, ...) — the ticket already implies work happened, so once the
   connectors are gone the verb is the least informative word left.
3. Still too long? Abbreviate the longest remaining word with a common,
   recognizable abbreviation (`pagamento` → `pgto`) rather than dropping a
   distinct piece of meaning. Prefer this over cutting a word in half.

Example: "Implementar integração com serviço de pagamento" → drop `com`/`de`
→ `implementar-integracao-servico-pagamento` (40 chars, still over 32) → drop
`implementar` → `integracao-servico-pagamento` (28 chars, fits).

Before creating anything, check whether the branch already exists
(`git branch --list TICKET-KEY/slug` locally, and check the remote too if it
matters to the user's workflow). If it exists, the plan is simply to check it
out — there's no new name to approve, only the commit message.

## 3. Build the commit message

Format: `[TICKET-KEY] description`, e.g.
`[XXXX-1111] Implementar integração com serviço de pagamento`.

Same rule as the slug: keep the description in its original language and
characters, unabridged where it fits. 120 characters max including the
`[TICKET-KEY] ` prefix. If it doesn't fit, shorten by dropping the least
essential trailing words at a natural boundary — preserve meaning over
brevity, and never abbreviate a word just to save characters.

## 4. Confirm before touching git

Show the user the proposed branch name and commit message together and ask
them to confirm before proceeding. If they edit either one, use their
version — don't re-derive it. Do not run any git command in this step.

## 5. Execute (only after approval)

1. Run `git status` first — if there's nothing to commit, say so and stop.
2. Branch: `git checkout -b TICKET-KEY/slug` if it's new, or
   `git checkout TICKET-KEY/slug` if it already existed (see step 2).
3. Stage everything with `git add -A` — this workflow is meant to capture
   all outstanding work for the card, not a partial diff.
4. Commit with the approved message.
5. Report the result, then suggest the exact push command
   (`git push -u origin TICKET-KEY/slug`) — **never run it yourself**. Pushing
   publishes the branch; that's the user's call to make, not something to do
   on their behalf.

## Rules

- Never push automatically — only ever suggest the command.
- Never translate the slug or commit description, or ASCII-fold the commit
  description — the slug alone gets stripped of accents (step 2).
- Only abbreviate a slug word as a last resort, after dropping connector
  words and the generic verb — and only with a common, recognizable
  abbreviation.
- Never commit without the user having approved the exact branch name and
  commit message first.
