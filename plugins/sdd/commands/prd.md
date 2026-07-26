---
description: "Etapa 1 do SDD — aciona o prd-creator para gerar o prd.md da feature."
argument-hint: "[nome/descrição da feature]"
---

Use o subagente **prd-creator** para conduzir a etapa de PRD do fluxo Spec-Driven Development.

Feature: $ARGUMENTS

Delegue a ele a criação do `prd.md` em `./tasks/prd-[nome-da-feature]/`, seguindo integralmente a persona e as regras do agente.
