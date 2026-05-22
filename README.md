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



Hi Sherry,
Just wanted to give you a quick update — I've completed the investigation and fix for the Everyone group Read access issue on newly created versions. DEV testing is done and everything looks good.
After going through the security layers, I found that both version creation processes (System - Master Copy Version - Quarterly and System - Master Copy Version - Non Standard) were inserting new Version elements but never stamping security or triggering a cache refresh afterward. So the version existed in the dimension, the security cube was fine for all existing versions, but the new element just wasn't visible to users until the next System - Refresh Security ran. That was the gap.
I've updated both processes to stamp CAMID("::Everyone") = READ in }ElementSecurity_Version right after the new element is created, and run SECURITYREFRESH immediately after. The fix only kicks in when a genuinely new version is being created — so reruns and existing versions are completely unaffected.
To test from your end:
Run System - Master Copy Version - Quarterly in DEV with a new version name like TEST_RF_SECURITY. Once it finishes, open }ElementSecurity_Version, filter the Groups column to CAMID("::Everyone"), and the new version should show READ straight away — no manual refresh needed. You can also log in as a regular business user and confirm they can see it in PAW immediately. Running the TI a second time with the same version name should produce no extra changes — the log will show it was already set.
I also verified all existing versions are unchanged after the fix.
Let me know if you'd like to go through the code changes together before we move to PROD, happy to walk you through it.
Thanks,
Niranjan
