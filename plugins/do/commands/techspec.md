---
description: "Etapa 2 do SDD — aciona o techspec-creator para gerar o techspec.md a partir do prd.md."
argument-hint: "[nome-da-feature]"
---

Use o subagente **techspec-creator** para conduzir a etapa de Tech Spec do fluxo Spec-Driven Development.

Feature: $ARGUMENTS

Delegue a ele a leitura do `prd.md` e a criação do `techspec.md` na pasta `./tasks/prd-[nome-da-feature]/`, seguindo integralmente a persona e as regras do agente.
