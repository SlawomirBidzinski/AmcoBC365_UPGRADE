pageextension 50065 "AMC Posted Purchase Cr. M. Ext" extends "Posted Purchase Credit Memo"
{
    layout
    {
        addlast(General)
        {
            field("AMC Shipment Method Code"; Rec."Shipment Method Code")
            {
                ApplicationArea = All;
            }
            field("AMC Place of Transport"; Rec."AMC Place of Transport")
            {
                ApplicationArea = All;
            }
            field("AMC Currency Code"; Rec."Currency Code")
            {
                ApplicationArea = All;
            }
            field("AMC Currancy Exchange Date"; Rec."AMC Currancy Exchange Date")
            {
                ApplicationArea = All;
            }
            field("AMC Exchange Rate"; Rec."AMC Exchange Rate")
            {
                ApplicationArea = All;
            }
            field("AMC VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("AMC Sell-to Customer No."; Rec."Sell-to Customer No.")
            {
                ApplicationArea = All;
            }
        }
        addafter(General)
        {
            group(AMCNotes)
            {
                Caption = 'Notes';
                field("AMC Purchase Notes"; Rec."AMC Purchase Notes")
                {
                    ApplicationArea = All;
                }
            }
        }
        modify("Currency Code")
        {
            Importance = Standard;
            Visible = false;
        }
        modify("Buy-from Vendor Name")
        {
            Importance = Standard;
        }
        modify("Buy-from Address")
        {
            Importance = Standard;
        }
        modify("Buy-from Address 2")
        {
            Importance = Standard;
        }
        modify("Buy-from Post Code")
        {
            Importance = Standard;
        }
        modify("Buy-from City")
        {
            Importance = Standard;
        }
        modify("Buy-from Country/Region Code")
        {
            Importance = Standard;
        }
        modify("ITI VAT Registration No.")
        {
            Importance = Standard;
            Visible = false;
        }
    }
}
