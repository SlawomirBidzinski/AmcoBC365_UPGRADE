pageextension 50030 "AMC Sales Order List" extends "Sales Order List"
{
    layout
    {
        addafter("No.")
        {
            field("AMC Invoice Type"; Rec."AMC Invoice Type")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction Type"; Rec."AMC RW Transaction Type")
            {
                ApplicationArea = All;
            }
        }
        modify("Bill-to Customer No.")
        {
            Visible = true;
        }
        moveafter("Sell-to Customer No."; "Bill-to Customer No.")

        modify("Currency Code")
        {
            Visible = True;
        }
        moveafter("Location Code"; "Currency Code")
        addafter("Currency Code")
        {
            field("AMC Price Currency"; Rec."AMC Price Currency")
            {
                ApplicationArea = All;
            }
        }
        modify("Assigned User ID")
        {
            Visible = false;
        }
        addlast(Control1)
        {
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
