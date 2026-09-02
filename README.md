# Gauntlet

Multi-agent adversarial design review for Claude Code. Five critics, three fixed rounds,
no early exit — with an audit trail and a report telling you which parts not to trust.

## Install

```
/plugin marketplace add <owner>/<repo>
/plugin install gauntlet@<marketplace>
```

Or try it without installing:

```
claude --plugin-dir ./plugins/gauntlet
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

## Why it's built this way

[`docs/DESIGN.md`](docs/DESIGN.md) — why three rounds, why the critics outrank the
architect, why two skeptics, why PASS is expensive, and what the Trust Report can and
cannot tell you.

## License

MIT
