Hi Sherry,
After reviewing the Income and Income Assumptions security rules, the Income module does not use a separate security process — it reads from the same Center Location Security cube as Expenses, which was refreshed correctly in Dev.
The Income rules apply additional filters in Rule 0100 that Expenses does not have. All of the following conditions must pass before a user gets WRITE access:

Profit Center — Center must have Profit Center attribute = 'Y'
Plan Product — Product must have Plan Product attribute = 'Y', and cannot be 'TBA Product'
Module Income — Account must have Module Income attribute = 'WRITE' (or Account does not exist in the Account dimension)
Rates Input Flag — Income Account must have Rates Input Flag attribute = 'Y' (Assumptions cube only)
Client — Client cannot be 'TBA Client'
Disabled Elements — Entity, Account, Center, and Product must not have Enabled = 'N'
Global Variables lock — Group must not be locked to READ in Global Variables

If any of these attribute values or element flags differ between Dev and Production, the Income security output will differ — even though the Center Location Security data is identical and the security processes ran correctly.
Could you check whether the following attribute cubes are in sync between Dev and Production:

}ElementAttributes_Center — Profit Center
}ElementAttributes_Product — Plan Product
}ElementAttributes_Account — Module Income, Enabled
}ElementAttributes_Income Account — Rates Input Flag
}ElementAttributes_Entity — Enabled

If those are aligned and Income still does not match, please share a specific user/center example and I will investigate further.
Thank you,
Niranjan
