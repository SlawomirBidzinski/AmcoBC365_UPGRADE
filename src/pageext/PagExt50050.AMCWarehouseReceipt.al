pageextension 50050 "AMC Warehouse Receipt Ext" extends "Warehouse Receipt"
{
    layout
    {
        addafter("No.")
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
        addlast(General)
        {
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
        }

        addafter("AMC Receipt Date")
        {
            group(AMCShipment)
            {
                Caption = 'Shipment';

                field("AMC Create by User ID"; Rec."AMC Create by User ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("AMC Creation Date"; Rec."AMC Creation Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
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

        addafter(General)
        {
            group(Notes)
            {
                Caption = 'Notes';
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ApplicationArea = All;

                }
            }
        }
    }
}