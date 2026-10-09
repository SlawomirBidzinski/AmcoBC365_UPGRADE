pageextension 50052 "AMC Purchase Order Ext" extends "Purchase Order"
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
                    Rec.LookupITINosTemplateCode(Enum::"Purchase Document Type"::Order);
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Purchase Document Type"::Order);
                end;
            }
            field("AMC PW Transaction"; Rec."AMC PW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC Contract Date"; Rec."AMC Contract Date")
            {
                ApplicationArea = All;
            }
        }
        addafter(Control3)
        {
            part(AMCItemFactbox; "AMC Item Statistics FactBox")
            {
                ApplicationArea = Suite;
                Provider = PurchLines;
                Caption = 'Item Statistics';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Line No." = field("Line No.");
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
        modify(Status)
        {
            Importance = Standard;
        }
        modify("Payment Method Code")
        {
            Importance = Standard;
        }
        modify("Payment Terms Code")
        {
            Importance = Standard;
        }
        modify("Due Date")
        {
            Importance = Standard;
        }
        modify("Vendor Invoice No.")
        {
            Importance = Standard;
        }
        modify("ITI VAT Registration No.")
        {
            Importance = Standard;
            Visible = false;
        }
        modify("Buy-from Vendor No.")
        {
            Importance = Standard;
        }
    }

    actions
    {
        addafter("Create &Whse. Receipt")
        {
            action(AMCPostedWhseDoc)
            {
                ApplicationArea = All;
                Caption = 'Posted Whse. Receipt';
                Image = PostedReceipt;
                RunObject = page "Posted Whse. Receipt Lines";
                RunPageLink = "Source Document" = const("Purchase Order"), "Source No." = field("No.");
            }
        }
    }
}
