pageextension 50035 "AMC Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("AMC Customer Serach Name"; Rec."AMC Customer Serach Name")
            {
                ApplicationArea = All;
            }
            field("AMC Price Currency"; Rec."AMC Price Currency")
            {
                ApplicationArea = All;
            }
            field("AMC Price Exch. Date"; Rec."AMC Price Exch. Date")
            {
                ApplicationArea = All;
            }
            field("AMC Price Exch. Rate"; Rec."AMC Price Exch. Rate")
            {
                ApplicationArea = All;
            }
            field("AMC Notes"; Rec."AMC Notes")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }
            field("AMC Invoice Type"; Rec."AMC Invoice Type")
            {
                ApplicationArea = All;
            }
            field("AMC Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
            field("AMC Reverse Charge Inv"; Rec."AMC Reverse Charge Inv")
            {
                ApplicationArea = All;
            }
            field("AMC Prepayment"; Rec."AMC Prepayment")
            {
                ApplicationArea = All;
            }
            field("AMC Customs Invoice"; Rec."AMC Customs Invoice")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Price Group"; Rec."Customer Price Group")
            {
                ApplicationArea = All;
            }
        }
        addlast("Invoice Details")
        {
            field("AMC ID Authorise for Low Price"; Rec."AMC ID Authorise for Low Price")
            {
                ApplicationArea = All;
            }
            field("AMC Check For Low Price"; Rec."AMC Check For Low Price")
            {
                ApplicationArea = All;
            }
            field("AMC Place of Transport"; Rec."AMC Place of Transport")
            {
                ApplicationArea = All;
            }
        }
        addlast(content)
        {
            group(AMCDelivery)
            {
                Caption = 'Delivery';

                field("AMC Delivery Conditions [hrs]"; Rec."AMC Delivery Conditions [hrs]")
                {
                    ApplicationArea = All;
                }
                field("AMC Delivery Date"; Rec."AMC Delivery Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
