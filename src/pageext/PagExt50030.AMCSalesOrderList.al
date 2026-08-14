pageextension 50030 "AMC Sales Order List" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("AMC RW Transaction";Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction Type";Rec."AMC RW Transaction Type")
            {
                ApplicationArea = All;
            }
        }
        moveafter("Amount Including VAT"; "Currency Code")
        modify("Currency Code")
        {
            Visible = True;
        }
    }
}
