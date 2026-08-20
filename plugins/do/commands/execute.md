---
description: "Etapa 3 do SDD — aciona o task-executor para gerar tasks.md e implementar a feature."
argument-hint: "[nome-da-feature]"
---

Use o subagente **task-executor** para conduzir a etapa de implementação do fluxo Spec-Driven Development.

Feature: $ARGUMENTS

Delegue a ele a leitura de `prd.md` + `techspec.md`, a criação do `tasks.md` e a implementação item por item na pasta `./tasks/prd-[nome-da-feature]/`. Ao final, ele mesmo aciona o task-reviewer, conforme sua persona e regras.
