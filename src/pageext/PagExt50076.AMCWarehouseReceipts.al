pageextension 50076 "AMC Warehouse Receipts" extends "Warehouse Receipts"
{
    layout
    {
        addafter("Location Code")
        {
            field("AMC  Receipt Type"; Rec."AMC Receipt Type")
            {
                ApplicationArea = All;
            }
            field("AMC FirmType"; Rec."AMC FirmType")
            {
                ApplicationArea = All;
            }
            field("AMC Vendor Code"; Rec."AMC Vendor Code")
            {
                ApplicationArea = All;
            }
            field("AMC Vendor Name"; Rec."AMC Vendor Name")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Search Name"; Rec."AMC Customer Search Name")
            {
                ApplicationArea = All;
            }
            field("AMC Vendor Address"; Rec."AMC Vendor Address")
            {
                ApplicationArea = All;
            }
            field("AMC Vendor post code"; Rec."AMC Vendor post code")
            {
                ApplicationArea = All;
            }
            field("AMC Vendor City"; Rec."AMC Vendor City")
            {
                ApplicationArea = All;
            }

        }
    }
}