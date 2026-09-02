# Evaluation

**Status: methodology pre-registered, results empty.**

This document commits to how Gauntlet will be measured *before* the measurements are taken.
That ordering is deliberate. A tool whose central claim is that unverified confidence is
dangerous should not be evaluated by picking favourable results after the fact.

Nothing here is a finding yet. Everything below is a plan and two anecdotes.

---

## What is currently claimed, and on what basis

| Claim | Evidence today | Status |
|---|---|---|
| The panel finds real design defects | 2 runs, ~15 objections each, author's judgment | **Anecdote** |
| Two skeptics on different models find different things | 2 runs: 1-of-3 overlap, then 0-of-3 | **n=2 hypothesis** |
| Cross-examination surfaces findings neither skeptic had alone | 1 run, 2 novel objections | **n=1 hypothesis** |
| Making PASS expensive reduces lazy passes | Never exercised — nothing has passed yet | **Untested** |
| The all-PASS escalation catches rubber-stamp rounds | Never fired | **Untested** |
| The pipeline produces better shipped code than direct prompting | None | **Unmeasured** |

---

## Experiment 1 — Does the panel beat one good prompt?

**The question that decides whether any of this is worth 24 dispatches.**

Three conditions, same design input, run independently:

- **A — Baseline.** One Opus call: *"Critique this design adversarially. Find the flaws.
  Be specific."* One dispatch.
- **B — Single skeptic.** Gauntlet, one skeptic, one round. ~5 dispatches.
- **C — Full panel.** Gauntlet as shipped, three rounds, cross-examination. ~24 dispatches.

**Sample:** 6 design inputs, varied — one greenfield, one against a real codebase, one
decisions-doc (Mode A), one in a domain with a pack, one without, one deliberately weak
design with a known planted flaw.

**Scoring rubric.** Every objection from every condition goes into one pooled list,
stripped of its source, then scored:

| Dimension | Values |
|---|---|
| Valid | yes / no / unclear |
| Severity | would have caused rework / cosmetic / neither |
| Novelty | obvious on a careful read / required tracing a mechanism |
| Duplicate | of which other objection |

**Primary metric:** distinct valid severe findings per condition.
**Secondary metric:** dispatches per distinct valid severe finding — the efficiency number.

**What would falsify the design:** if A produces ≥80% of C's distinct severe findings.
That result would mean the panel is elaborate rather than better, and it should be
published here rather than buried.

**Known bias, stated up front:** the author scores his own tool. Mitigations — pool and
strip attribution before scoring, score in one sitting rather than per-condition, and where
possible have a second person score independently. This bias cannot be fully removed by a
team of one and the results should be read with it in mind.

---

## Experiment 2 — Does model diversity beat model capability?

Two skeptics, **identical prompt**, only the model varying. Compare against two skeptics on
the *same* model — the redundancy control that has never been run.

- **D1** — Opus + Sonnet (as shipped)
- **D2** — Opus + Opus (same model twice)
- **D3** — Fable + Sonnet

**Metric:** objection overlap rate, and distinct valid findings from the union.

**Hypothesis:** D1 and D3 produce lower overlap and a larger union than D2.

**What would falsify it:** if D2's overlap is comparable to D1's, the diversity is coming
from sampling variance rather than from the models, and the whole two-skeptic design is
just "run the skeptic twice."

Current data: two runs of D1-shaped configurations, overlap 1-of-3 and 0-of-3. No control.

---

## Experiment 3 — Does cross-examination filter, or only add?

Across all runs, count ENDORSE / REFUTE / ADD.

**Observed so far: 5 endorsements, 0 refutations, in the only run.**

If refutations stay near zero across ~10 runs, cross-examination is **additive but not
filtering** — it grows the objection set without ever pruning it. That is still useful and
it is less than the design claims. The claim would need rewriting, not the mechanic.

Possible cause to test: ENDORSE is cheaper than mounting a specific refutation, the same
cost asymmetry the falsification requirement was built to fix. If so, REFUTE may need its
own forcing function.

---

## Experiment 4 — Does the pipeline beat direct prompting? (later)

The question that actually matters, and the hardest to answer.

`design → plan → execute` versus pointing a capable agent at the problem directly.

**Candidate metrics:** post-merge rework rate, design revisions during implementation,
first-pass acceptance, time to a reviewable increment. Explicitly **not** lines of code or
PR count — agentic workloads inflate exactly those first.

Requires a real codebase, real tasks, and enough of both to say anything. Not attemptable
until stages 2 and 3 are generic. Recorded here so the question is not quietly forgotten.

---

## Adoption tracking

**GitHub Insights → Traffic → Clones (unique cloners)** is the install proxy —
`/plugin marketplace add` performs a clone underneath.

**GitHub discards traffic data after 14 days.** Log it weekly or it is gone:

| Week ending | Unique cloners | Clones | Stars | Referrers |
|---|---|---|---|---|
| | | | | |

Stars and forks are visible but lag badly and measure attention rather than use.

---

## Log of runs

| Date | Input | Config | Verdicts | Objections | Notes |
|---|---|---|---|---|---|
| 2026-09-02 | personal finance agent (greenfield) | 1 skeptic fable + sonnet control | 1 BLOCK, 3 CONCERN | ~15 | Domain Expert found a FAFSA arithmetic error; Codebase Expert refuted a core tooling assumption |
| 2026-09-02 | friends meetup scheduling (empty dir) | opus + sonnet, cross-exam, no pack | 1 BLOCK, 4 CONCERN | 15 | Cross-exam produced 2 findings neither skeptic had alone; 0 refutations |
