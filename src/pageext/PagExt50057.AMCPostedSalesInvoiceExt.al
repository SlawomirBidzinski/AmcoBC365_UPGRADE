pageextension 50057 "AMC Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("AMC RW Transaction Type"; Rec."AMC RW Transaction Type")
            {
                Importance = Additional;
                ApplicationArea = All;
            }
            field("AMC RW Fully Invoiced"; Rec."AMC RW Fully Invoiced")
            {
                ApplicationArea = All;
            }
            field("AMC AmcoWeb Order"; Rec."AMC AmcoWeb Order")
            {
                ApplicationArea = All;
            }
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }
            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
            field("AMC RW for CRP"; Rec."AMC RW for CRP")
            {
                ApplicationArea = All;
            }
            field("AMC RW Transaction"; Rec."AMC RW Transaction")
            {
                ApplicationArea = All;
            }
            field("AMC EDI Customer"; Rec."AMC EDI Customer")
            {
                ApplicationArea = All;
            }
            field("AMC EDI Order Status"; Rec."AMC EDI Order Status")
            {
                ApplicationArea = All;
            }
            field("AMC Invoice per Pieces"; Rec."AMC Invoice per Pieces")
            {
                ApplicationArea = All;
            }
            field("AMC Customs Invoice"; Rec."AMC Customs Invoice")
            {
                ApplicationArea = All;
            }
            field("AMC Drop Shipment"; Rec."AMC Drop Shipment")
            {
                ApplicationArea = All;
            }
        }
        addafter("Currency Code")
        {
            field("AMC Currancy Exchange Date"; Rec."AMC Currancy Exchange Date")
            {
                ApplicationArea = All;
            }
            field("AMC Exchange Rate"; Rec."AMC Exchange Rate")
            {
                ApplicationArea = All;
            }
        }
        modify("Currency Code")
        {
            Importance = Standard;
        }
        addafter(General)
        {
            group(AMCNotes)
            {
                Caption = 'Notes';
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ApplicationArea = All;
                }
            }
        }
        addafter("Invoice Details")
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
                }
            }
        }
        addlast(content)
        {
            group(AMCPDFDoc)
            {
                Caption = 'PDF Documents';

                grid(AMCPDF)
                {
                    part(AMCInvPDF; "AMC Invoice PDF List")
                    {
                        ApplicationArea = All;
                        SubPageLink = "Document Type" = CONST("Posted Invoice"), "Document No" = FIELD("No.");
                    }
                }
            }
            group(AMCControl)
            {
                Caption = 'Controlling';

                group(AMCProfitCont)
                {
                    ShowCaption = false;
                    field("AMC Check For Low Price"; Rec."AMC Check For Low Price")
                    {
                        ApplicationArea = All;
                    }
                    field("AMC ID Authorise for Low Price"; Rec."AMC ID Authorise for Low Price")
                    {
                        ApplicationArea = All;
                    }
                    field("AMC Customer Serach Name"; Rec."AMC Customer Search Name")
                    {
                        ApplicationArea = All;
                    }
                    part(AMCSalesCommentLines; "AMC Sales Comment Subpage")
                    {
                        ApplicationArea = All;
                        SubPageLink = "Document Type" = CONST(Order), "No." = FIELD("No.");
                    }
                    grid(AMC2ndRow)
                    {
                        field(AMCAmountIncludingVAT; Rec."Amount Including VAT")
                        {
                            ApplicationArea = All;
                        }
                    }
                    grid(AMC3rdRow)
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
                }
            }
        }
        modify("Shipment Date")
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
        modify("ITI VAT Settlement Date")
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
        modify("VAT Registration No.")
        {
            Importance = Standard;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
    }

    actions
    {
        addafter("&Track Package")
        {
            action(AMCCreatePDF)
            {
                ApplicationArea = All;
                Caption = 'Create PDF Document List';

                trigger OnAction()
                var
                    PDFInvoice: Page "AMC Print Invoice to PDF";
                begin
                    CLEAR(PDFInvoice);
                    PDFInvoice.SetInvoiceNo(Rec."No.");
                    PDFInvoice.RUNMODAL();
                end;
            }
        }
    }
}
