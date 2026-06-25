pageextension 50022 "AMC Customer Card" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("AMC MOS Customer Code"; Rec."AMC MOS Customer Code")
            {
                ApplicationArea = All;
                Visible = False;
            }
            field("AMC Invoice per Pieces"; Rec."AMC Invoice per Pieces")
            {
                ApplicationArea = All;
            }
            field("AMC Balance Due (LCY)"; Rec."Balance Due (LCY)")
            {
                ApplicationArea = All;
            }
            field(AMCBalanceAsVendor; BalanceAsVendor)
            {
                Caption = 'Balance as Vendor';
                ApplicationArea = All;

                trigger OnDrillDown()
                var
                    DtldVendLedgEntry: Record 380;
                    VendLedgEntry: Record 25;
                begin
                    DtldVendLedgEntry.SETRANGE("Vendor No.", Vend."No.");
                    Rec.COPYFILTER("Global Dimension 1 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 1");
                    Rec.COPYFILTER("Global Dimension 2 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 2");
                    Rec.COPYFILTER("Currency Filter", DtldVendLedgEntry."Currency Code");
                    VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                end;
            }
            field(AMCBalanceOfVendor; BalanceOfVendor)
            {
                Caption = 'Balance of Vendor';
                ApplicationArea = All;

                trigger OnDrillDown()
                VAR
                    DtldVendLedgEntry: Record 380;
                    VendLedgEntry: Record 25;
                BEGIN
                    DtldVendLedgEntry.SETRANGE("Vendor No.", Vend."No.");
                    Rec.COPYFILTER("Global Dimension 1 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 1");
                    Rec.COPYFILTER("Global Dimension 2 Filter", DtldVendLedgEntry."Initial Entry Global Dim. 2");
                    Rec.COPYFILTER("Currency Filter", DtldVendLedgEntry."Currency Code");
                    VendLedgEntry.DrillDownOnEntries(DtldVendLedgEntry);
                END;
            }
            field("AMC EDI Customer"; Rec."AMC EDI Customer")
            {
                ApplicationArea = All;
            }
            field("AMC EDI Transaction Type"; Rec."AMC EDI Transaction Type")
            {
                ApplicationArea = All;
            }
            field("AMC EDI Code By Buyer"; Rec."AMC EDI Code By Buyer")
            {
                ApplicationArea = All;
            }
            field("AMC Customer RF Limit"; Rec."AMC Customer RF Limit")
            {
                ApplicationArea = All;
            }
            field("AMC Customer RF Limit Used"; Rec."AMC Customer RF Limit Used")
            {
                ApplicationArea = All;
            }
            field("AMC Customer RF"; Rec."AMC Customer RF")
            {
                ApplicationArea = All;
            }
            group(AMCCustomerGroup)
            {
                Caption = 'Customer Grouping';

                field("AMC Customer Group Code"; Rec."AMC Customer Group Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Customer Group name"; Rec."AMC Customer Group name")
                {
                    ApplicationArea = All;
                }
                field("AMC Customer Type"; Rec."AMC Customer Type")
                {
                    ApplicationArea = All;
                }
                field("AMC Customer Industry Key"; Rec."AMC Customer Industry Key")
                {
                    ApplicationArea = All;
                }
                field("AMC Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = All;
                }
                field("AMC Territory Code"; Rec."Territory Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Print Discount on Invoice"; Rec."AMC Print Discount on Invoice")
                {
                    ApplicationArea = All;
                }
            }
        }
        addlast("Address & Contact")
        {
            group(AMCEmergencyContact)
            {
                Caption = 'Emergency Contact';
                field("AMC Emergency Name 1"; Rec."AMC Emergency Name 1")
                {
                    ApplicationArea = All;
                }
                field("AMC Emergency Phone 1"; Rec."AMC Emergency Phone 1")
                {
                    ApplicationArea = All;
                }
                field("AMC Emergency  Email"; Rec."AMC Emergency  Email 1")
                {
                    ApplicationArea = All;
                }
                field("AMC Emergency Name 2"; Rec."AMC Emergency Name 2")
                {
                    ApplicationArea = All;
                }
                field("AMC Emergency Phone 2"; Rec."AMC Emergency Phone 2")
                {
                    ApplicationArea = All;
                }
                field("AMC Emergency  Email 2"; Rec."AMC Emergency Email 2")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCContactVind)
            {
                Caption = 'Contact and Vindication';

                field("AMC Imię i Nazwisko Windykacja"; Rec."AMC Imię i Nazwisko Windykacja")
                {
                    ApplicationArea = All;
                }
                field("AMC Telefon Windykacja"; Rec."AMC Telefon Windykacja")
                {
                    ApplicationArea = All;
                }
                field("AMC Adres E-mail Windykacji"; Rec."AMC Adres E-mail Windykacji")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCSentMail)
            {
                Caption = 'Sent Correspondence';
                field("AMC Electronic Form Inv. Agr."; Rec."AMC Electronic Form Inv. Agr.")
                {
                    ApplicationArea = All;
                }
                field("AMC Qty E-mail Sent"; Rec."AMC Qty E-mail Sent")
                {
                    ApplicationArea = All;
                }
                field("AMC Invoice e-mail Address"; Rec."AMC Invoice e-mail Address")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCEISDataExport)
            {
                Caption = 'EIS Data Export';

                field("AMC Customer Type1"; Rec."AMC Customer Type")
                {
                    ApplicationArea = All;
                }
                field("AMC Customer Industry Key1"; Rec."AMC Customer Industry Key")
                {
                    ApplicationArea = All;
                }
                field("AMC Customer Segment Key"; Rec."AMC Customer Segment Key")
                {
                    ApplicationArea = All;
                }
                field("AMC Export Date"; Rec."AMC Export Date")
                {
                    ApplicationArea = All;
                }
                field("AMC Export Time"; Rec."AMC Export Time")
                {
                    ApplicationArea = All;
                }
                field("AMC Set to Export"; Rec."AMC Set to Export")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCRODOInfo)
            {
                Caption = 'RODO Notification';

                field("AMC RODO Customer"; Rec."AMC RODO Customer")
                {
                    ApplicationArea = All;
                }
                field("AMC RODO Email Send"; Rec."AMC RODO Email Send")
                {
                    ApplicationArea = All;
                }
                field("AMC RODO Infor. Date"; Rec."AMC RODO Infor. Date")
                {
                    ApplicationArea = All;
                }
                field("AMC RODO Infor. Time"; Rec."AMC RODO Infor. Time")
                {
                    ApplicationArea = All;
                }
                field("AMC RODO Infor. Send Time"; Rec."AMC RODO Infor. Send Time")
                {
                    ApplicationArea = All;
                }
            }
        }
        addlast(Invoicing)
        {
            group(AMCPeriodicDisc)
            {
                Caption = 'Periodic Discout';

                field("AMC Discount Agreement"; Rec."AMC Discount Agreement")
                {
                    ApplicationArea = All;
                }
                field("AMC Period Discount Type"; Rec."AMC Period Discount Type")
                {
                    ApplicationArea = All;
                }
                field("AMC Period Discount [%]"; Rec."AMC Period Discount [%]")
                {
                    ApplicationArea = All;
                }
                field("AMC Qty of Discount Corr. Inv"; Rec."AMC Qty of Discount Corr. Inv")
                {
                    ApplicationArea = All;
                }
                field("AMC Corr.Invoice No"; Rec."AMC Corr.Invoice No")
                {
                    ApplicationArea = All;
                }
            }
            group(AMCInvPaymentSetup)
            {
                Caption = 'Invoice Payer Setup';

                field("AMC Set Payment Customer"; Rec."AMC Set Payment Customer")
                {
                    ApplicationArea = All;
                }
                field("AMC Payment Customer Code"; Rec."AMC Payment Customer Code")
                {
                    ApplicationArea = All;
                }
                field("AMC Payment Customer Name"; Rec."AMC Payment Customer Name")
                {
                    ApplicationArea = All;
                }
                field(AMCSetDate; SetDate)
                {
                    ApplicationArea = All;
                    Caption = 'Set Date';
                }
            }
        }
        addafter("Currency Code")
        {
            field("AMC Debt Collection Notes"; Rec."AMC Debt Collection Notes")
            {
                ApplicationArea = All;
            }
        }
        addlast(Payments)
        {
            group(AMCCreditLimit)
            {
                Caption = 'Credit Limit Calculation';

                field("AMC Credit Limit (LCY)"; Rec."Credit Limit (LCY)")
                {
                    ApplicationArea = All;
                }
                field("AMC Balance (LCY)"; Rec."Balance (LCY)")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Set Limit Date From"; Rec."AMC Set Limit Date From")
                {
                    ApplicationArea = All;
                }
                field("AMC Calculate Limit Date"; Rec."AMC Calculate Limit Date")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Minimum Limit"; Rec."AMC Minimum Limit")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Minimum Limit Date"; Rec."AMC Minimum Limit Date")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Maksimum Limit"; Rec."AMC Maksimum Limit")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Maximum Limit Date"; Rec."AMC Maximum Limit Date")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Avarage Payment Days"; Rec."AMC Avarage Payment Days")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Set Off Customer Limit"; Rec."AMC Set Off Customer Limit")
                {
                    ApplicationArea = All;
                }
                field("AMC Last Limit Change UserId"; Rec."AMC Last Limit Change UserId")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
                field("AMC Last Limit Change Date"; Rec."AMC Last Limit Change Date")
                {
                    ApplicationArea = All;
                    Editable = FALSe;
                }
            }
        }
        addlast(content)
        {
            group(AMCEDI)
            {
                Caption = 'EDI';
                field("AMC ILN"; Rec."AMC ILN")
                {
                    ApplicationArea = All;
                }
                field("AMC ILN Buyer"; Rec."AMC ILN Buyer")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Customer1"; Rec."AMC EDI Customer")
                {
                    ApplicationArea = All;
                }
                field("AMC EDI Transaction Type1"; Rec."AMC EDI Transaction Type")
                {
                    ApplicationArea = All;
                }
            }
            part(AMCCustSalesPersonRelation; "AMC Cust. Sales. Relations")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Code" = field("No.");
            }
            part(AMCCustDefaultBankAcc; "AMC Cust. Default Bank Acc.")
            {
                ApplicationArea = All;
                SubPageLink = "Customer Code" = field("No.");
            }
            part(AMCCustDelAddr; "AMC Customer Delivery Address")
            {
                ApplicationArea = All;
                SubPageLink = Code = field("No.");
            }
        }
    }
    actions
    {
        addlast("F&unctions")
        {
            action(AMCCalcLimit)
            {
                Caption = 'Calculate Credit Limit';
                Image = CreditCard;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    LimitCalculate();
                end;
            }
            action(AMCSendRODO)
            {
                Caption = 'Send RODO Information';
                Image = SendApprovalRequest;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rodo_Info_Send();
                end;
            }
        }
    }

    local procedure LimitCalculate()
    var
        CustomerLedgerEntry: Record "Cust. Ledger Entry";
        DetCustLedgEntry: Record "Detailed Cust. Ledg. Entry";
        MimimumLimit: Decimal;
        MaksymumLimit: Decimal;
        Saldo: Decimal;
        QtyPayments: Decimal;
        NoDays: Integer;
        MinimumDate: Date;
        MaximumDate: Date;
    begin
        MimimumLimit := 0;
        MaksymumLimit := 0;
        Saldo := 0;

        CustomerLedgerEntry.RESET();
        CustomerLedgerEntry.SETCURRENTKEY("Customer No.", "Posting Date", "Currency Code");
        CustomerLedgerEntry.SETRANGE("Customer No.", Rec."No.");
        IF CustomerLedgerEntry.FindSet() THEN
            REPEAT
                CustomerLedgerEntry.CALCFIELDS("Amount (LCY)");
                Saldo := Saldo + CustomerLedgerEntry."Amount (LCY)";

                IF (SetDate = 0D) OR (SetDate <= CustomerLedgerEntry."Posting Date") THEN BEGIN

                    IF MimimumLimit = 0 THEN BEGIN
                        MimimumLimit := Saldo;
                        Minimumdate := CustomerLedgerEntry."Posting Date";
                    END;

                    IF Saldo < MimimumLimit THEN BEGIN
                        MimimumLimit := Saldo;
                        Minimumdate := CustomerLedgerEntry."Posting Date";
                    END;

                    IF Saldo > MaksymumLimit THEN BEGIN
                        MaksymumLimit := Saldo;
                        MaximumDate := CustomerLedgerEntry."Posting Date";
                    END;
                END;
            UNTIL CustomerLedgerEntry.NEXT() = 0;

        Rec."AMC Minimum Limit" := MimimumLimit;
        Rec."AMC Maksimum Limit" := MaksymumLimit;
        Rec."AMC Calculate Limit Date" := WORKDATE();
        Rec."AMC Minimum Limit Date" := Minimumdate;
        Rec."AMC Maximum Limit Date" := MaximumDate;
        Rec."AMC Set Limit Date From" := SetDate;
        Rec.MODIFY();

        CustomerLedgerEntry.RESET();
        CustomerLedgerEntry.SETRANGE("Customer No.", Rec."No.");
        CustomerLedgerEntry.SETRANGE("Document Type", CustomerLedgerEntry."Document Type"::Invoice);
        IF CustomerLedgerEntry.FindSet() THEN
            REPEAT
                CustomerLedgerEntry."AMC Invoice Payment Date" := 0D;
                CustomerLedgerEntry."AMC Days for payment" := 0;
                CustomerLedgerEntry.CALCFIELDS("Remaining Amount");
                IF CustomerLedgerEntry."Remaining Amount" = 0 THEN BEGIN
                    DetCustLedgEntry.RESET();
                    DetCustLedgEntry.SETRANGE("Cust. Ledger Entry No.", CustomerLedgerEntry."Entry No.");
                    DetCustLedgEntry.SETRANGE("Entry Type", DetCustLedgEntry."Entry Type"::Application);
                    IF DetCustLedgEntry.FindSet() THEN
                        REPEAT
                            IF CustomerLedgerEntry."AMC Invoice Payment Date" = 0D THEN BEGIN
                                CustomerLedgerEntry."AMC Invoice Payment Date" := DetCustLedgEntry."Posting Date";
                                CustomerLedgerEntry."AMC Days for payment" := DetCustLedgEntry."Posting Date" - CustomerLedgerEntry."Posting Date";
                                CustomerLedgerEntry.MODIFY();
                            END ELSE
                                IF (DetCustLedgEntry."Posting Date" > CustomerLedgerEntry."AMC Invoice Payment Date") THEN BEGIN
                                    CustomerLedgerEntry."AMC Invoice Payment Date" := DetCustLedgEntry."Posting Date";
                                    CustomerLedgerEntry."AMC Days for payment" := DetCustLedgEntry."Posting Date" - CustomerLedgerEntry."Posting Date";
                                    CustomerLedgerEntry.MODIFY();
                                END;
                        UNTIL DetCustLedgEntry.NEXT() = 0;
                END;
            UNTIL CustomerLedgerEntry.NEXT() = 0;

        QtyPayments := 0;
        NoDays := 0;

        CustomerLedgerEntry.RESET();
        CustomerLedgerEntry.SETRANGE("Customer No.", Rec."No.");
        CustomerLedgerEntry.SETRANGE("Document Type", CustomerLedgerEntry."Document Type"::Invoice);
        IF SetDate <> 0D THEN
            CustomerLedgerEntry.SetFilter("Posting Date", '%1..', SetDate);

        IF CustomerLedgerEntry.FindSet() THEN
            REPEAT
                IF CustomerLedgerEntry."AMC Invoice Payment Date" <> 0D THEN BEGIN
                    QtyPayments := QtyPayments + 1;
                    NoDays := NoDays + CustomerLedgerEntry."AMC Days for payment";
                END;
            UNTIL CustomerLedgerEntry.NEXT() = 0;

        IF QtyPayments <> 0 THEN
            Rec."AMC Avarage Payment Days" := ROUND(NoDays / QtyPayments, 0.01)
        ELSE
            Rec."AMC Avarage Payment Days" := 0;

        Rec.MODIFY();
    end;

    local procedure Rodo_Info_Send()
    var
        Email: Codeunit Email;
        EmailMsg: Codeunit "Email Message";
        Question: Text;
        EmailSubject: Label 'RODO';
        EmailBody: Label 'RODO Sent';
    begin
        IF Rec."AMC RODO Customer" = FALSE THEN
            ERROR(Text004, Rec."No.");

        IF Rec."E-Mail" = '' THEN
            ERROR(Text005, Rec."No.");

        IF FORMAT(Rec."AMC RODO Infor. Send Time") <> '' THEN BEGIN
            Question := STRSUBSTNO(Text007, Rec."No.", Rec."E-Mail");
            IF CONFIRM(Question, FALSE) THEN BEGIN
                Rec."AMC RODO Infor. Date" := WORKDATE();
                Rec."AMC RODO Infor. Time" := TIME;
                Rec.MODIFY();
                EmailMsg.Create(Rec."E-Mail", EmailSubject, EmailBody);
                Email.Send(EmailMsg, Enum::"Email Scenario"::Default);
            END;

        END ELSE BEGIN
            Question := STRSUBSTNO(Text006, Rec."No.", Rec."E-Mail");

            IF CONFIRM(Question, FALSE) THEN BEGIN
                Rec."AMC RODO Infor. Date" := WORKDATE();
                Rec."AMC RODO Infor. Time" := TIME;
                Rec.MODIFY();
                EmailMsg.Create(Rec."E-Mail", EmailSubject, EmailBody);
                Email.Send(EmailMsg, Enum::"Email Scenario"::Default);
            END;
        END;
    end;

    var
        Vend: Record Vendor;
        BalanceAsVendor: Decimal;
        BalanceOfVendor: Decimal;
        SetDate: Date;
        //TODO - tlumaczenia
        Text004: Label 'Nabywca %1 nie jest ustawiony do\wysyłania informacji o RODO.';
        Text005: Label 'Nabywca %1 nie ma ustawionego adresu E-mail';
        Text006: Label 'Czy wyslać do nabywcy %1 e-mail\na adres %2 z informacją o RODO?';
        Text007: Label 'Informacja o RODO byla juz wyslana do Nabywcy %1.\ Czy wyslac drugi raz na adres %2?';
}
