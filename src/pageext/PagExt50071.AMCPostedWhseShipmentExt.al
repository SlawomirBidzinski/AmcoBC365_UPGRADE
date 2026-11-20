pageextension 50071 "AMC Posted Whse. Shipment Ext" extends "Posted Whse. Shipment"
{
    layout
    {
        addafter("No.")
        {
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Shipment Type"; Rec."AMC Shipment Type")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Customer Code"; Rec."AMC Customer Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Customer Name"; Rec."AMC Customer Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Customer Address"; Rec."AMC Customer Address")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Customer Post Code"; Rec."AMC Customer Post Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Customer City"; Rec."AMC Customer City")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

        addafter("Posting Date")
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

        addafter("Shipment Date")
        {
            field("AMC Ship-to Name"; Rec."AMC Ship-to Name")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Ship-to Address"; Rec."AMC Ship-to Adress")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Ship-to Post Code"; Rec."AMC Ship-to Post Code")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("AMC Ship-to City"; Rec."AMC Ship-to City")
            {
                ApplicationArea = All;
                Editable = false;
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
