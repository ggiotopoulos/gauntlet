# Precedents — US personal finance

Findings from past debates that proved real. Append after each run. Prune annually.

Format: `design | finding | why it mattered`

---

**Example run | FAFSA base years computed per-child as discrete
years rather than as a continuous union across siblings.** The design optimized Roth
conversions against one base year per child; the real constrained window was continuous
across the first child's four aid years alone. An arithmetic error inside a module whose entire purpose is
precision — and it would have produced confident, wrong conversion sizing for a decade.

**Example run | A "refuse to run on missing basis" guard defends
against the wrong failure.** RSU basis is usually present but understated. The guard never
fires, gains are overstated, and the output looks clean. Detecting *absent* data is easy
and is not the risk; detecting *wrong* data is the risk.

**Example run | Ingestion cadence silently defeated a rule the
system claimed to enforce.** Monthly snapshots cannot observe a purchase inside a 30-day
wash-sale window. The architecture's central promise — never produce a confident wrong
number — was reintroduced through a data-pipeline decision nobody connected to it.
Generalizable: check whether the observation cadence can actually see the rule being enforced.

**Example run | No tradability gate on employer-stock
recommendations.** Blackout windows, 10b5-1 and §16 status were absent from a design that
would output sell recommendations. Generalizable: whenever output implies an action, ask
whether the user is legally permitted to take it at the moment it is offered.
