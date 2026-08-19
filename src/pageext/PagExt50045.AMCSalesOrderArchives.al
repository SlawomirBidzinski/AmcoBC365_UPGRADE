pageextension 50045 "AMC Sales Order Archives" extends "Sales Order Archives"
{
    layout
    {
        addafter("No.")
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
        modify("Currency Code")
        {
            Visible = True;
        }
    }
}
