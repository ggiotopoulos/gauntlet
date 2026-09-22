# Gauntlet

Multi-agent adversarial design review for Claude Code. Five critics, three fixed rounds,
no early exit — with an audit trail and a report telling you which parts not to trust.

## Install

```
/plugin marketplace add ggiotopoulos/gauntlet
/plugin install gauntlet@gauntlet
```

Or try it without installing:

```
claude --plugin-dir ./plugins/gauntlet
```

**If you added this as a local marketplace while testing**, remove it before installing
from GitHub — marketplace names are unique, and a local-path source and a GitHub source
cannot share one:

```
/plugin uninstall gauntlet@gauntlet
/plugin marketplace remove gauntlet
/plugin marketplace add ggiotopoulos/gauntlet
/plugin install gauntlet@gauntlet
```

## Use

```
/gauntlet:design "Add multi-tenant support to the billing service"
```

With a domain pack, and a stronger skeptic where available:

```
/gauntlet:design --domain_pack=domains/personal-finance --skeptic_model_a=fable \
  "A household financial analysis agent that ingests monthly brokerage exports"
```

## What you get

A design doc in `docs/designs/`, and a **Trust Report** at the top of it telling you:

- which decisions were made *for* you, ranked by how hard they are to reverse
- which claims nobody verified
- where the panel disagreed
- what was parked rather than solved
- which critics contributed nothing, and what that leaves unchecked

The Trust Report is designed to make the document easier to distrust. It does not detect
hallucinations — nothing does. It shows you the unverified surface area so you know where
to spend your scrutiny.

## The panel

| Agent | Job |
|---|---|
| Architect | Proposes, then defends and revises |
| Skeptic A + B | Attack from first principles. Same prompt, **different models** — diversity, not redundancy |
| Codebase Expert | Verifies claims against real code. Marks PARTIAL when it only confirmed a name |
| Pragmatist | Scope, sequencing, buildability |
| Domain Expert | Domain correctness, configured by a domain pack |

## Domain packs

The command knows nothing about your field. A pack supplies the expertise — see
[`plugins/gauntlet/domains/_SCHEMA.md`](plugins/gauntlet/domains/_SCHEMA.md). `plugins/gauntlet/domains/personal-finance/` is a worked example.

Packs are directories, not code. Publish the command; keep your pack.

## Does it work?

[`docs/EVALUATION.md`](docs/EVALUATION.md) — the methodology is pre-registered and the
results are still mostly empty. It states which claims are anecdote, which are n=2
hypotheses, which have never been exercised, and what result would falsify the design.
A tool whose thesis is that unverified confidence is dangerous should not claim more
than it has measured.

## Why it's built this way

[`docs/DESIGN.md`](docs/DESIGN.md) — why three rounds, why the critics outrank the
architect, why two skeptics, why PASS is expensive, and what the Trust Report can and
cannot tell you.

## License

MIT
