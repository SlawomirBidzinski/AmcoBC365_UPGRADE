pageextension 50015 "AMC Purchase Return Order" extends "Purchase Return Order"
{
    layout
    {
        addfirst(General)
        {
            field("ITI Nos. Template Code"; Rec."ITI Nos. Template Code")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    Rec.LookupITINosTemplateCode(Enum::"Purchase Document Type"::"Return Order");
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Purchase Document Type"::"Return Order");
                end;
            }
            field("Posting No. Series"; Rec."Posting No. Series")
            {
                ApplicationArea = All;
            }
        }

        addafter(Status)
        {
            field("AMC Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = All;
            }
            field("AMC VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
            group("AMC Szczegóły Zlecenia")
            {
                Caption = 'Szczegóły Zlecenia';

                field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
                {
                    ApplicationArea = All;
                }

                field("AMC Creation Date"; Rec."AMC Creation Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Purchase Order Status"; Rec."AMC Purchase Order Status")
                {
                    ApplicationArea = All;
                }
                field("AMC Approved Date"; Rec."AMC Approved Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Place of Transport"; Rec."AMC Place of Transport")
                {
                    ApplicationArea = All;
                }

                field("AMC Drop Shipment"; Rec."AMC Drop Shipment")
                {
                    ApplicationArea = All;
                }
            }
            group("AMC Waluta Zamówienia")
            {
                Caption = 'Waluta Zamówienia';
                field("AMC Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Currency Exchange Date"; Rec."AMC Currency Exchange Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Exchange Rate"; Rec."AMC Exchange Rate")
                {
                    ApplicationArea = All;
                }
            }
        }


        modify("Posting Date")
        {
            Visible = true;
            Importance = Standard;

        }
        modify("ITI VAT Settlement Date")
        {
            Visible = true;
            Importance = Standard;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
    }
}
