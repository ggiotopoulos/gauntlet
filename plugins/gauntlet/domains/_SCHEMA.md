# Domain Pack — schema

A domain pack is what turns a competent generalist into a domain expert. The
`/design-debate` command is generic and knows nothing about your field; the pack supplies
everything it needs. Packs are plug-in directories — the command never knows what is inside.

Point at one with `--domain_pack=domains/<name>`.

```
domains/<name>/
  manifest.yaml     REQUIRED  identity, scope, escalation rules
  checklist.md      REQUIRED  the recurring things that bite in this domain
  precedents.md     optional  findings from past debates that turned out to matter
  sources/          optional  authoritative documents the expert may cite
```

## Degradation

The command works at every level. It never refuses for want of a pack.

| Pack state | Behavior |
|---|---|
| No pack | Reasons from model knowledge. Every claim marked UNSOURCED. |
| manifest + checklist | Focused search. Still UNSOURCED where no document backs a claim. |
| + sources/ | Claims cite real documents. Everything else stays UNSOURCED. |

An invented citation is worse than no citation. UNSOURCED is always an acceptable answer.

## manifest.yaml

```yaml
schema_version: 1     # REQUIRED. The loader checks this and errors on mismatch
                      # rather than misbehaving. Command version and pack schema
                      # version move independently.
name: personal-finance
display_name: US Personal Finance
version: 1
updated: 2026-09-02

expert_role: >
  One paragraph in second person telling the Domain Expert who it is and what
  kind of error it exists to catch.

owns:
  - what this expert is responsible for
out_of_scope:
  - what belongs to another critic (keeps lanes clean)

escalation:
  - conditions under which the expert must tell the user to consult a licensed
    professional instead of relying on the output
```

## checklist.md — the highest-leverage file

The accumulated list of things that bite in this domain. Not a description of the field —
a list of failure modes with the question that detects each one.

**The checklist is a floor, not a ceiling.** The Domain Expert must cover it and then look
past it. The most valuable findings are never on the list yet; that is what precedents.md
is for.

## precedents.md — how a pack learns

After a debate, append domain findings that proved real. Dated, with the design that
surfaced them. This is the accumulating, human-reviewable substitute for training.

Format: `YYYY-MM-DD | design | finding | why it mattered`

**Prune it.** Precedents encode past mistakes as readily as past wisdom. Review annually;
an unreviewed precedent file becomes folklore in about a year.

## Public vs private packs

The command is generic and worthless without a pack. The pack is where institutional
knowledge lives. Publish the command; keep the pack. A proprietary pack never leaves your
repo, and nothing about it is inferable from the command.
