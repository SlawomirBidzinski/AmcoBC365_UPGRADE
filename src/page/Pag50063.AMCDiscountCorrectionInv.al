page 50154 "AMC Discount Correction Inv."
{
    ApplicationArea = All;
    Caption = 'Discount Correction Inv.';
    PageType = Card;
    SourceTable = "Sales Header";
    SourceTableView = sorting("No.", "Document Type") where("Document Type" = filter("Credit Memo"),
                            "AMC Discount Corr. Invoice" = const(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies a unique number that identifies the sales order. The number can be generated automatically from a number series, or you can number each of them manually.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the name of the customer that you’re selling to. By default, the same customer is suggested as the ship-to customer. If needed, you can specify a different ship-to customer on the document.';
                }
                field("AMC Customer Serach Name"; Rec."AMC Customer Serach Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Szukana Nabywcy field.';
                }
                field("Sell-to Customer Name"; Rec."Sell-to Customer Name")
                {
                    ToolTip = 'Specifies the name of the customer that you’re selling to. By default, the same customer is suggested as the ship-to customer. If needed, you can specify a different ship-to customer on the document.';
                }
                field("Sell-to Address"; Rec."Sell-to Address")
                {
                    ToolTip = 'Specifies the address where the customer is located.';
                }
                field("Sell-to Address 2"; Rec."Sell-to Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field("Sell-to Post Code"; Rec."Sell-to Post Code")
                {
                    ToolTip = 'Specifies the postal code of the customer''s main address.';
                }
                field("Sell-to City"; Rec."Sell-to City")
                {
                    ToolTip = 'Specifies the city of the customer on the sales document.';
                }
                field("Sell-to Contact"; Rec."Sell-to Contact")
                {
                    ToolTip = 'Specifies the name of the contact person at the customer''s main address.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ToolTip = 'Specifies the customer''s VAT registration number for customers.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ToolTip = 'Specifies a document number that refers to the customer''s or vendor''s numbering system.';
                }
                field(InvoiceRebateBase; InvoiceRebateBase)
                {
                    ApplicationArea = all;
                    Caption = 'Rebate Base';
                }
                field(InvoiceTotal; InvoiceTotal)
                {
                    ApplicationArea = all;
                    Caption = 'Invoice Total';
                }
                field(DiscountTotal; DiscountTotal)
                {
                    ApplicationArea = all;
                    Caption = 'Discount Total';
                }
                field("AMC Notes"; Rec."AMC Notes")
                {
                    ToolTip = 'Specifies the value of the Uwagi field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the date when the related document was created.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the date the order was created. The order date is also used to determine the prices and discounts on the document.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the date when the posting of the sales document will be recorded.';
                }
                field("ITI VAT Settlement Date"; Rec."ITI VAT Settlement Date")
                {
                    ToolTip = 'Specifies the value of the VAT Settlement Date field.';
                }
                field("ITI Postponed VAT"; Rec."ITI Postponed VAT")
                {
                    ToolTip = 'Specifies the value of the Postponed VAT field.';
                }
                field("Payment Method Code"; Rec."Payment Method Code")
                {
                    ToolTip = 'Specifies how to make payment, such as with bank transfer, cash, or check.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ToolTip = 'Specifies a formula that calculates the payment due date, payment discount date, and payment discount amount.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies when the sales invoice must be paid.';
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the sum of amounts on all the lines in the document. This will include invoice discounts.';
                }
                field("Amount Including VAT"; Rec."Amount Including VAT")
                {
                    ToolTip = 'Specifies the sum of amounts, including VAT, on all the lines in the document. This will include invoice discounts.';
                }
                field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
                {
                    ToolTip = 'Specifies the value of the Utworzone przez field.';
                }
                field("AMC Creation Date"; Rec."AMC Creation Date")
                {
                    ToolTip = 'Specifies the value of the Data Utworzenia field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies whether the document is open, waiting to be approved, has been invoiced for prepayment, or has been released to the next stage of processing.';
                }
                field(Correction; Rec.Correction)
                {
                    ToolTip = 'Specifies the entry as a corrective entry. You can use the field if you need to post a corrective entry to a customer account. If you place a check mark in this field when posting a corrective entry, the system will post a negative debit instead of a credit or a negative credit instead of a debit. Correction flag does not affect how inventory reconciled with general ledger.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the name of the salesperson who is assigned to the customer.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                }
                field("AMC Discount Period From"; Rec."AMC Discount Period From")
                {
                    ToolTip = 'Specifies the value of the Discount Period From field.';
                }
                field("AMC Discount Period To"; Rec."AMC Discount Period To")
                {
                    ToolTip = 'Specifies the value of the Discount Period To field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the currency of amounts on the sales document.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field("AMC Exchange Rate"; Rec."AMC Exchange Rate")
                {
                    ToolTip = 'Specifies the value of the Kurs Średni field.';
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';

                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer that you send or sent the invoice or credit memo to.';
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ToolTip = 'Specifies the number of the contact the invoice will be sent to.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ToolTip = 'Specifies the name of the customer that you send or sent the invoice or credit memo to.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ToolTip = 'Specifies the address of the customer that you will send the invoice to.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ToolTip = 'Specifies the postal code of the customer''s billing address.';
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ToolTip = 'Specifies the city of the customer on the sales document.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ToolTip = 'Specifies the name of the contact person at the customer''s billing address.';
                }
                field("AMC Customer Bank Account Code"; Rec."AMC Customer Bank Account Code")
                {
                    ToolTip = 'Specifies the value of the Customer Bank Account Code field.';
                }
                field("Company Bank Account Code"; Rec."Company Bank Account Code")
                {
                    ToolTip = 'Specifies the bank account to use for bank information when the document is printed.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ToolTip = 'Specifies additional posting information for the document. After you post the document, the description can add detail to vendor and customer ledger entries.';
                }
                field("Payment Discount %"; Rec."Payment Discount %")
                {
                    ToolTip = 'Specifies the payment discount percentage that is granted if the customer pays on or before the date entered in the Pmt. Discount Date field. The discount percentage is specified in the Payment Terms Code field.';
                }
                field("Pmt. Discount Date"; Rec."Pmt. Discount Date")
                {
                    ToolTip = 'Specifies the date on which the amount in the entry must be paid for a payment discount to be granted.';
                }
                field("Prices Including VAT"; Rec."Prices Including VAT")
                {
                    ToolTip = 'Specifies if the Unit Price and Line Amount fields on document lines should be shown with or without VAT.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ToolTip = 'Specifies the VAT specification of the involved customer or vendor to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ToolTip = 'Specifies the customer''s market type to link business transactions to.';
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ToolTip = 'Specifies the name of the customer at the address that the items are shipped to.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ToolTip = 'Specifies the address that products on the sales document will be shipped to.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ToolTip = 'Specifies additional address information.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ToolTip = 'Specifies the postal code of the address that the items are shipped to.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ToolTip = 'Specifies the city of the customer on the sales document.';
                }
                field("Shipment Method Code"; Rec."Shipment Method Code")
                {
                    ToolTip = 'Specifies the delivery conditions of the related shipment, such as free on board (FOB).';
                }
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ToolTip = 'Specifies when items on the document are shipped or were shipped. A shipment date is usually calculated from a requested delivery date plus lead time.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the location from where inventory items to the customer on the sales document are to be shipped by default.';
                }
            }
            group(ForeignTrade)
            {
                Caption = 'Foreign Trade';

                field("AMC Currancy Exchange Date"; Rec."AMC Currancy Exchange Date")
                {
                    ToolTip = 'Specifies the value of the Data Kursu Wymiany field.';
                }
                field("AMC Price Currency"; Rec."AMC Price Currency")
                {
                    ToolTip = 'Specifies the value of the Waluta Cennika field.';
                }
                field("ITI VATRegNoOrigCountryCode"; Rec."ITI VATRegNoOrigCountryCode")
                {
                    ToolTip = 'Specifies the code of a country in the European Union where the company was assigned the VAT registration number.';
                }
                field("VAT Country/Region Code"; Rec."VAT Country/Region Code")
                {
                    ToolTip = 'Specifies the value of the VAT Country/Region Code field.';
                }
            }
            part("AMC Discount Corr. Inv. Subp."; "AMC Discount Corr. Inv. Subp.")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No."), "Document Type" = field("Document Type");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        CalculateDiscount();
    end;

    local procedure CalculateDiscount()
    var SalesLine:Record "Sales Line";
    begin
        InvoiceTotal := 0;
        DiscountTotal := 0;
        InvoiceRebateBase := 0;

        SalesLine.RESET();
        SalesLine.SETRANGE("Document Type", Rec."Document Type");
        SalesLine.SETRANGE("Document No.", Rec."No.");
        IF SalesLine.FindSet() THEN
            REPEAT
                InvoiceTotal += SalesLine."AMC Invoice Amount";
                DiscountTotal += SalesLine."Line Amount";
                IF SalesLine."AMC No Use Correction" = FALSE THEN
                    InvoiceRebateBase += SalesLine."AMC Invoice Amount";
            UNTIL SalesLine.NEXT() = 0;
    end;


    var
        InvoiceRebateBase: Decimal;
        DiscountTotal: Decimal;
        InvoiceTotal: Decimal;
}
