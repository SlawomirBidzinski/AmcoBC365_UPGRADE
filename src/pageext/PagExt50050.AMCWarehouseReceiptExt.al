pageextension 50050 "AMC Warehouse Receipt Ext" extends "Warehouse Receipt"
{
    layout
    {
        addafter("No.")
        {
            field("AMC  Receipt Type"; Rec."AMC  Receipt Type")
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
        addlast(General)
        {

            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }

            field("AMC Document ID"; Rec."AMC Document ID")
            {
                ApplicationArea = All;
            }
            field("AMC PW Transaction"; Rec."AMC PW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC Receipt Date"; Rec."AMC Receipt Date")
            {
                ApplicationArea = All;
            }
            field("AMC Notes"; Rec."AMC Notes")
            {
                ApplicationArea = All;
            }

        }
    }
}
