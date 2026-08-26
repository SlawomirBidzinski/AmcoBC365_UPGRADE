pageextension 50068 "AMC Posted Return Receipt Ext" extends "Posted Return Receipt"
{
    layout
    {
        addlast(General)
        {
            field("AMC Customs Invoice"; Rec."AMC Customs Invoice")
            {
                ApplicationArea = All;
            }
        }
        addlast(content)
        {
            group(AMCControl)
            {
                Caption = 'Controlling';

                group(AMCProfitCont)
                {
                    ShowCaption = false;
                    field("AMC Customer Serach Name"; Rec."AMC Customer Serach Name")
                    {
                        ApplicationArea = All;
                    }
                    part(AMCProfitItemContr; "AMC Item Led. Profit Con. Sub.")
                    {
                        ApplicationArea = All;
                        Caption = 'Profit Control.';
                        SubPageLink = "Sales Order No." = FIELD("No.");
                    }

                    part(AMCSalesCommentLines; "AMC Sales Comment Subpage")
                    {
                        ApplicationArea = All;
                        SubPageLink = "Document Type" = CONST(Order), "No." = FIELD("No.");
                    }
                }
            }
        }
        modify("Sell-to Customer No.")
        {
            Importance = Standard;
        }
        modify("Shipment Date")
        {
            Importance = Standard;
        }
        modify("Salesperson Code")
        {
            Importance = Standard;
        }
        modify("Sell-to Address")
        {
            Importance = Standard;
        }
        modify("Sell-to Address 2")
        {
            Importance = Standard;
        }
        modify("Sell-to City")
        {
            Importance = Standard;
        }
        modify("Sell-to Post Code")
        {
            Importance = Standard;
        }
        modify("Sell-to Country/Region Code")
        {
            Importance = Standard;
        }
        modify("VAT Registration No.")
        {
            Importance = Standard;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }
}
