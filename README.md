
Subject: PBI 3951796 — WorkDay Load: Dynamic Location Mapping for International Centers | Dev Complete

Hi Team,
As part of PBI 3951796, I have completed development and unit testing for the WorkDay Load — Adjust Location for International story in Assurant GFS Dev.
Background:
Previously, the WorkDay load assigned all workers to the Location coming directly from the WorkDay source. There was no way to redirect a Center to a different Location without a code change. This was a problem for international Centers that need to load to a specific Location not provided by WorkDay.
What was built:
A data-driven Center-to-Location override is now in place. Two new objects were created in EPA as part of this PBI:

WFP Override Measures — new dimension
WFP Center Alt Location Override — new cube with a Location picklist dropdown

The TI process (Workforce Planning Input - Load from Workday) was updated to read from this cube. A pre-existing bug in the CENTER field handling was also identified and fixed during this work.
How anyone on the team can use it:
Open the WFP Center Alt Location Override cube in PAW → find the Center → pick the target Location from the dropdown → re-run the WorkDay load. No developer involvement, no code change, no deployment needed. The BA or any team member with PAW access can manage mappings directly.
Test result:
C010000 → L5003:Australia — 2 employees confirmed at the correct Location. All unmapped Centers unaffected.
Pending:
Please confirm which Centers require the override mapping (Center ID + target Location ID) so the configuration can be applied under PBI 3951796.
Thanks,
Niranjan Patra
Assurant GFS Dev
