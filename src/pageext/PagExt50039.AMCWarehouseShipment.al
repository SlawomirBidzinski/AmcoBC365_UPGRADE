pageextension 50039 "AMC Warehouse Shipment" extends "Warehouse Shipment"
{
    layout
    {
        addafter("No.")
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
        }
        addafter("Shipment Date")
        {
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
            field("AMC Ship-to Code"; Rec."AMC Ship-to Code")
            {
                ApplicationArea = All;
            }
            field("AMC Ship-to Name"; Rec."AMC Ship-to Name")
            {
                ApplicationArea = All;
            }
            field("AMC Ship-to Address"; Rec."AMC Ship-to Adress")
            {
                ApplicationArea = All;
            }
            field("AMC Ship-to Post Code"; Rec."AMC Ship-to Post Code")
            {
                ApplicationArea = All;
            }
            field("AMC Ship-to City"; Rec."AMC Ship-to City")
            {
                ApplicationArea = All;
            }
        }
    }
}
