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
        addafter("Shipment Date")
        {
            //           field("AMC Create by User ID"; Rec."AMC Create by User ID")
            //            {
            //               ApplicationArea = All;
            //            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
            //            field("AMC Ship-to Code"; Rec."AMC Ship-to Code")
            //            {
            //                ApplicationArea = All;
            //            }
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
