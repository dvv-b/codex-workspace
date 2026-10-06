\# Codex Workspace



Reusable Codex agents, skills, and workflows for software and data engineering projects.



\## Purpose



This repository contains reusable configurations for working with Codex across different projects and machines.



The goal is to keep global capabilities separate from project-specific context:



\- \*\*Agents\*\* define reusable roles and responsibilities.

\- \*\*Skills\*\* define reusable procedures and specialized knowledge.

\- \*\*Project instructions\*\* remain inside each project's own `AGENTS.md`.

\- \*\*Business rules and domain knowledge\*\* remain inside their respective projects.



\## Agents



\### Explorer



Read-only agent responsible for exploring repositories and gathering the minimum context required before implementation.



\### Data Worker



Implementation agent focused on data transformations, pipelines, validation, testing, and related data-engineering tasks.



\### Reviewer



Independent read-only reviewer responsible for comparing implementations against requirements, contracts, documentation, and tests.



\## Skills



\### Data Quality



Reusable guidance for evaluating dataset quality and implementing auditable data-quality checks based on explicit contracts and requirements.



\## Workflow



The initial workflow follows:



```text

Explorer

&#x20;  ↓

Data Worker

&#x20;  ↓

Reviewer

