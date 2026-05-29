As an EPA System Admin, I need to research with IBM Planning Analytics support the causes of sustained Critical Memory threshold alerts and identify configuration, model, TI, or DIM-level changes that can reduce overall memory consumption so that the system does not repeatedly hit the 475 GB critical threshold and trigger external alert emails.
The work includes:
Reviewing current memory usage patterns and alert thresholds.
Identifying high-memory contributors (cubes, DIM sizes, views, feeders, TI processes, persistent objects).
Validating IBM-recommended best practices for memory optimization.
Proposing actionable remediation options (configuration changes, cleanup activities, redesign recommendations).
Documenting findings and recommendations for implementation planning.
Acceptance criteria:
Top contributors to critical memory usage are identified (e.g., specific cubes, DIM growth, TI behavior, or configuration settings).
At least one viable option to reduce or stabilize memory usage is documented (no implementation required).
Any recommended changes clearly state expected impact on memory and potential risks.
Results are documented in a format consumable by the EPA admin team for follow‑up PBIs or implementation work.
No production changes are made as part of this PBI.





Subject: Security Memory Spike — Methods Tried & Revert Update
Hi [Manager's Name],
I wanted to give you an update on the security memory spike issue and walk you through everything I tried to fix it.
What I tried:
First I looked at the existing code and found that SUBSETELEMENTNAME was being used in the Data section — this function does not exist in TM1 TurboIntegrator at all, so I removed it and corrected that.
Next I tried using ELNPAR inside a BFS traversal to count parent elements. This also does not exist in TM1 — it threw a hard runtime error, so that was ruled out straight away.
Then I tried an upward traversal using ELPAR — the idea was to walk from the source element up to its ancestor rollups. This ran without errors but caused a leaf level failure. What happened was the rollup centers (like 1:HINTL PC) were showing WRITE correctly but all the leaf centers underneath (C800010, C800040, C800041, C850000 to C850005) were still showing READ. Sherry caught this during her testing using Marta Cortes as an example. This approach had to be dropped because it was propagating in the wrong direction — upward instead of downward.
After that I tried a downward traversal using ELCOMP — starting from the rollup and walking down to actual descendants only, to avoid scanning all 26,000 center elements every time. But this caused failures at the summary/consolidation level, so consolidation centers were not getting the correct values. That also had to be ruled out.
I also made some Prolog optimisations — replaced the subset build loop with TM1SUBSETALL, added VIEWZEROOUT, and disabled cube logging during the run. These helped with Prolog overhead but had no impact on the memory spike itself since the problem is in the Data section.
IBM Support:
I raised IBM Support Case TS022197433. IBM confirmed there are no server configuration parameters that will reduce peak memory for this type of workload. They said the 475 GB spike is expected behaviour at our scale (26,000 Centers x 550 Locations x 252 user groups) and is not a misconfiguration.
Where we are now:
After all the above, none of the changes resolved the memory spike. So I have reverted back to the original ELISANC-based code which is confirmed working correctly in both Dev and Production. Sherry has verified the access is correct.
As an interim fix, I have moved the security chore to run overnight during off-peak hours so users are not impacted during the day.
The only real long-term fix would be a full redesign of the security process logic, which would need to be a separate project. Happy to discuss further if needed.
Thanks,
Niranjan Patra
EPA System Administration
