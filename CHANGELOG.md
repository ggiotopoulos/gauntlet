# Changelog

## 0.1.0 — unreleased

First packaged release. Restructured from a single 955-line command file.

**Panel**
- Two Skeptics on different models, identical prompt. Diversity, not redundancy.
- Skeptic cross-examination: ENDORSE / REFUTE / ADD on the other's objections, plus at
  most one new objection from the exchange. Refuted objections kept with their refutation.
- Strictest-verdict rule on Skeptic disagreement; splits logged rather than averaged.
- Critics upgraded so they are not outgunned by the Architect they attack.
- Explicit lane boundaries in every critic prompt.

**Trust**
- Falsification required on every PASS/RESOLVED, enforced by an orchestrator gate.
- All-PASS round-1 escalation.
- **Trust Report** at the top of every design doc and printed to the terminal: decisions
  ranked by reversibility, unverified claims, panel splits, parked concerns, panel
  integrity. It exposes unverified surface area; it does not claim to detect hallucinations.

**Domain packs**
- Pluggable `domains/<name>/` — manifest, checklist, precedents, sources.
- Checklist is a floor, not a ceiling: the Domain Expert must report at least one
  off-checklist risk or state it looked and found none.
- Precedent capture after each run, gated on user approval.
- `schema_version` checked by the loader; errors rather than misbehaves on mismatch.
- Degrades to UNSOURCED mode with no pack. Never refuses to run.

**Packaging**
- Claude Code plugin layout; agent prompts read from `${CLAUDE_PLUGIN_ROOT}`.
- Single-file `dist/gauntlet.md` build for install-free trial.
- Rationale moved out of the runtime path into `docs/DESIGN.md`.

**Fixed**
- `$ARGUMENTS.<field>` never parsed — frontmatter named arguments are documentation only.
  The orchestrator now parses the argument string itself and echoes the parse back.
- Duplicate step numbering in final assembly.
- Hard-coded project paths, stack references, and pharma-specific domain vocabulary
  removed from the command.
