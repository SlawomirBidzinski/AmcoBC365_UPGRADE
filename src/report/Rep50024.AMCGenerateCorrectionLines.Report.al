report 50024 "AMC Generate Correction Lines"
{
    Caption = 'Generate Correction Lines';
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(SetInvoiceNo; SetInvoiceNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Nr faktury korygujacej';
                    }
                    field(SetCustomer; SetCustomer)
                    {
                        ApplicationArea = All;
                        Caption = 'Nr odbiorcy platnosci';
                        TableRelation = Customer;

                        trigger OnValidate()
                        begin
                            IF CustomerRec.GET(SetCustomer) THEN
                                CustomerName := CustomerRec.Name;
                        end;
                    }
                    field(CustomerName; CustomerName)
                    {
                        ApplicationArea = All;
                        Caption = 'Nazwa kontrahenta';
                        Editable = false;
                    }
                    field(SetOrderCustomer; SetOrderCustomer)
                    {
                        ApplicationArea = All;
                        Caption = 'Nr zamawiajacego';
                        TableRelation = Customer;

                        trigger OnValidate()
                        begin
                            IF CustomerRec.GET(SetOrderCustomer) THEN
                                CustomerOrderName := CustomerRec.Name;
                        end;
                    }
                    field(CustomerOrderName; CustomerOrderName)
                    {
                        ApplicationArea = All;
                        Caption = 'Nazwa zamawiajacego';
                        Editable = false;
                    }
                    field(SetDateFrom; SetDateFrom)
                    {
                        ApplicationArea = All;
                        Caption = 'Date From';
                    }
                    field(SetDateTo; SetDateTo)
                    {
                        ApplicationArea = All;
                        Caption = 'Date To';
                    }
                    field(SetitemFilter; SetitemFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Item Filter';
                    }
                    field(SetDiscount; SetDiscount)
                    {
                        ApplicationArea = All;
                        Caption = 'Discount %';
                    }
                    field(EraseBeforeImport; EraseBeforeImport)
                    {
                        ApplicationArea = All;
                        Caption = 'Delete Existing Lines';
                    }
                }
            }
        }
    }

    trigger OnPostReport()
    begin

        IF SetCustomer = '' THEN
            ERROR(Text_001);
        IF SetDiscount = 0 THEN
            ERROR(Text_002);
        IF SetDateFrom > SetDateTo THEN
            ERROR(Text_003);

        IF SetInvoiceNo = '' THEN
            ERROR(Text_005);

        SalesHeader.GET(SalesHeader."Document Type"::"Credit Memo", SetInvoiceNo);
        SetDateFrom := SalesHeader."AMC Discount Period From";
        SetDateTo := SalesHeader."AMC Discount Period To";
        SalesRecevSetup.GET();

        ValueEntry.RESET();
        ValueEntry.SETRANGE("Posting Date", SetDateFrom, SetDateTo);
        ValueEntry.SETRANGE("Source No.", SetCustomer);
        DocTypeFilter := STRSUBSTNO('%1|%2', ValueEntry."Document Type"::"Sales Invoice", ValueEntry."Document Type"::"Sales Credit Memo");
        ValueEntry.SETFILTER("Document Type", DocTypeFilter);
        ValueEntry.SETFILTER("Sales Amount (Actual)", '<>0');
        IF ValueEntry.FINDset() THEN
            REPEAT

                CASE ValueEntry."Document Type" OF
                    ValueEntry."Document Type"::"Sales Credit Memo":
                        BEGIN
                            ImportLine := FALSE;
                            IF SalesCrMemoHead.GET(ValueEntry."Document No.") THEN
                                IF SalesCrMemoHead."AMC Discount Correction Inv." = FALSE THEN
                                    ImportLine := TRUE;

                            IF SetOrderCustomer <> '' THEN BEGIN
                                SalesCrMemoHead.RESET();
                                SalesCrMemoHead.SETRANGE("No.", ValueEntry."Document No.");
                                SalesCrMemoHead.SETRANGE("Sell-to Customer No.", SetOrderCustomer);
                                IF NOT SalesCrMemoHead.FINDFIRST() THEN
                                    ImportLine := FALSE;
                            END;
                        END;
                    ValueEntry."Document Type"::"Sales Invoice":
                        BEGIN
                            ImportLine := FALSE;
                            IF SalesInvoiceHead.GET(ValueEntry."Document No.") THEN
                                IF SalesInvoiceHead."AMC RW Transaction" = FALSE THEN
                                    ImportLine := TRUE;

                            IF SetOrderCustomer <> '' THEN BEGIN
                                SalesInvoiceHead.RESET();
                                SalesInvoiceHead.SETRANGE("No.", ValueEntry."Document No.");
                                SalesInvoiceHead.SETRANGE("Sell-to Customer No.", SetOrderCustomer);
                                IF NOT SalesInvoiceHead.FINDFIRST() THEN
                                    ImportLine := FALSE;
                            END;
                        END;
                END;

                IF ImportLine = TRUE THEN BEGIN
                    IF EraseBeforeImport = FALSE THEN BEGIN
                        SalesLine.RESET();
                        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::"Credit Memo");
                        SalesLine.SETRANGE("Document No.", SetInvoiceNo);
                        IF SalesLine.FINDLAST() THEN
                            LineNo := SalesLine."Line No.";
                    END ELSE BEGIN
                        SalesLine.RESET();
                        SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::"Credit Memo");
                        SalesLine.SETRANGE("Document No.", SetInvoiceNo);
                        SalesLine.DELETEALL();
                        LineNo := 0;
                    END;

                    SalesLine.INIT();
                    SalesLine."Document Type" := SalesLine."Document Type"::"Credit Memo";
                    SalesLine."Document No." := SetInvoiceNo;

                    LineNo := LineNo + 10000;
                    SalesLine."Line No." := LineNo;
                    SalesLine."Sell-to Customer No." := SalesHeader."Sell-to Customer No.";
                    SalesLine.Type := SalesLine.Type::"Charge (Item)";
                    SalesLine.VALIDATE("No.", SalesRecevSetup."AMC Disc. Corr. ItemChargeCode");
                    SalesLine."Location Code" := ValueEntry."Location Code";

                    SalesLine."AMC Item No" := ValueEntry."Item No.";
                    SalesLine."AMC Corrected Invoice No" := ValueEntry."Document No.";
                    SalesLine."AMC Invoice Line No" := ValueEntry."ITI Source Doc. Line No.";
                    SalesLine."AMC Invoice Amount" := ValueEntry."Sales Amount (Actual)";
                    SalesLine."AMC Invoice Discount (%)" := SetDiscount;

                    CASE ValueEntry."Document Type" OF
                        ValueEntry."Document Type"::"Sales Invoice":
                            BEGIN
                                SalesInvoiceLine.RESET();
                                SalesInvoiceLine.SETRANGE("Document No.", ValueEntry."Document No.");
                                SalesInvoiceLine.SETRANGE("Line No.", ValueEntry."Document Line No.");
                                IF SalesInvoiceLine.FINDFIRST() THEN BEGIN
                                    SalesLine.VALIDATE("Unit of Measure Code", SalesInvoiceLine."Unit of Measure Code");
                                    SalesLine.VALIDATE("VAT Bus. Posting Group", SalesInvoiceLine."VAT Bus. Posting Group");
                                    SalesLine.VALIDATE("VAT Prod. Posting Group", SalesInvoiceLine."VAT Prod. Posting Group");
                                    SalesLine.Description := SalesInvoiceLine.Description;

                                    SalesLine.VALIDATE(Quantity, -ValueEntry."Valued Quantity");
                                    SalesLine.VALIDATE("Unit Price", -(ValueEntry."Sales Amount (Actual)" *
                                      SetDiscount / (100 * ValueEntry."Valued Quantity")));
                                END;
                            END;
                        ValueEntry."Document Type"::"Sales Credit Memo":
                            BEGIN
                                SalesCrMemoLine.RESET();
                                SalesCrMemoLine.SETRANGE("Document No.", ValueEntry."Document No.");
                                SalesCrMemoLine.SETRANGE("Line No.", ValueEntry."Document Line No.");
                                IF SalesCrMemoLine.FINDFIRST() THEN BEGIN
                                    SalesLine.VALIDATE("Unit of Measure Code", SalesCrMemoLine."Unit of Measure Code");
                                    SalesLine.VALIDATE("VAT Bus. Posting Group", SalesCrMemoLine."VAT Bus. Posting Group");
                                    SalesLine.VALIDATE("VAT Prod. Posting Group", SalesCrMemoLine."VAT Prod. Posting Group");
                                    IF ItemRec.GET(SalesLine."AMC Item No") THEN
                                        SalesLine.Description := ItemRec.Description;
                                    SalesLine.VALIDATE(Quantity, ValueEntry."Valued Quantity");
                                    SalesLine.VALIDATE("Unit Price", ValueEntry."Sales Amount (Actual)" *
                                      SetDiscount / (100 * ValueEntry."Valued Quantity"));
                                END;
                            END;
                    END;

                    SalesLine.INSERT();

                    CustLedgerEntry.RESET();
                    CustLedgerEntry.SETRANGE("Customer No.", SalesLine."Sell-to Customer No.");
                    CustLedgerEntry.SETRANGE("Document No.", SalesLine."AMC Corrected Invoice No");
                    CustLedgerEntry.SETRANGE("Date Filter", 0D, SalesHeader."Document Date");
                    IF CustLedgerEntry.FINDFIRST() THEN BEGIN

                        SalesLine."AMC Invoice Due Date" := CustLedgerEntry."Due Date";

                        CustLedgerEntry.CALCFIELDS("Remaining Amount", CustLedgerEntry."Remaining Amt. (LCY)");
                        SalesLine."AMC Actual Remaining Amount" := CustLedgerEntry."Remaining Amt. (LCY)";

                        IF CustLedgerEntry."Remaining Amount" = 0 THEN BEGIN
                            InvoicePaymentDate := 0D;
                            DetailedCustLedgEntry.RESET();
                            DetailedCustLedgEntry.SETRANGE("Cust. Ledger Entry No.", CustLedgerEntry."Entry No.");
                            DetailedCustLedgEntry.SETRANGE("Entry Type", DetailedCustLedgEntry."Entry Type"::Application);
                            IF DetailedCustLedgEntry.FINDset() THEN
                                REPEAT
                                    IF InvoicePaymentDate < DetailedCustLedgEntry."Posting Date" THEN
                                        InvoicePaymentDate := DetailedCustLedgEntry."Posting Date";
                                UNTIL DetailedCustLedgEntry.NEXT() = 0;

                            SalesLine."AMC Invoice Payment" := InvoicePaymentDate;
                            QtyDays := SalesLine."AMC Invoice Payment" - SalesLine."AMC Invoice Due Date";
                            IF QtyDays > 2 THEN
                                CASE ValueEntry."Document Type" OF
                                    ValueEntry."Document Type"::"Sales Invoice":
                                        SalesLine.VALIDATE("AMC No Use Correction", TRUE);
                                END;

                        END ELSE
                            CASE ValueEntry."Document Type" OF
                                ValueEntry."Document Type"::"Sales Invoice":
                                    SalesLine.VALIDATE("AMC No Use Correction", TRUE);
                            END;


                    END;
                    ItemChargeAssign.INIT();
                    ItemChargeAssign."Document Type" := ItemChargeAssign."Document Type"::"Credit Memo";
                    ItemChargeAssign."Document No." := SalesLine."Document No.";
                    ItemChargeAssign."Document Line No." := SalesLine."Line No.";
                    ItemChargeAssign."Item Charge No." := SalesLine."No.";
                    ItemChargeAssign."Item No." := SalesLine."AMC Item No";
                    IF ItemLedgerEntry.GET(ValueEntry."Item Ledger Entry No.") THEN BEGIN
                        ItemChargeAssign."Qty. to Assign" := SalesLine.Quantity;
                        ItemChargeAssign."Amount to Assign" := SalesLine."Line Amount";
                        ItemChargeAssign."Unit Cost" := ItemLedgerEntry."Cost Amount (Expected)" + ItemLedgerEntry."Cost Amount (Actual)";
                        CASE ItemLedgerEntry."Document Type" OF
                            ItemLedgerEntry."Document Type"::"Sales Shipment":
                                ItemChargeAssign."Applies-to Doc. Type" := ItemChargeAssign."Applies-to Doc. Type"::Shipment;

                            ItemLedgerEntry."Document Type"::"Sales Return Receipt":
                                ItemChargeAssign."Applies-to Doc. Type" := ItemChargeAssign."Applies-to Doc. Type"::"Return Receipt";
                        END;
                        ItemChargeAssign."Applies-to Doc. No." := ItemLedgerEntry."Document No.";
                        ItemChargeAssign."Applies-to Doc. Line No." := ItemLedgerEntry."Document Line No.";
                        ItemChargeAssign.INSERT();
                    END;
                    IF SalesLine."Line Amount" <> 0 THEN
                        SalesLine.VALIDATE("Line Amount");
                    SalesLine.MODIFY();
                END;
            UNTIL ValueEntry.NEXT() = 0;
    end;

    procedure SetInit(InvoiceNo: Code[20]; CustomerNo: Code[20])
    begin
        SetCustomer := CustomerNo;
        SetInvoiceNo := InvoiceNo;
        IF CustomerRec.GET(SetCustomer) THEN BEGIN
            CustomerName := CustomerRec.Name;
            SetDiscount := CustomerRec."AMC Period Discount [%]";
        END;
    end;

    var
        SetCustomer: Code[20];
        SetOrderCustomer: Code[20];
        CustomerName: Text[100];
        CustomerOrderName: Text[100];
        SetInvoiceNo: Code[20];
        SetDateFrom: Date;
        SetDateTo: Date;
        SetitemFilter: Text[200];
        SetDiscount: Decimal;
        DocTypeFilter: Text[50];
        LineNo: Integer;
        EraseBeforeImport: Boolean;
        SalesRecevSetup: Record "Sales & Receivables Setup";
        SalesInvoiceHead: Record "Sales Invoice Header";
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        CustomerRec: Record Customer;
        ValueEntry: Record "Value Entry";
        CustLedgerEntry: Record "Cust. Ledger Entry";
        DetailedCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        SalesInvoiceLine: Record "Sales Invoice Line";
        SalesCrMemoHead: Record "Sales Cr.Memo Header";
        SalesCrMemoLine: Record "Sales Cr.Memo Line";
        ItemChargeAssign: Record "Item Charge Assignment (Sales)";
        ItemLedgerEntry: Record "Item Ledger Entry";
        ItemRec: Record Item;
        ImportLine: Boolean;
        InvoicePaymentDate: Date;
        QtyDays: Integer;
        Text_001: Label 'Kod Odbiorcy Płatności musi być wypełniony';
        Text_002: Label 'Wartość Rabatu (%) musi być wypełniona';
        Text_003: Label '"Data od" nie może być póŸniejsza od "Daty do"';
        Text_004: Label '%1|%2';
        Text_005: Label 'Nie wprowadzono numeru faktury zbiorczej';
}
