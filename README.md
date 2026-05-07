The WorkDay load supports a dynamic Center-to-Location mapping that is configurable via data (not hard-coded). (Location can be a drop down pick list to ensure it is a Location within the current Dimension - Location)
A Center flagged for an alternate Location loads workers to the mapped Location instead of the default.
Centers without a mapping continue to load to the default Location with no change in behavior.
Multiple Centers can be mapped to different Locations.
Updating or adding a Center-to-Location mapping does not require a TI code change.
Invalid or missing mappings do not cause the load to fail. 
The logic is limited to the WorkDay load and does not impact other inbound processes.
Load results can be validated through EPA data (Center and Location alignment).
Developer has completed Unit Testing on Process
BA/QA Testing is completed on Process
Solution follows existing EPA DIM and TI standards and meets Definition of Ready and Definition of Done
