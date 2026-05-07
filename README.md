Hi Team,
This is to confirm that Bug #3955597 has been resolved and validated in the EPA environment.
Issue Summary
When the SSAP file was loaded via the Allocation – Load SSAP process, Program Codes were appearing correctly under the Control Total (Total Program Code) but were not populating into the Program Code Include Hierarchy (Total Incl Prgm Codes). The hierarchy was consistently showing empty after every load run.
Root Cause
After reviewing the TI process chain, two issues were identified:

The DIM – Program Code – SSAP process had no data source configured, so the Metadata section loop never fired. The dProgramCode variable was never set, meaning no elements were ever added to the hierarchy.
The Allocation – Load SSAP process was not calling the DIM process after load completion, so the hierarchy was never rebuilt post-load.
The excluded codes (GP0DA, GP0DB, GP0K4) as per SSAP BRD Section 4 were not being flagged automatically — this was relying on manual attribute updates.

Changes Made

DIM – Program Code – SSAP (Epilog): Replaced the broken Metadata-based loop with a DIMSIZ/DIMNM loop in the Epilog. Changed DIMENSIONELEMENTCOMPONENTADD to DIMENSIONELEMENTCOMPONENTADDDIRECT to ensure immediate commits (required since Prolog uses EXECUTEPROCESS on the same dimension).
Allocation – Load SSAP (Data section): Added ITEMSKIP logic to exclude GP0DA, GP0DB, and GP0K4 from being loaded into the SSAP cube per BRD Section 4.
Allocation – Load SSAP (Epilog): Added ATTRPUTS calls to automatically flag the three excluded codes with SSAP Excl Flag = Y, and added EXECUTEPROCESS to trigger the DIM rebuild at the end of every load run.

Test Results
ProcessRecords FoundSkippedProcessedAllocation – Load SSAP6,96136,958DIM – Program Code – SSAP47344
Post-run validation in PAW confirmed 44 Program Codes are correctly listed under Total Incl Prgm Codes, with GP0DA, GP0DB, and GP0K4 excluded as required by the BRD.
Acceptance Criteria Met
All GP* Program Codes that are not flagged for exclusion are now listed correctly in the hierarchy. The fix is repeatable — re-running the load process rebuilds the hierarchy automatically each time.
Please review and let me know if any further validation is needed from your side before we move this to the next environment.
Thanks,
Niranjan Patra
GFS Dev – Assurant
