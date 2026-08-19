pageextension 50043 "AMC ITI Sales Doc. Nos. Tmp." extends "ITI Sales Doc. Nos. Tmp. List"
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
