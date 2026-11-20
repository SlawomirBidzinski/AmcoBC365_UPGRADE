pageextension 50048 "AMC Posted Whse. Receipt Ext" extends "Posted Whse. Receipt"
{
    layout
    {

        addafter("No.")
        {
            field("AMC Receipt Type"; Rec."AMC Receipt Type")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC FirmType"; Rec."AMC FirmType")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Vendor Code"; Rec."AMC Vendor Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Vendor Name"; Rec."AMC Vendor Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Customer Search Name"; Rec."AMC Customer Search Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Vendor Address"; Rec."AMC Vendor Address")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Vendor City"; Rec."AMC Vendor City")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Vendor post code"; Rec."AMC Vendor post code")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addlast(General)
        {
            field("AMC Document ID"; Rec."AMC Document ID")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC PW Transaction"; Rec."AMC PW Transaction")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Receipt Date"; Rec."AMC Receipt Date")
            {
                ApplicationArea = All;
                Editable = false;
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

        modify("Assignment Time")
        {
            Visible = false;
        }

        addafter("AMC Receipt Date")
        {
            group(AMCReceipt)
            {
                Caption = 'Receipt';

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
        addafter(General)
        {
            group(Notes)
            {
                Caption = 'Notes';
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
}
