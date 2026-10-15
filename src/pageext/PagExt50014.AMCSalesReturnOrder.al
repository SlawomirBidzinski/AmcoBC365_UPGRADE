pageextension 50014 "AMC Sales Return Order" extends "Sales Return Order"
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
                    Rec.LookupITINosTemplateCode(Enum::"Sales Document Type"::"Return Order");
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Sales Document Type"::"Return Order");
                end;
            }
        }
        addafter("No.")
        {
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
                Visible = false;
            }
        }

        modify("Sell-to Contact")
        {
            Importance = Additional;
        }
        addlast(General)
        {
            field("AMC Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = All;
            }
            field("AMC VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
            group("AMC EDI")
            {
                Caption = 'EDI';
                field("AMC EDI Customer"; Rec."AMC EDI Customer")
                {
                    ApplicationArea = All;
                }

                field("AMC EDI Order Status"; Rec."AMC EDI Order Status")
                {
                    ApplicationArea = All;
                }
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
                field("AMC Drop Shipment"; Rec."AMC Drop Shipment")
                {
                    ApplicationArea = All;
                }

                field("AMC Customs Invoice"; Rec."AMC Customs Invoice")
                {
                    ApplicationArea = All;
                }

                field("AMC AmcoWeb Order"; Rec."AMC AmcoWeb Order")
                {
                    ApplicationArea = All;
                }

                field("AMC Invoice per Pieces"; Rec."AMC Invoice per Pieces")
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
                    trigger OnValidate()
                    var

                    begin

                        IF rec."Currency Code" <> '' then
                            rec.Validate("AMC Currency Exchange Date", rec."Posting Date")
                        else
                            rec.Validate("AMC Currency Exchange Date", 0D);
                    end;

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
    }
}