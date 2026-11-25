page 50013 "AMC Inventory Stage"
{
    ApplicationArea = All;
    Caption = 'Inventory Stage';
    PageType = List;
    SourceTable = "Item Ledger Entry";
    UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(Filters)
            {
                field(ExpFilter; ExpFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Filtr zapasow przeterminowania';

                    trigger OnValidate()
                    begin
                        ExpItemList();
                        CurrPage.Update();
                    end;
                }
                field(ExpDateFilter; ExpDateFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Filtr daty przeterminowania';

                    trigger OnValidate()
                    begin
                        ExpItemList();
                        CurrPage.Update();
                    end;
                }
                field(LocationFilter; LocationFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Kod lokalizacji';

                    trigger OnValidate()
                    begin
                        ExpItemList();
                        CurrPage.Update();
                    end;
                }
                field(CurrQCStatus; CurrQCStatus)
                {
                    ApplicationArea = All;
                    Caption = 'QC Status Filter';

                    trigger OnValidate()
                    begin
                        ExpItemList();
                        CurrPage.Update();
                    end;
                }
                field(NewQCStatus; NewQCStatus)
                {
                    ApplicationArea = All;
                    Caption = 'New QC Status';

                    trigger OnValidate()
                    begin
                        ExpItemList();
                        CurrPage.Update();
                    end;
                }
                field(GlobalSum; GlobalSum)
                {
                    Editable = false;
                    Caption = 'Global Sum';
                    ApplicationArea = All;
                }
            }
            repeater(General)
            {
                Editable = false;
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item in the entry.';
                    StyleExpr = ItemStyleExpr;
                }
                field("AMC Item Description"; Rec."AMC Item Description")
                {
                    ToolTip = 'Specifies the value of the Item Description field.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies which type of transaction that the entry is created from.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number on the entry. The document is the voucher that the entry was based on, for example, a receipt.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the entry''s posting date.';
                }
                field("AMC QC Status"; Rec."AMC QC Status")
                {
                    ToolTip = 'Specifies the value of the QC Status field.';
                    StyleExpr = ItemStyleExpr;
                }
                field("AMC Set Item Control"; Rec."AMC Set Item Control")
                {
                    ToolTip = 'Specifies the value of the Set Item Control field.';
                }
                field("Document Line No."; Rec."Document Line No.")
                {
                    ToolTip = 'Specifies the number of the line on the posted document that corresponds to the item ledger entry.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the entry.';
                }
                field("Return Reason Code"; Rec."Return Reason Code")
                {
                    ToolTip = 'Specifies the code explaining why the item was returned.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies a serial number if the posted item carries such a number.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code for the location that the entry is linked to.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies a lot number if the posted item carries such a number.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ToolTip = 'Specifies the last date that the item on the line can be used.';
                }
                field("AMC Production Date"; Rec."AMC Production Date")
                {
                    ToolTip = 'Specifies the value of the Production Date field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item in the item entry.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ToolTip = 'Specifies the quantity in the Quantity field that remains to be processed.';
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ToolTip = 'Specifies how many units of the item on the line have been reserved.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(UnitLineCost; UnitLineCost)
                {
                    ApplicationArea = All;
                    Caption = 'Unit Line Cost';
                }
                field(RemainLineCost; RemainLineCost)
                {
                    ApplicationArea = All;
                    Caption = 'Remaining Line Cost';
                }
                field("Cost Amount (Actual)"; Rec."Cost Amount (Actual)")
                {
                    ToolTip = 'Specifies the adjusted cost, in LCY, of the quantity posting.';
                    ApplicationArea = All;
                }
                field("Cost Amount (Expected)"; Rec."Cost Amount (Expected)")
                {
                    ToolTip = 'Specifies the expected cost, in LCY, of the quantity posting.';
                    ApplicationArea = All;
                }
                field("AMC Ext. Lot No."; Rec."AMC Ext. Lot No.")
                {
                    ToolTip = 'Specifies the value of the Ext. Lot No. field.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies the quantity per item unit of measure.';
                }
                field("Completely Invoiced"; Rec."Completely Invoiced")
                {
                    ToolTip = 'Specifies if the entry has been fully invoiced or if more posted invoices are expected. Only completely invoiced entries can be revalued.';
                }
                field(Open; Rec.Open)
                {
                    ToolTip = 'Specifies whether the entry has been fully applied to.';
                }
                field("Prod. Order Comp. Line No."; Rec."Prod. Order Comp. Line No.")
                {
                    ToolTip = 'Specifies the line number of the production order component.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ToolTip = 'Specifies the number of the related job.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AMCCalculateSum)
            {
                ApplicationArea = All;
                Caption = 'Kalkuluj Sumy';
                Image = Totals;
                trigger OnAction()
                begin
                    CalculateSum();
                end;
            }
            action(AMCBinContent)
            {
                ApplicationArea = All;
                Caption = 'Bin Content';
                Image = BinContent;
                RunObject = page "Bin Content";
                RunPageLink = "Location Code" = FIELD("Location Code"), "Item No." = FIELD("Item No."), "Lot No. Filter" = FIELD("Lot No.");
            }
        }
    }

    trigger OnOpenPage()
    begin
        ItemLedgerEntry.RESET();
        ItemLedgerEntry.SETCURRENTKEY("Item No.", "Location Code", "Lot No.", "AMC Set Item Control");
        ItemLedgerEntry.SETRANGE("AMC Set Item Control", TRUE);
        IF ItemLedgerEntry.FindSet() THEN
            REPEAT
                ItemLedgerEntry."AMC Set Item Control" := FALSE;
                ItemLedgerEntry.MODIFY();
            UNTIL ItemLedgerEntry.NEXT() = 0;

        UserSetup.RESET();
        UserSetup.SETRANGE("User ID", USERID);
        IF UserSetup.FINDFIRST() THEN BEGIN
            IF (UserSetup."AMC Sales Item Permission" = TRUE) AND (UserSetup."AMC Purchase Items Permission" = FALSE) THEN BEGIN
                Rec.FILTERGROUP(2);
                Rec.SETRANGE("AMC Sales Item", TRUE);
                Rec.FILTERGROUP(0);
            END;

            IF (UserSetup."AMC Sales Item Permission" = FALSE) AND (UserSetup."AMC Purchase Items Permission" = TRUE) THEN BEGIN
                Rec.FILTERGROUP(2);
                Rec.SETRANGE("AMC Purchase Item", TRUE);
                Rec.FILTERGROUP(0);
            END;

            IF (UserSetup."AMC Sales Item Permission" = FALSE) AND (UserSetup."AMC Purchase Items Permission" = FALSE) THEN
                ERROR(Text_002, USERID);
        END ELSE
            ERROR(Text_001, USERID);


        Rec.SETRANGE("Location Code");
        ExpDateFilter := CALCDATE('<+2M>', WORKDATE());
        ExpFilter := FALSE;
    end;

    trigger OnAfterGetRecord()
    begin
        //---AL.21Nov12
        GetQualityStatus();
        //+++AL.21Nov12

        Rec.CALCFIELDS("Cost Amount (Expected)", "Cost Amount (Actual)", "Purchase Amount (Expected)", "Purchase Amount (Actual)");
        IF Rec.Quantity <> 0 THEN BEGIN
            UnitLineCost := (Rec."Cost Amount (Expected)" + Rec."Cost Amount (Actual)") / Rec.Quantity;
            RemainLineCost := ROUND((Rec."Cost Amount (Expected)" + Rec."Cost Amount (Actual)") * Rec."Remaining Quantity" / Rec.Quantity, 0.01);
        END ELSE BEGIN
            UnitLineCost := 0;
            RemainLineCost := 0;
        END;

        KontrahentName := '';
        CASE Rec."Entry Type" OF
            Rec."Entry Type"::Sale:
                IF Cust.GET(Rec."Source No.") THEN
                    KontrahentName := Cust."Search Name";
            Rec."Entry Type"::"Negative Adjmt.":
                IF Cust.GET(Rec."Source No.") THEN
                    KontrahentName := Cust."Search Name";
            Rec."Entry Type"::Purchase:
                IF Vend.GET(Rec."Source No.") THEN
                    KontrahentName := Vend."Search Name";
        END;
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IF (Rec."Expiration Date" > WORKDATE()) AND (ExpDateFilter >= Rec."Expiration Date") THEN
            ItemStyleExpr := 'Attention'
        ELSE
            IF Rec."Expiration Date" <= WORKDATE() THEN
                ItemStyleExpr := 'Favorable'
            ELSE
                ItemStyleExpr := 'Standard';
    end;

    local procedure GetQualityStatus()
    begin
        //--AL.21Nov12
        IF NOT QCStatus.GET(Rec."AMC QC Status") THEN
            CLEAR(QCStatus);
    end;

    local procedure ExpItemList()
    begin
        GlobalSum := 0;

        IF ExpFilter = TRUE THEN BEGIN
            IF ExpDateFilter <> 0D THEN
                Rec.SETRANGE("Expiration Date", 0D, ExpDateFilter)
            ELSE
                ERROR(Text_003);
        END ELSE
            Rec.SETRANGE("Expiration Date");

        IF CurrQCStatus <> '' THEN
            Rec.SETFILTER("AMC QC Status", CurrQCStatus)
        ELSE
            Rec.SETRANGE("AMC QC Status");

        IF LocationFilter <> '' THEN
            Rec.SETRANGE("Location Code", LocationFilter)
        ELSE
            Rec.SETRANGE("Location Code");

        CalculateSum();
    end;

    local procedure CalculateSum()
    begin
        FiltersLine := Rec.GETFILTERS();
        GlobalSum := 0;
        ItemLedgerEntry.COPYFILTERS(Rec);
        IF ItemLedgerEntry.FindSet() THEN
            REPEAT
                ItemLedgerEntry.CALCFIELDS("Cost Amount (Expected)", "Cost Amount (Actual)");
                IF ItemLedgerEntry.Quantity <> 0 THEN
                    GlobalSum := GlobalSum + ROUND((ItemLedgerEntry."Cost Amount (Expected)" +
                                      ItemLedgerEntry."Cost Amount (Actual)") *
                                      ItemLedgerEntry."Remaining Quantity" / ItemLedgerEntry.Quantity, 0.01);
            UNTIL ItemLedgerEntry.NEXT() = 0;
    end;

    local procedure UpdateKJStatus()
    begin
        MakeKJ_Update := FALSE;
        UpdateLineNo := 0;

        IF NewQCStatus = '' THEN
            ERROR(Text_004);

        ItemLedgerEntry.RESET();
        ItemLedgerEntry.SETCURRENTKEY("Item No.", "Location Code", "Lot No.", "AMC Set Item Control");
        ItemLedgerEntry.SETRANGE("AMC Set Item Control", TRUE);

        IF CurrQCStatus <> '' THEN
            ItemLedgerEntry.SETRANGE("AMC QC Status", CurrQCStatus);

        IF LocationFilter <> '' THEN
            ItemLedgerEntry.SETRANGE("Location Code", LocationFilter);

        IF ItemLedgerEntry.FINDFIRST() THEN BEGIN
            LineCount := ItemLedgerEntry.COUNT;
            SetQuestion := STRSUBSTNO(Text_006, LineCount);
            IF CONFIRM(SetQuestion, FALSE) THEN
                MakeKJ_Update := TRUE
            ELSE
                ERROR(Text_008);
        END ELSE
            ERROR(Text_005);

        IF MakeKJ_Update = TRUE THEN BEGIN

            ItemLedgerEntry.RESET();
            ItemLedgerEntry.SETCURRENTKEY("Item No.", "Location Code", "Lot No.", "AMC Set Item Control");
            ItemLedgerEntry.SETRANGE("AMC Set Item Control", TRUE);

            IF CurrQCStatus <> '' THEN
                ItemLedgerEntry.SETRANGE("AMC QC Status", CurrQCStatus);

            IF LocationFilter <> '' THEN
                ItemLedgerEntry.SETRANGE("Location Code", LocationFilter);

            IF ItemLedgerEntry.FindSet() THEN
                REPEAT
                    IF ItemLedgerEntry."AMC QC Status" <> NewQCStatus THEN BEGIN

                        ItemLedgerEntry."AMC QC Status" := NewQCStatus;
                        ItemLedgerEntry.MODIFY();
                        UpdateLineNo := UpdateLineNo + 1;
                    END;

                UNTIL ItemLedgerEntry.NEXT() = 0;
        END;

        MESSAGE(Text_007, UpdateLineNo);
    end;

    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        UserSetup: Record "User Setup";
        QCStatus: Record "AMC QC Status";
        Cust: Record Customer;
        Vend: Record Vendor;
        Navigate: Page Navigate;
        CurrQCStatus: Code[20];
        NewQCStatus: Code[20];
        UnitCost: Decimal;
        KontrahentName: Text[100];
        ExpFilter: Boolean;
        ExpDateFilter: Date;
        LocationFilter: Code[20];
        UnitLineCost: Decimal;
        RemainLineCost: Decimal;
        MakeKJ_Update: Boolean;
        UpdateLineNo: Decimal;
        LineCount: Integer;
        SetQuestion: Text;
        FiltersLine: Text[200];
        ItemStyleExpr: Text[40];
        GlobalSum: Decimal;
        Text_001: Label 'Operator %1 nie jest zdefiniowany w ustawieniach użytkownika';
        Text_002: Label 'Operator %1 nie ma uprawnieñ do odczytu kartoteki zapasu w ustawieniach użytkownika';
        Text_003: Label 'Należy wpierw wypełnić Datę Filta Przeterminowania';
        Text_004: Label 'Należy najpierw wprowadzić pole:\Nowy Status KJ';
        Text_005: Label 'Nie oznaczono żadnej linii d aktualizacji statusu KJ';
        Text_006: Label 'Czy zaktualizować linie statusu KJ?\Ilość: %1';
        Text_007: Label 'Zaktualizowano liniie statusu KJ.\Ilość %1.';
        Text_008: Label 'Zaniechano aktualizacji linii statusu KJ. ';
}
