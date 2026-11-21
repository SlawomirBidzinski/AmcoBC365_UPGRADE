pageextension 50085 "AMC Posted Whse. Shipment List" extends "Posted Whse. Shipment List"
{
    layout
    {
        modify("Posting Date")
        {
            Visible = true;
        }

        addafter("No.")
        {
            field("AMC Customer Code"; Rec."AMC Customer Code")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Name"; Rec."AMC Customer Name")
            {
                ApplicationArea = All;
            }
            field("AMC Shipment Type"; Rec."AMC Shipment Type")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
        }
        moveafter("No."; "Posting Date")

        modify("Assigned User ID")
        {
            Visible = false;
        }
    }

}