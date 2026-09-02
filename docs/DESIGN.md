# Why Gauntlet is built this way

Every choice here was made because a simpler alternative failed. This document exists so
the command file can contain instructions only — rationale costs tokens on every run and
changes the model's behavior not at all.

## Three fixed rounds, no convergence detection

Early exit rewards agreement, and agreement is exactly what an adversarial panel is
supposed to withhold. A convergence check turns "the critics stopped objecting" into
"the design is sound," which are different claims. Three rounds always, no exceptions.

## Review is a separate agent from the implementer

Self-assessment finds the errors you already knew to look for. The reviewer is dispatched
independently and never sees itself as the author.

## The attacker must outrank the defender

The Skeptic's job — find the flaw in a plausible design from first principles — is harder
than the Architect's job of producing one. Assigning the strong model to the proposer and
a weaker one to the critics means the defense wins by default and you get a rubber stamp
with an audit trail. Critic output is capped at 150-200 words, so model choice costs far
less on a critic than on the Architect or the Codebase Expert. Buy capability where the
system is weakest.

## Two Skeptics on different models

The Skeptic is the only role doing **unbounded search** over failure space. Every other
critic is bounded: the Codebase Expert reports facts (two readers of one file produce one
answer), the Domain Expert checks against standards, the Pragmatist guards a narrow lane.
Doubling any of those buys duplicate work at double cost. Doubling the Skeptic buys
coverage.

**Observed 2026-09-02, n=1 — hypothesis, not finding.** A Fable skeptic and a Sonnet
skeptic given the identical prompt produced three objections each with one in common.
Fable found mechanism-level defects (a monthly ingestion cadence colliding with a 30-day
wash-sale window). Sonnet found an architectural gap Fable missed entirely (a boundary
that constrained arithmetic but never constrained narration). Neither superset the other.
Replicate across several designs before treating this as a result.

**Both Skeptics run the same prompt.** Only the model varies. Tune the prompts differently
and you can no longer attribute any difference to model diversity — you have an anecdote.

**Agreement is not confirmation.** Two models converging may reflect a shared training
prior rather than truth. Reported as agreement, never as verification.

## Cross-examination

An objection that survives cross-examination is stronger evidence than one nobody tested.
Independent critique gives coverage; cross-examination gives confidence. Refuted objections
are kept with their refutations rather than dropped, because the refutation is itself a
finding.

The 4-objection cap after cross-exam exists because two Skeptics can produce six-plus
objections and the Architect has 800 words. Volume defeats the prioritization that the
3-objection limit was imposed to force.

## Verification gates, not prompt hopes

Three places the orchestrator checks output rather than trusting an instruction to bind:
alignment against locked decisions (2.5), falsification presence (3.5a), and argument
parsing (0a, echoed back). Each exists because the instruction alone was observed to fail.

## Making PASS expensive

A critic asked to critique will often just pass — objecting costs effort and passing costs
nothing. Requiring a concrete, testable falsification on every PASS equalizes the cost, so
a pass means "I looked and found nothing" instead of "I didn't look."

The all-PASS escalation exists for the same reason at the panel level: unanimous
first-round approval of a novel design is rare enough to be evidence about the panel.

## Lane boundaries

Observed: a Skeptic spent one of its three objection slots on scope and timeline, which
the Pragmatist already owned. Every critic prompt now names what is explicitly not its job.

## Domain packs

The command is generic and knows nothing about any field. The pack supplies the expert's
identity, its lane, a checklist, accumulated precedents, and optional sources.

**The checklist is a floor, not a ceiling.** It encodes what previous runs already knew to
look for. The findings that matter most are the ones not on it yet, which is why the Domain
Expert must report at least one off-checklist risk or state that it looked and found none.

**Precedents are how a pack learns** — accumulation and human review, not training. This is
the only form of learning that survives an environment where you have to explain why the
system believes what it believes.

**Publish the command, keep the pack.** The command is worthless without a pack; the pack
is where institutional knowledge lives. A proprietary pack never enters a distributable.

## UNSOURCED discipline

The Domain Expert marks any claim it cannot tie to a real document. The Codebase Expert
marks PARTIAL when it confirmed a symbol's name but not its full contract. An invented
citation is worse than no citation, and a tool that refuses to run without a corpus is a
tool nobody tries.

## The Trust Report

A design doc reads as authoritative regardless of how it was produced. The reader cannot
see that every decision in it was made by agents, that some claims were single-source, or
that two critics disagreed and one was overruled — reconstructing that means reading three
rounds of debate, which nobody does.

**It cannot detect hallucinations.** Nothing can detect its own hallucinations, and a
section claiming to will not survive the first person who asks how. It exposes *unverified
surface area*: every place the doc asserts something nobody checked.

**Ranked by reversibility, not importance.** The reader has ninety seconds. A decision
that is cheap to change later does not need scrutiny; one baked into the data model does.

**It must make the doc easier to distrust.** A trust report that usually concludes "looks
good" is decoration. It leads with counts of what is unverified, and a clean run should
look conspicuously short rather than reassuring.
