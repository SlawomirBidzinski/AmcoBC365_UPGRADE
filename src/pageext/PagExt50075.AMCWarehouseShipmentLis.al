pageextension 50075 "AMC Warehouse Shipment List" extends "Warehouse Shipment List"
{
    layout
    {
        moveafter("Location Code"; "Status")
        addafter("Status")
        {
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC Shipment Type"; Rec."AMC Shipment Type")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Code"; Rec."AMC Customer Code")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Name"; Rec."AMC Customer Name")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Address"; Rec."AMC Customer Address")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Post Code"; Rec."AMC Customer Post Code")
            {
                ApplicationArea = All;
            }
            field("AMC Customer City"; Rec."AMC Customer City")
            {
                ApplicationArea = All;
            }
            field("AMC Create by User ID"; Rec."AMC Create by User ID")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }

        modify("Assignment Date")
        {
            Visible = false;
        }
    }
}
