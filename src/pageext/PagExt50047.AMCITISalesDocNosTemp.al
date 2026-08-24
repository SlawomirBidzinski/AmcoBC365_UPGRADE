pageextension 50047 "AMC ITI Sales Doc. Nos. Temp." extends "ITI Sales Doc. Nos. Templates"
{
    layout
    {
        addlast(General)
        {
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction Type"; Rec."AMC RW Transaction Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
