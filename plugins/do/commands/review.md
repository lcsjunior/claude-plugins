---
description: "Etapa 4 do SDD — aciona o task-reviewer para gerar codereview.md (APROVADO | REPROVADO)."
argument-hint: "[nome-da-feature]"
---

Use o subagente **task-reviewer** para conduzir a etapa de revisão do fluxo Spec-Driven Development.

Feature: $ARGUMENTS

Delegue a ele rodar git diff + testes, validar aderência a `prd.md`/`techspec.md`/rules e emitir o `codereview.md` com status **APROVADO** ou **REPROVADO** na pasta `./tasks/prd-[nome-da-feature]/`, seguindo integralmente a persona e as regras do agente.
