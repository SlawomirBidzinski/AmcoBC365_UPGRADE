pageextension 50044 "AMC Sales Order Archive" extends "Sales Order Archive"
{
    layout
    {
        addbefore("No.")
        {
            field("ITI Nos. Template Code"; Rec."ITI Nos. Template Code")
            {
                ApplicationArea = All;
            }
        }
        modify("Sell-to Contact")
        {
            Importance = Additional;
        }
        modify("Promised Delivery Date")
        {
            ApplicationArea = All;
            Importance = Standard;
            Visible = True;
        }
        addafter("Promised Delivery Date")
        {
            field("AMC Delivery Date"; Rec."AMC Delivery Date")
            {
                ApplicationArea = All;
            }

            field("AMC RW Fully Invoiced"; Rec."AMC RW Fully Invoiced")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction Type"; Rec."AMC RW Transaction Type")
            {
                ApplicationArea = All;
            }
        }
        addlast(General)
        {

            field("AMC Shipment No"; Rec."AMC Shipment No")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Posted Shipment No"; Rec."AMC Posted Shipment No")
            {
                ApplicationArea = All;
                Editable = False;
            }
            group("AMC EDI")
            {
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
            }
        }

        addafter(General)
        {
            group(AMCPriceCurr)
            {
                Caption = 'Waluta cennika - grupa';
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
                    DecimalPlaces = 4 : 4;
                }
            }
        }
        addafter(AMCPriceCurr)
        {
            group(AMCNotes)
            {
                Caption = 'Notes';
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ApplicationArea = All;
                }
                field("AMC Remarks from Shipment"; Rec."AMC Remarks from Shipment")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCLowPriceControl)
            {
                Caption = 'Low Price Controlling';

                group(AMCProfitCont)
                {
                    ShowCaption = false;
                }
                group("AMC Kontrola Niskiej Ceny")
                {
                    field("AMC Check For Low Price"; Rec."AMC Check For Low Price")
                    {
                        ApplicationArea = All;
                    }
                    field("AMC ID Authorise for Low Price"; Rec."AMC ID Authorise for Low Price")
                    {
                        ApplicationArea = All;
                    }

                    part(AMCProfitItemContr; "AMC Item Led. Profit Con. Sub.")
                    {
                        ApplicationArea = All;
                        Caption = 'Profit Control.';
                        SubPageLink = "Sales Order No." = FIELD("No.");
                    }
                }
            }

            group(AMCPaymentControl)
            {
                Caption = 'Payment Controlling';
                group("AMC Kontrola Płatności")
                {
                    field(AMCAmountIncludingVAT; Rec."Amount Including VAT")
                    {
                        ApplicationArea = All;
                    }
                    group("AMC Autoryzacja Płatności")
                    {
                        field("AMC Authorise for Limit"; Rec."AMC Authorise for Limit")
                        {
                            ApplicationArea = All;
                        }
                        field("AMC Authorise UserID"; Rec."AMC Authorise UserID")
                        {
                            ApplicationArea = All;
                        }
                        field("AMC Authorise Date"; Rec."AMC Authorise Date")
                        {
                            ApplicationArea = All;
                        }
                    }

                    part(AMCPayAutorContr; "AMC Pay. Autor. Contr. Subpage")
                    {
                        ApplicationArea = All;
                        Caption = 'Payment Control.';
                        SubPageLink = "Document No." = field("No."), "Document Type" = field("Document Type");
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
        modify("Requested Delivery Date")
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
            Importance = Additional;
        }
        modify("Sell-to City")
        {
            Importance = Standard;
        }
        modify("Sell-to Post Code")
        {
            Importance = Standard;
        }
        modify("VAT Reporting Date")
        {
            Importance = Standard;
        }
        modify("Sell-to Country/Region Code")
        {
            Importance = Standard;
        }
        modify("Campaign No.")
        {
            Visible = False;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }
}
