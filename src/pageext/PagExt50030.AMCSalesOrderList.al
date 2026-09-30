pageextension 50030 "AMC Sales Order List" extends "Sales Order List"
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
            field("AMC Price Currency"; Rec."AMC Price Currency")
            {
                ApplicationArea = All;
            }
        }
        moveafter("No."; "Currency Code")
        modify("Currency Code")
        {
            Visible = True;
        }
    }
}
