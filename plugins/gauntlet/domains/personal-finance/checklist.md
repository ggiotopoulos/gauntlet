# Checklist — US personal finance

A floor, not a ceiling. Cover these, then look past them. The findings that matter most
are the ones not yet on this list.

## Wash sales
- [ ] Window is 30 days BOTH directions — 61 days total.
- [ ] Replacement purchases include RSU vests, ESPP buys, and dividend reinvestment (DRIP).
- [ ] §1091 attribution: a spouse's accounts count.
- [ ] A wash into an IRA is PERMANENTLY disallowed, not deferred (Rev. Rul. 2008-5).
- [ ] Does the data cadence make the window observable at all? Monthly snapshots cannot see
      a purchase between drops.

## Cost basis
- [ ] RSU basis on a 1099-B is often PRESENT BUT WRONG — commonly excludes the compensation
      element already taxed on the W-2. A guard for missing basis will never fire on this.
- [ ] Pre-2011 non-covered shares carry no broker basis at all.
- [ ] Does the system distinguish "absent" from "wrong"? Only one of those is detectable
      by a null check.

## Equity compensation
- [ ] ISOs and NQSOs are opposite tax objects — AMT preference vs ordinary W-2 income.
- [ ] Unvested is not owned: forfeitable, unsellable, and counting it overstates exposure
      while implying unavailable actions.
- [ ] Post-termination exercise window (commonly 90 days) — a hard deadline on separation.
- [ ] Blackout windows, 10b5-1 plans, §16 status. Any "sell $X of employer stock" output
      without a tradability gate is actionably unsafe.
- [ ] Vest schedule is an input to bracket-filling: vests are ordinary income that stacks
      under any conversion.

## College financial aid
- [ ] Prior-prior year: base year = enrollment year − 2.
- [ ] With multiple children the constrained base years are CONTINUOUS, not discrete —
      compute the union across all siblings' four-year spans.
- [ ] Parent assets assessed ~5.6%; retirement accounts not counted. Income dominates assets.

## State vs federal divergence
- [ ] Short- vs long-term rates may differ at state level (MA: 8.5% vs 5%).
- [ ] Capital-loss offset against ordinary income differs (MA $2,000 vs federal $3,000).
- [ ] State 529 deduction caps and carry-forward rules.

## Thresholds that stack
- [ ] NIIT 3.8% — conversions raise MAGI and drag investment income into it.
- [ ] IRMAA — 2-year lookback, so it goes live at the age-63 income year.
- [ ] AMT for ISO exercises.
- [ ] State surtax thresholds.

## Coupling across time
- [ ] Does any module treat as independent two things that share a year? (IRMAA lookback,
      FAFSA base years, and conversion runway can all land on one calendar.)
- [ ] Does any projection depend on tax law that is not yet legislated? If so, precision in
      the output is theater — say so.

## Always ask
- [ ] What is the largest dollar error this design could produce while looking correct?
- [ ] Is there a rule here that only bites when two features are used together?
