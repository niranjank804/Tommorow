As an EPA System Admin, I need to update the Premium Tax Income Driver so it can optionally be based on Earned or Written amounts, allowing FP&A users flexibility while maintaining Earned as the default behavior.

The current process is hardcoded to use Earned only. This PBI will introduce a user-controlled option that defaults to Earned but allows FP&A to switch the driver to Written when required. The change will impact both forms and the calculation logic that consumes the driver. No other driver behavior or downstream logic should change.

***See attached email for some background on this request. Reach out to Sherry with requirements questions. 
Hi Sherry,

Thank you for the detailed update. I appreciate the visibility into the current workload and priorities your team is managing.

To align with the business rules, ensure a more accurate forecast, and ultimately facilitate executive decision-making, we would like to move forward with this enhancement request. If it cannot be addressed at this time, could it be slotted into the next priority level or a later enhancement wave?

With respect to which products would leverage this enhancement, while I can’t speak on behalf of other teams, according to the accounting team (email attached), this enhancement appears to be broadly applicable across multiple products.

 


From: Sherry 

Ross, we would need the FP&A owner of EPA (Lisa Piel) to assess the enhancement request and provide feedback of the priority. 

Currently, we have some major tasks/developments that are our focus for the next month or so, such as saving the current RF1 version, preparing the system for RF2, deploying the Scenario modelling build (for Argentina), deploying the Canada Entity allocations, building and deploying the Group Insurance allocations, running the April allocations, and several additional builds in the other applications that our team supports.

How many products will use this enhancement and how critical is it? 

Thank you,
 
Sherry
 
Upcoming OOO:  May 25-29
  
From: Ross Bellis 

Hi Sherry,

Thank you for the detailed response and context on how the Income Rates rules were originally built.

Any sense of the level of effort involved (e.g., timeline, resources needed) to add the picklist to that field? That would help us determine next steps.

I appreciate your help on this!

Best regards
 Ross Bellis
 Manager, Finance
 Assurant
 





Ross, at the time that the new GFS EPA system was built, the only driver that was being used across all products was the Earned driver, so the Income Rates rules were built with that driver “hard-coded”. We would need to make a code change to add a picklist to that field, and to add a rule that would calculate the Premium Taxes on the selection. Is this change needed?

In the meantime, if you leave the Premium Tax Rate at 0, will the Input Amount tab allow you to input the $$ directly into the Premium Taxes account (rather than being rate derived)?

Thank you,
 

 
 


Hi Sherry,
We are reviewing the driver for the Premium Tax Rate forecast for both NFIP and Private Flood (commercial and commercial excess) and would like to update it to be based on written premium rather than earned premium. At the moment, the driver cells appear to be locked, so we’re unable to make the change on our end.
Would your team be able to either facilitate this update or unlock the applicable cell(s) so we can proceed? I’ve included a screenshot below for reference.
 


I appreciate any support you can provide.


acceptance criteria:
Team agreement is reached with FP&A on Earned vs Written driver behavior
Premium Tax Income Driver defaults to Earned
FP&A users have the option to select Written instead of Earned
Selection is available and clearly labeled on the applicable input form(s)
Driver selection is respected by the calculation logic
Calculations correctly use Earned or Written based on user selection
Period (DIM) behavior remains consistent with existing design
No impact to unrelated drivers or calculations
TI and rule updates complete successfully with no errors
Results are validated for both Earned and Written scenarios
Changes are documented and meet the team’s Definition of Done

