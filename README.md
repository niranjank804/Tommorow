Hi Sherry,
Thank you — that is actually a really interesting idea and I want to give you a proper answer on it.
You are right that the two directions solve different problems. The downward walk (ELCOMP) is fast and correctly reaches the leaf centers. The issue I hit was at the consolidation level, but your suggestion to run them as two separate passes without erasing each other is worth investigating properly.
Here is what I need to verify before I can confirm it will work:
The reason the ELCOMP downward walk caused consolidation failures last time is that ELCOMP in TM1 TI only traverses the default hierarchy. Our Center dimension has 7+ alternate hierarchy trees. When I walked down from a rollup like 1:HINTL PC, ELCOMP only followed children in one hierarchy path — it missed consolidation elements that sit in alternate hierarchy trees and also need access set.
Your two-pass idea could still solve this if we structure it carefully:

Pass 1 (downward ELCOMP): writes to leaf elements under dCenter — fast and correct
Pass 2: instead of a full upward ELPAR walk, we write directly to dCenter itself (the source rollup) and to any intermediate consolidation nodes found during the downward walk.

Thank you for thinking through this — it may be exactly the approach we need.
Kind regards,
Niranjan Patra
