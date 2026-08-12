page 50056 "AMC Item Calculation List"
{
    ApplicationArea = All;
    Caption = 'Item Calculation List';
    PageType = List;
    SourceTable = "AMC Item Calculation";
    UsageCategory = Lists;
    CardPageId = "AMC Item Calculation Card";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ItemBudgetCode; ItemBudgetCode)
                {
                    Caption = 'Item Budget Code';
                    ApplicationArea = All;
                    TableRelation = "AMC Item Budget Instance";

                    trigger OnValidate()
                    begin
                        IF ItemBudgetCode <> '' THEN
                            Rec.SETRANGE("Item Budget Instance", ItemBudgetCode)
                        ELSE
                            Rec.SETRANGE("Item Budget Instance");
                        CurrPage.Update(false);
                    end;
                }
                field("Calculation Notes"; Rec."Calculation Notes")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Item Filter Quantity"; Rec."Item Filter Quantity")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Set_Item_Filter; Set_Item_Filter)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Item Filter';
                    TableRelation = Item WHERE("AMC Item Type" = FILTER(Wyroby | Półprodukt | Próba));

                    trigger OnValidate()
                    begin
                        IF Set_Item_Filter <> '' THEN BEGIN
                            Rec.SETFILTER("Item Code FlowFilter", Set_Item_Filter);
                            Rec.SETFILTER("Source Code", Set_Item_Filter);
                            Rec.SETRANGE("Source Type", Rec."Source Type"::Item);
                        END ELSE BEGIN
                            Rec.SETRANGE("Item Code FlowFilter");
                            Rec.SETRANGE("Source Code");
                            Rec.SETRANGE("Source Type");
                        END;
                    end;
                }
                field(ActiveItem; ActiveItem)
                {
                    ApplicationArea = All;
                    Caption = 'Active Item';
                }
                field(Filter_Status; Filter_Status)
                {
                    ApplicationArea = All;
                    Caption = 'Filter Status';

                    trigger OnValidate()
                    begin
                        CASE Filter_Status OF
                            Filter_Status::New:
                                Rec.SETRANGE("Calculation Status", Rec."Calculation Status"::New);
                            Filter_Status::Ordered:
                                Rec.SETRANGE("Calculation Status", Rec."Calculation Status"::Ordered);
                            Filter_Status::"In Process":
                                Rec.SETRANGE("Calculation Status", Rec."Calculation Status"::"In Process");
                            Filter_Status::Finished:
                                Rec.SETRANGE("Calculation Status", Rec."Calculation Status"::Finished);
                            Filter_Status::Canceled:
                                Rec.SETRANGE("Calculation Status", Rec."Calculation Status"::Canceled);
                            Filter_Status::" ":
                                Rec.SETRANGE("Calculation Status");
                        END;
                        CurrPage.UPDATE(false);
                    end;
                }
            }
            repeater(Lines)
            {
                ShowCaption = false;
                field("Calculation No"; Rec."Calculation No")
                {
                    ToolTip = 'Specifies the value of the Nr Wyceny field.', Comment = '%';
                }
                field("Item Budget Instance"; Rec."Item Budget Instance")
                {
                    ToolTip = 'Specifies the value of the Item Budget Instance field.', Comment = '%';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the value of the Calculate Type field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Code Description"; Rec."Code Description")
                {
                    ToolTip = 'Specifies the value of the Code Description field.', Comment = '%';
                }
                field("Init Source"; Rec."Init Source")
                {
                    ToolTip = 'Specifies the value of the Źródło Utworzenia field.', Comment = '%';
                }
                field("Optimalisation Code"; Rec."Optimalisation Code")
                {
                    ToolTip = 'Specifies the value of the Kod Zgł. Optymalizacji field.', Comment = '%';
                }
                field("Include Packages"; Rec."Include Packages")
                {
                    ToolTip = 'Specifies the value of the Zawiera Opakowania field.', Comment = '%';
                }
                field("Notes Exist"; Rec."Notes Exist")
                {
                    ToolTip = 'Specifies the value of the Uwagi field.', Comment = '%';
                }
                field("Item Blocked"; Rec."Item Blocked")
                {
                    ToolTip = 'Specifies the value of the Zapas Zablokowany field.', Comment = '%';
                }
                field("Total Cal. Value"; Rec."Total Cal. Value")
                {
                    ToolTip = 'Specifies the value of the Razem Wartość Kalkulacji field.', Comment = '%';
                }
                field("Total Actual Value"; Rec."Total Actual Value")
                {
                    ToolTip = 'Specifies the value of the Razem Wartość Bieżąca field.', Comment = '%';
                }
                field("Generowanie Zbiorcze"; Rec."Generowanie Zbiorcze")
                {
                    ToolTip = 'Specifies the value of the Generowanie Zbiorcze field.', Comment = '%';
                }
                field("Brak Ceny dla Zapasów"; Rec."Brak Ceny dla Zapasów")
                {
                    ToolTip = 'Specifies the value of the Brak Ceny dla Zapasu field.', Comment = '%';
                }
                field("Zablokowany Cennik Zapasu"; Rec."Zablokowany Cennik Zapasu")
                {
                    ToolTip = 'Specifies the value of the Zablok. Cennik dla Zapasu field.', Comment = '%';
                }
                field("Rozwinięcie BOMów"; Rec."Rozwinięcie BOMów")
                {
                    ToolTip = 'Specifies the value of the Rozwinięcie BOMów field.', Comment = '%';
                }
                field("Qty of Components"; Rec."Qty of Components")
                {
                    ToolTip = 'Specifies the value of the Ilość Komponentów field.', Comment = '%';
                }
                field("Maksimum BOM Level"; Rec."Maksimum BOM Level")
                {
                    ToolTip = 'Specifies the value of the Maksymalny poziom BOM field.', Comment = '%';
                }
                field("Includes IFF Flavor"; Rec."Includes IFF Flavor")
                {
                    ToolTip = 'Specifies the value of the Zawiera Aromat IFF field.', Comment = '%';
                }
                field("Value of IFF Flavor"; Rec."Value of IFF Flavor")
                {
                    ToolTip = 'Specifies the value of the Zawartość Aromatu IFF field.', Comment = '%';
                }
                field("Calculation Type"; Rec."Calculation Type")
                {
                    ToolTip = 'Specifies the value of the Calculation Type field.', Comment = '%';
                }
                field("Calculation Status"; Rec."Calculation Status")
                {
                    ToolTip = 'Specifies the value of the Status wyceny field.', Comment = '%';
                }
                field("Calculation UserID"; Rec."Calculation UserID")
                {
                    ToolTip = 'Specifies the value of the Użytkownik Zatwierdzający field.', Comment = '%';
                }
                field("Calculatio Date Time"; Rec."Calculatio Date Time")
                {
                    ToolTip = 'Specifies the value of the Data Zatwierdzenia field.', Comment = '%';
                }
                field("Last Calculation UserID"; Rec."Last Calculation UserID")
                {
                    ToolTip = 'Specifies the value of the Użytkownik ostat. kalkulacji field.', Comment = '%';
                }
                field("Last Calculation Time"; Rec."Last Calculation Time")
                {
                    ToolTip = 'Specifies the value of the Data ostat. kalkulacji field.', Comment = '%';
                }
                field("Init UserID"; Rec."Init UserID")
                {
                    ToolTip = 'Specifies the value of the Użytkownik zapytania field.', Comment = '%';
                }
                field("Init Date Time"; Rec."Init Date Time")
                {
                    ToolTip = 'Specifies the value of the Data zapytania wyceny field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AssignItem)
            {
                ApplicationArea = All;
                Caption = 'Przypisz Zapasy do Wyceny';

                trigger OnAction()
                begin
                    AssigneItems();
                end;
            }
            action(Generate)
            {
                ApplicationArea = All;
                Caption = 'Generuj Wyceny Zap. Przypis.';

                trigger OnAction()
                begin
                    GenerateAssigned();
                end;
            }
            action(GenerateBlank)
            {
                ApplicationArea = All;
                Caption = 'Generuj Wyceny Zbiorczo';
                trigger OnAction()
                begin
                    IF ItemBudgetCode = '' THEN
                        ERROR(Text_002);

                    IF ActiveItem = FALSE THEN BEGIN
                        IF Set_Item_Filter = '' THEN
                            ERROR(Text_001);
                        Rec.CALCFIELDS("Item Filter Quantity");

                        Question_Set := STRSUBSTNO(Text_003, ItemBudgetCode, Set_Item_Filter, Rec."Item Filter Quantity");
                    END ELSE BEGIN
                        //SetItemDate:=DMY2DATE(1,1,DATE2DMY(WORKDATE,3));
                        SetItemDate := DMY2DATE(1, 4, 2022);

                        Question_Set := STRSUBSTNO(Text_003a, SetItemDate);
                    END;

                    IF CONFIRM(Question_Set, FALSE) THEN BEGIN
                        ClearCalculationStatus();
                        MESSAGE(Text_004, ItemCalculationCount);
                    END ELSE
                        ERROR(Text_006);
                end;
            }
            action(Update)
            {
                ApplicationArea = All;
                Caption = 'Aktualizuj Receptury Zbiorczo';

                trigger OnAction()
                var
                    Item_Calculation: Record "AMC Item Calculation";
                    ItemCalculationLineLoc: Record "AMC Item Calculation Line";
                    Item_Loc: Record Item;
                begin
                    IF Set_Item_Filter = '' THEN
                        ERROR(Text_001);
                    IF ItemBudgetCode = '' THEN
                        ERROR(Text_002);

                    Item_Calculation.RESET();
                    Item_Calculation.SETRANGE("Source Type", Item_Calculation."Source Type"::Item);
                    Item_Calculation.SETFILTER("Source Code", Set_Item_Filter);
                    Item_Calculation.SETRANGE("Generowanie Zbiorcze", TRUE);
                    Item_Calculation.SETRANGE("Calculation Status", Item_Calculation."Calculation Status"::Ordered);
                    IF Item_Calculation.FindSet() THEN BEGIN
                        ItemCalulCount := Item_Calculation.COUNT;
                        Question_Calculation := STRSUBSTNO(Text_007, ItemCalulCount);
                        IF CONFIRM(Question_Calculation, FALSE) THEN
                            REPEAT
                                ItemCalculationLineLoc.RESET();
                                ItemCalculationLineLoc.SETRANGE("Calculation No", Item_Calculation."Calculation No");
                                IF ItemCalculationLineLoc.FINDFIRST() THEN
                                    ItemCalculationLineLoc.DELETEALL();

                                IF Item_Loc.GET(Item_Calculation."Source Code") THEN
                                    IF Item_Loc."Production BOM No." <> '' THEN
                                        InsertBOMLines(Item_Calculation."Calculation No", BOM_Type::Production, Item_Loc."Production BOM No.");

                            UNTIL Item_Calculation.NEXT() = 0
                        ELSE
                            ERROR(Text_008);
                    END ELSE
                        ERROR(Text_012);
                end;
            }
            action(Automatic)
            {
                ApplicationArea = All;
                Caption = 'Automatyczna Wycena Receptur';

                trigger OnAction()
                var
                    Item_Calculation: Record "AMC Item Calculation";
                    ItemCalculationLineLoc: Record "AMC Item Calculation Line";
                    ItemBudgetDetailsLoc: Record "AMC Item Budget Details";
                    NoItemPrice: Boolean;
                    BlockItemPrice: Boolean;
                begin
                    IF Set_Item_Filter = '' THEN
                        ERROR(Text_001);
                    IF ItemBudgetCode = '' THEN
                        ERROR(Text_002);

                    Item_Calculation.RESET();
                    Item_Calculation.SETRANGE("Source Type", Item_Calculation."Source Type"::Item);
                    Item_Calculation.SETFILTER("Source Code", Set_Item_Filter);
                    Item_Calculation.SETRANGE("Generowanie Zbiorcze", TRUE);
                    Item_Calculation.SETRANGE("Rozwinięcie BOMów", TRUE);
                    Item_Calculation.SETRANGE("Calculation Status", Item_Calculation."Calculation Status"::"In Process");

                    ItemCalulCount := Item_Calculation.COUNT;
                    IlRec := Item_Calculation.COUNT;

                    IF Item_Calculation.FindSet() THEN BEGIN
                        Question_Calculation := STRSUBSTNO(Text_009, ItemCalulCount);
                        IF CONFIRM(Question_Calculation, FALSE) THEN BEGIN

                            Index := 0;
                            Window.OPEN(Text_000);

                            REPEAT

                                Index := Index + 1;
                                ProcRec := ROUND(10000 * Index / IlRec, 1);

                                Window.UPDATE(1, Item_Calculation."Calculation No");
                                Window.UPDATE(2, ProcRec);

                                NoItemPrice := FALSE;
                                BlockItemPrice := FALSE;

                                ItemCalculationLineLoc.RESET();
                                ItemCalculationLineLoc.SETRANGE("Calculation No", Item_Calculation."Calculation No");
                                IF ItemCalculationLineLoc.FindSet() THEN
                                    REPEAT
                                        ItemCalculationLineLoc.VALIDATE("Budget Unit Price", 0);
                                        ItemCalculationLineLoc.MODIFY();

                                        ItemBudgetDetailsLoc.RESET();
                                        ItemBudgetDetailsLoc.SETRANGE("Item Budget Instance", Rec."Item Budget Instance");
                                        ItemBudgetDetailsLoc.SETRANGE("Item Code", ItemCalculationLineLoc."Component Code");
                                        ItemBudgetDetailsLoc.SETRANGE("Unit of Measure Code", ItemCalculationLineLoc."Component Code Of Measure");
                                        IF ItemBudgetDetailsLoc.FINDFIRST() THEN BEGIN
                                            IF ItemBudgetDetailsLoc."Unit Cost LCY" = 0 THEN
                                                NoItemPrice := TRUE;
                                            IF ItemBudgetDetailsLoc."Block in Autom. Calc" = TRUE THEN
                                                BlockItemPrice := TRUE;
                                        END;
                                    UNTIL ItemCalculationLineLoc.NEXT() = 0;

                                Item_Calculation."Brak Ceny dla Zapasów" := NoItemPrice;
                                Item_Calculation."Zablokowany Cennik Zapasu" := BlockItemPrice;
                                Item_Calculation.MODIFY();

                                IF (NoItemPrice = FALSE) AND (BlockItemPrice = FALSE) THEN BEGIN
                                    UpdateLineCalculation(Item_Calculation."Calculation No");
                                    Item_Calculation."Last Calculation Time" := CURRENTDATETIME;
                                    Item_Calculation."Last Calculation UserID" := USERID;
                                    Item_Calculation."Calculation Status" := Item_Calculation."Calculation Status"::Finished;
                                    Item_Calculation.MODIFY();
                                END;
                            UNTIL Item_Calculation.NEXT() = 0;

                            Window.CLOSE();

                        END ELSE
                            ERROR(Text_010);
                    END ELSE
                        ERROR(Text_011);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.SETRANGE("Item Code FlowFilter");
        Rec.SETRANGE("Source Code");
        Rec.SETRANGE("Source Type");
    end;

    trigger OnAfterGetCurrRecord()
    begin
        Rec.CALCFIELDS("Item Filter Quantity");
    end;

    local procedure AssigneItems()
    begin
        IF NOT CONFIRM(Text_101, FALSE) THEN
            ERROR(Text_102);

        ItemRec.RESET();
        ItemRec.SETRANGE("AMC Item Budget 2022", TRUE);
        IF ItemRec.FindSet() THEN
            REPEAT
                ItemRec."AMC Item Budget 2022" := FALSE;
                ItemRec.MODIFY();
            UNTIL ItemRec.NEXT() = 0;

        Item_Filter := STRSUBSTNO('%1|%2', ItemRec."AMC Item Type"::Wyroby, ItemRec."AMC Item Type"::"Półprodukt");

        ItemCount := 0;

        ItemRec.RESET();
        ItemRec.SETFILTER("AMC Item Type", Item_Filter);
        IF ItemRec.FindSet() THEN
            REPEAT
                ItemLedgerEnntry.RESET();
                ItemLedgerEnntry.SETRANGE("Item No.", ItemRec."No.");
                ItemLedgerEnntry.SETfilter("Posting Date", '%1..', DMY2Date(1, 7, 2021));
                ItemLedgerEnntry.SETRANGE("Entry Type", ItemLedgerEnntry."Entry Type"::Output);
                IF ItemLedgerEnntry.FINDFIRST() THEN BEGIN
                    ItemRec."AMC Item Budget 2022" := TRUE;
                    ItemRec.MODIFY();
                    ItemCount += 1;
                END;
            UNTIL ItemRec.NEXT() = 0;

        MESSAGE(Text_103, ItemCount);
    end;

    local procedure GenerateAssigned()
    var
        Item_Calculation: Record "AMC Item Calculation";
    begin
        IF ItemBudgetCode = '' THEN
            ERROR(Text_002);

        ItemRec.RESET();
        ItemRec.SETRANGE("AMC Item Budget 2022", TRUE);
        IF ItemRec.FINDFIRST() THEN
            ItemCount := ItemRec.COUNT
        ELSE
            ERROR(Text_104);

        Question_Set := STRSUBSTNO(Text_105, ItemBudgetCode, ItemCount);

        IF CONFIRM(Question_Set, FALSE) THEN BEGIN

            ItemRec.RESET();
            ItemRec.SETRANGE("AMC Item Budget 2022", TRUE);
            IF ItemRec.FindSet() THEN
                REPEAT
                    Item_Calculation.RESET();
                    Item_Calculation.SETRANGE("Source Type", Item_Calculation."Source Type"::Item);
                    Item_Calculation.SETRANGE("Source Code", ItemRec."No.");
                    IF Item_Calculation.FindSet() THEN
                        REPEAT
                            CASE Item_Calculation."Calculation Status" OF
                                Item_Calculation."Calculation Status"::New,
                                Item_Calculation."Calculation Status"::Ordered,
                                Item_Calculation."Calculation Status"::"In Process":
                                    BEGIN
                                        Question_Calculation := STRSUBSTNO(Text_005,
                                                                         Item_Calculation."Calculation No",
                                                                         Item_Calculation."Source Code",
                                                                         Item_Calculation."Calculation Status");

                                        IF CONFIRM(Question_Calculation, FALSE) THEN BEGIN
                                            Item_Calculation."Calculation Status" := Item_Calculation."Calculation Status"::Canceled;
                                            Item_Calculation."Calculation Close" := TRUE;
                                            Item_Calculation."Calculation UserID" := USERID;
                                            Item_Calculation."Calculatio Date Time" := CURRENTDATETIME;
                                            Item_Calculation.MODIFY();
                                        END ELSE
                                            ERROR(Text_006);
                                    END;
                            END;
                        UNTIL Item_Calculation.NEXT() = 0;
                UNTIL ItemRec.NEXT() = 0;

            ItemCalculation.GenerateSerialCalculationItem(ItemBudgetCode, ItemCalculationCount);

            MESSAGE(Text_004, ItemCalculationCount);

            Set_Item_Filter := '*';

            Rec.SETFILTER("Item Code FlowFilter", Set_Item_Filter);
            Rec.SETFILTER("Source Code", Set_Item_Filter);
            Rec.SETRANGE("Source Type", Rec."Source Type"::Item);

        END ELSE
            ERROR(Text_006);
    end;

    local procedure ClearCalculationStatus()
    var
        Item_Calculation: Record "AMC Item Calculation";
    begin
        Item_Calculation.RESET();
        Item_Calculation.SETRANGE("Source Type", Item_Calculation."Source Type"::Item);
        Item_Calculation.SETFILTER("Source Code", Set_Item_Filter);
        IF Item_Calculation.FindSet() THEN
            REPEAT
                CASE Item_Calculation."Calculation Status" OF
                    Item_Calculation."Calculation Status"::New,
                    Item_Calculation."Calculation Status"::Ordered,
                    Item_Calculation."Calculation Status"::"In Process":
                        BEGIN
                            Question_Calculation := STRSUBSTNO(Text_005,
                                                             Item_Calculation."Calculation No",
                                                             Item_Calculation."Source Code",
                                                             Item_Calculation."Calculation Status");

                            IF CONFIRM(Question_Calculation, FALSE) THEN BEGIN
                                Item_Calculation."Calculation Status" := Item_Calculation."Calculation Status"::Canceled;
                                Item_Calculation."Calculation Close" := TRUE;
                                Item_Calculation."Calculation UserID" := USERID;
                                Item_Calculation."Calculatio Date Time" := CURRENTDATETIME;
                                Item_Calculation.MODIFY();
                            END ELSE
                                ERROR(Text_006);
                        END;
                END;
            UNTIL Item_Calculation.NEXT() = 0;
        IF ActiveItem = FALSE THEN
            ItemCalculation.GenerateSerialCalculationCard(Set_Item_Filter, ItemBudgetCode, ItemCalculationCount)
        ELSE
            ItemCalculation.GenerateSerialActiveCard(SetItemDate, ItemBudgetCode, ItemCalculationCount);
    end;

    local procedure InsertBOMLines(Set_Calculation_Code: Code[20]; Set_BOM_Type: Option; Set_BOM: Code[20])
    var
        ItemLoc: Record Item;
        ItemCalculationLoc: Record "AMC Item Calculation";
        ItemCalculationLineLoc: Record "AMC Item Calculation Line";
        ItemCalculationBOMLineLoc: Record "AMC Item Calculation Line";
        ProductionBOMHeaderLoc: Record "Production BOM Header";
        ProductionBOMLineLoc: Record "Production BOM Line";
        ItemBOM: Record Item;
        BOM_Levet_Loc: Integer;
    begin
        ItemCalculationLoc.GET(Set_Calculation_Code);

        ProductionBOMHeaderLoc.RESET();
        ProductionBOMHeaderLoc.SETRANGE("No.", Set_BOM);
        ProductionBOMHeaderLoc.SETRANGE("AMC BOM Type", Set_BOM_Type);
        IF ProductionBOMHeaderLoc.FINDFIRST() THEN BEGIN
            ProductionBOMLineLoc.RESET();
            ProductionBOMLineLoc.SETRANGE("Production BOM No.", ProductionBOMHeaderLoc."No.");
            ProductionBOMLineLoc.SETRANGE("AMC BOM Type", ProductionBOMHeaderLoc."AMC BOM Type");
            IF ProductionBOMLineLoc.FindSet() THEN
                REPEAT
                    CASE ProductionBOMLineLoc.Type OF
                        ProductionBOMLineLoc.Type::Item:
                            BEGIN
                                //ItemCalculationLineLoc.RESET;
                                //ItemCalculationLineLoc.SETRANGE("Calculation No",ItemCalculationLoc."Calculation No");
                                IF LineNo = 0 THEN
                                    LineNo := 10000
                                ELSE
                                    LineNo := LineNo + 10000;

                                ItemCalculationLineLoc.INIT();
                                ItemCalculationLineLoc."Calculation No" := ItemCalculationLoc."Calculation No";
                                ItemCalculationLineLoc."Calculation Line No" := LineNo;
                                ItemCalculationLineLoc."Item Budget Instance" := ItemCalculationLoc."Item Budget Instance";
                                ItemCalculationLineLoc."Source Type" := ItemCalculationLoc."Source Type";
                                ItemCalculationLineLoc."Source Code" := ItemCalculationLoc."Source Code";

                                ItemCalculationLineLoc."Calculation Type" := ItemCalculationLoc."Calculation Type";
                                ItemCalculationLineLoc."Component Code" := ProductionBOMLineLoc."No.";

                                ItemCalculationLineLoc."Component Name" := ProductionBOMLineLoc.Description;
                                ItemCalculationLineLoc."Component Code Of Measure" := ProductionBOMLineLoc."Unit of Measure Code";
                                ItemCalculationLineLoc."Component BOM Source" := ProductionBOMLineLoc."Production BOM No.";
                                ItemCalculationLineLoc.Quantity := ProductionBOMLineLoc.Quantity;
                                ItemCalculationLineLoc."Qty per Source" := ProductionBOMLineLoc.Quantity;

                                CASE ProductionBOMLineLoc.Type OF
                                    ProductionBOMLineLoc.Type::"Production BOM":
                                        ItemCalculationLineLoc."Sub BOM" := TRUE;

                                    ProductionBOMLineLoc.Type::Item:
                                        BEGIN
                                            ItemBOM.RESET();
                                            ItemBOM.SETRANGE("No.", ItemCalculationLineLoc."Component Code");
                                            IF ItemBOM.FINDFIRST() THEN BEGIN
                                                ItemCalculationLineLoc."Component Type" := ItemBOM."AMC Item Type".AsInteger();
                                                IF (ItemBOM."AMC Item Type" IN [ItemBOM."AMC Item Type"::Surowce,
                                                                            ItemBOM."AMC Item Type"::Towary]) AND
                                                   (ItemCalculationLineLoc."Component Code Of Measure" = 'KG') THEN
                                                    ItemCalculationLineLoc."Weight Item" := TRUE;

                                                IF ItemBOM."Production BOM No." <> '' THEN
                                                    ItemCalculationLineLoc."Sub BOM" := TRUE
                                                ELSE
                                                    ItemCalculationLineLoc."Sub BOM" := FALSE;
                                            END;
                                        END;
                                END;

                                ItemCalculationLineLoc."BOM Level" := 0;

                                ItemCalculationLineLoc."Currency Code" := 'PLN';
                                ItemCalculationLineLoc."Currecny Exchange" := 1;

                                IF ItemLoc.GET(ProductionBOMLineLoc."No.") THEN
                                    IF ItemLoc."AMC Aromat IFF" = TRUE THEN BEGIN
                                        ItemCalculationLineLoc."Component IFF Flaver" := TRUE;
                                        ItemCalculationLineLoc."Component IFF Flaver Qty" := ProductionBOMLineLoc.Quantity;
                                    END;

                                ItemCalculationLineLoc.INSERT();

                                IF ItemCalculationLineLoc."Sub BOM" = TRUE THEN;
                                InsertSubLineBOM(ItemCalculationLineLoc,
                                                 ItemCalculationLineLoc."Component Code",
                                                 ItemCalculationLineLoc.Quantity,
                                                 0);
                            END;
                        ProductionBOMLineLoc.Type::"Production BOM":
                            ;
                    END;
                UNTIL ProductionBOMLineLoc.NEXT() = 0;
        END;

        ItemCalculationLoc."Calculation Status" := ItemCalculationLoc."Calculation Status"::"In Process";
        ItemCalculationLoc."Rozwinięcie BOMów" := TRUE;
        ItemCalculationLoc."Last Calculation UserID" := USERID;
        ItemCalculationLoc."Last Calculation Time" := CURRENTDATETIME;
        ItemCalculationLoc.MODIFY();
    end;

    local procedure InsertSubLineBOM(var Set_ItemCalculationBOMLineLoc: Record "AMC Item Calculation Line";
                                     var Set_SourceBOMCode: Code[20]; var Set_SourceBOMQty: Decimal;
                                     Set_BOM_Level: Integer)
    var
        ItemBOMRec: Record Item;
        ItemBOMComp: Record Item;
        BOM_Header_Loc: Record "Production BOM Header";
        BOM_Lines_Loc: Record "Production BOM Line";
        ItemCalculationBOMLineNewLoc: Record "AMC Item Calculation Line";
        BOM_Levet_Loc: Integer;
    begin

        BOM_Levet_Loc := Set_BOM_Level + 1;

        IF ItemBOMRec.GET(Set_SourceBOMCode) THEN BEGIN
            BOM_Header_Loc.RESET();
            BOM_Header_Loc.SETRANGE("No.", ItemBOMRec."Production BOM No.");
            BOM_Header_Loc.SETRANGE("AMC BOM Type", BOM_Header_Loc."AMC BOM Type"::Production);
            IF BOM_Header_Loc.FINDFIRST() THEN BEGIN
                BOM_Lines_Loc.RESET();
                BOM_Lines_Loc.SETRANGE("Production BOM No.", BOM_Header_Loc."No.");
                BOM_Lines_Loc.SETRANGE("AMC BOM Type", BOM_Lines_Loc."AMC BOM Type"::Production);
                IF BOM_Lines_Loc.FindSet() THEN
                    REPEAT
                        LineNo := LineNo + 10000;
                        ItemCalculationBOMLineNewLoc.INIT();
                        ItemCalculationBOMLineNewLoc."Calculation No" := Set_ItemCalculationBOMLineLoc."Calculation No";
                        ItemCalculationBOMLineNewLoc."Calculation Line No" := LineNo;
                        ItemCalculationBOMLineNewLoc."Item Budget Instance" := Set_ItemCalculationBOMLineLoc."Item Budget Instance";
                        ItemCalculationBOMLineNewLoc."Source Type" := Set_ItemCalculationBOMLineLoc."Source Type";
                        ItemCalculationBOMLineNewLoc."Source Code" := Set_ItemCalculationBOMLineLoc."Source Code";

                        ItemCalculationBOMLineNewLoc."Calculation Type" := Set_ItemCalculationBOMLineLoc."Calculation Type";
                        ItemCalculationBOMLineNewLoc."Component Code" := BOM_Lines_Loc."No.";
                        ItemCalculationBOMLineNewLoc."BOM Level" := BOM_Levet_Loc;

                        ItemCalculationBOMLineNewLoc."Component Name" := BOM_Lines_Loc.Description;
                        ItemCalculationBOMLineNewLoc."Component Code Of Measure" := BOM_Lines_Loc."Unit of Measure Code";
                        ItemCalculationBOMLineNewLoc."Component BOM Source" := BOM_Lines_Loc."Production BOM No.";
                        ItemCalculationBOMLineNewLoc.Quantity := BOM_Lines_Loc.Quantity * Set_ItemCalculationBOMLineLoc.Quantity;
                        ItemCalculationBOMLineNewLoc."Qty per Source" := BOM_Lines_Loc.Quantity;

                        CASE BOM_Lines_Loc.Type OF
                            BOM_Lines_Loc.Type::"Production BOM":
                                ItemCalculationBOMLineNewLoc."Sub BOM" := TRUE;

                            BOM_Lines_Loc.Type::Item:
                                BEGIN
                                    ItemBOMComp.RESET();
                                    ItemBOMComp.SETRANGE("No.", ItemCalculationBOMLineNewLoc."Component Code");
                                    IF ItemBOMComp.FINDFIRST() THEN BEGIN
                                        ItemCalculationBOMLineNewLoc."Component Type" := ItemBOMComp."AMC Item Type".AsInteger();

                                        IF (ItemBOMComp."AMC Item Type" IN [ItemBOMComp."AMC Item Type"::Surowce,
                                                                    ItemBOMComp."AMC Item Type"::Towary]) AND
                                           (ItemCalculationBOMLineNewLoc."Component Code Of Measure" = 'KG') THEN
                                            ItemCalculationBOMLineNewLoc."Weight Item" := TRUE;

                                        IF ItemBOMComp."Production BOM No." <> '' THEN
                                            ItemCalculationBOMLineNewLoc."Sub BOM" := TRUE
                                        ELSE
                                            ItemCalculationBOMLineNewLoc."Sub BOM" := FALSE;
                                    END;
                                END;
                        END;

                        ItemCalculationBOMLineNewLoc."Currency Code" := 'PLN';
                        ItemCalculationBOMLineNewLoc."Currecny Exchange" := 1;

                        IF ItemBOMComp.GET(BOM_Lines_Loc."No.") THEN
                            IF ItemBOMComp."AMC Aromat IFF" = TRUE THEN BEGIN
                                ItemCalculationBOMLineNewLoc."Component IFF Flaver" := TRUE;
                                ItemCalculationBOMLineNewLoc."Component IFF Flaver Qty" := BOM_Lines_Loc.Quantity * Set_ItemCalculationBOMLineLoc.Quantity;
                            END;

                        ItemCalculationBOMLineNewLoc.INSERT();

                        IF ItemCalculationBOMLineNewLoc."Sub BOM" = TRUE THEN;
                        InsertSubLineBOM(ItemCalculationBOMLineNewLoc,
                                         ItemCalculationBOMLineNewLoc."Component Code",
                                         ItemCalculationBOMLineNewLoc."Qty per Source",
                                         BOM_Levet_Loc);
                    UNTIL BOM_Lines_Loc.NEXT() = 0;
            END;
        END;
    end;

    local procedure UpdateLineCalculation(Set_CalculationCode: Code[20])
    var
        ItemBudgetInstanceLoc: Record "AMC Item Budget Instance";
        ItemCalculationBOMLineLoc: Record "AMC Item Calculation Line";
        ItemRec_Loc: Record Item;
        ItemLedgerEntry_Loc: Record "Item Ledger Entry";
        VendorRec: Record Vendor;
        ItemBudgetDetailsLoc: Record "AMC Item Budget Details";
        SetPurchaseDate: Date;
        SetPurchaseValue: Decimal;
        SetPurchaseQty: Decimal;
        SetVendorCode: Code[20];
    begin
        ItemBudgetInstanceLoc.RESET();
        ItemBudgetInstanceLoc.SETRANGE("Item Budget Instance", Rec."Item Budget Instance");
        IF ItemBudgetInstanceLoc.FINDFIRST() THEN BEGIN
            Rec."Currency USD Rate" := ItemBudgetInstanceLoc."Curency Rate USD";
            Rec."Currency EUR Rate" := ItemBudgetInstanceLoc."Curency Rate EUR";
            Rec."Currency GBP Rate" := ItemBudgetInstanceLoc."Curency Rate GBP";
            Rec."Currency CHF Rate" := ItemBudgetInstanceLoc."Curency Rate CHF";
            ItemBudgetInstanceLoc.MODIFY();
        END;

        ItemCalculationBOMLineLoc.RESET();
        ItemCalculationBOMLineLoc.SETRANGE("Calculation No", Set_CalculationCode);
        IF ItemCalculationBOMLineLoc.FindSet() THEN
            REPEAT
                IF ItemCalculationBOMLineLoc."Component Type" IN
                  [ItemCalculationBOMLineLoc."Component Type"::Surowce,
                   ItemCalculationBOMLineLoc."Component Type"::Towary,
                   ItemCalculationBOMLineLoc."Component Type"::Opakowania] THEN BEGIN

                    ItemRec_Loc.RESET();
                    ItemRec_Loc.SETRANGE("No.", ItemCalculationBOMLineLoc."Component Code");
                    IF ItemRec_Loc.FINDFIRST() THEN BEGIN
                        ItemCalculationBOMLineLoc."Unit Cost" := ItemRec_Loc."Unit Cost";

                        SetPurchaseDate := 0D;
                        SetPurchaseValue := 0;
                        SetPurchaseQty := 0;
                        SetVendorCode := '';

                        ItemLedgerEntry_Loc.RESET();
                        ItemLedgerEntry_Loc.SETRANGE("Item No.", ItemRec_Loc."No.");
                        ItemLedgerEntry_Loc.SETRANGE("Entry Type", ItemLedgerEntry_Loc."Entry Type"::Purchase);
                        IF ItemLedgerEntry_Loc.FindSet() THEN
                            REPEAT
                                IF ItemLedgerEntry_Loc."Posting Date" > SetPurchaseDate THEN BEGIN
                                    SetPurchaseDate := ItemLedgerEntry_Loc."Posting Date";
                                    ItemLedgerEntry_Loc.CALCFIELDS("Cost Amount (Actual)", ItemLedgerEntry_Loc."Cost Amount (Expected)");
                                    SetPurchaseValue := ItemLedgerEntry_Loc."Cost Amount (Actual)" + ItemLedgerEntry_Loc."Cost Amount (Expected)";
                                    SetPurchaseQty := ItemLedgerEntry_Loc.Quantity;
                                    SetVendorCode := ItemLedgerEntry_Loc."Source No.";
                                END;
                            UNTIL ItemLedgerEntry_Loc.NEXT() = 0;

                        ItemCalculationBOMLineLoc."Type of Income" := ItemCalculationBOMLineLoc."Type of Income"::Purchase;
                        ItemCalculationBOMLineLoc."Income Date" := SetPurchaseDate;
                        IF SetPurchaseQty <> 0 THEN
                            ItemCalculationBOMLineLoc."Last Unit Cost" := SetPurchaseValue / SetPurchaseQty
                        ELSE
                            ItemCalculationBOMLineLoc."Last Unit Cost" := 0;

                        ItemCalculationBOMLineLoc."Vendor Code" := SetVendorCode;
                        IF VendorRec.GET(SetVendorCode) THEN
                            ItemCalculationBOMLineLoc."Vendor Name" := VendorRec.Name;

                        ItemBudgetDetailsLoc.RESET();
                        ItemBudgetDetailsLoc.SETRANGE("Item Budget Instance", Rec."Item Budget Instance");
                        ItemBudgetDetailsLoc.SETRANGE("Item Code", ItemCalculationBOMLineLoc."Component Code");
                        ItemBudgetDetailsLoc.SETRANGE("Unit of Measure Code", ItemCalculationBOMLineLoc."Component Code Of Measure");
                        IF ItemBudgetDetailsLoc.FINDFIRST() THEN BEGIN
                            ItemCalculationBOMLineLoc.VALIDATE("Currency Code", ItemBudgetDetailsLoc."Currency Code");
                            ItemCalculationBOMLineLoc.VALIDATE("Budget Unit Price", ItemBudgetDetailsLoc."Unit Cost");
                            ItemCalculationBOMLineLoc.VALIDATE("Budget Unit Addit.", ItemBudgetDetailsLoc."Add. Cost");
                        END;

                        ItemCalculationBOMLineLoc."Total Actual Amount" := ItemCalculationBOMLineLoc."Last Unit Cost" *
                                                                         ItemCalculationBOMLineLoc.Quantity;

                        CASE Rec."Calculation Type" OF
                            Rec."Calculation Type"::"wg kosztów":
                                BEGIN
                                    ItemCalculationBOMLineLoc.VALIDATE("Calculation Unit Cost", ItemCalculationBOMLineLoc."Last Unit Cost");
                                    ItemCalculationBOMLineLoc."Manulal Insert Cost" := FALSE;
                                END;

                            Rec."Calculation Type"::"wg cennika":
                                BEGIN
                                    ItemCalculationBOMLineLoc.VALIDATE("Calculation Unit Cost", ItemCalculationBOMLineLoc."Budget Unit Cost LCY");
                                    ItemCalculationBOMLineLoc.VALIDATE("Additional Cost", ItemCalculationBOMLineLoc."Budget Unit Addit. LCY");
                                    ItemCalculationBOMLineLoc."Manulal Insert Cost" := FALSE;
                                END;
                        END;

                        ItemCalculationBOMLineLoc.MODIFY();
                    END;
                END;
            UNTIL ItemCalculationBOMLineLoc.NEXT() = 0;
    end;

    var
        ItemRec: Record Item;
        ItemLedgerEnntry: Record "Item Ledger Entry";
        ItemCalculation: Codeunit "AMC Item Calculation";
        ItemBudgetCode: Code[20];
        Set_Item_Filter: Code[200];
        SetItemDate: Date;
        Question_Set: Text[255];
        Question_Calculation: Text[200];
        Filter_Status: Option " ",New,Ordered,"In Process",Finished,Canceled;
        ItemCalculationCount: Integer;
        ItemCalulCount: Integer;
        BOM_Type: Option Production,RiD;
        ActiveItem: Boolean;
        LineNo: Integer;
        Item_Filter: Text[200];
        ItemCount: Integer;
        Window: Dialog;
        Index: Integer;
        ProcRec: Decimal;
        IlRec: Integer;
        Text_000: Label 'Wycena BOMów \Nr Wyceny :                 #1#################\@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@';
        Text_001: Label 'Przed wywołaniem należy wprowadzić\ograniczenie zakresu zapasów.\\Pole: "Filtr Generowania Wyceny" dla kodów zapasów.';
        Text_002: Label 'Przed wywołaniem należy wprowadzić\ograniczenie zakresu zapasów.\\Pole: "Filtr Budżetu Zapasu" dla kodów zapasów.';
        Text_003: Label 'Czy uruchomić generowanie wyceny?\  dla:\    Filtr Budżetu Zapasu:    %1\    Filtr Kodu Zapasu:         %2\    Il. zapasów do wyceny: %3';
        Text_003a: Label 'Czy uruchomić generowanie wyceny\aktywnych zapasów w okresie od %1?';
        Text_004: Label 'Zakoñczono wygenerowanie wycen dla %1 zapasów.';
        Text_005: Label 'Wycena Zapasu:\    Nr: %1\    Zapas: %2\    status wyceny: %3. \Czy tę wycenę anulować i kontynuować generowanie?';
        Text_006: Label 'Zaniechano generowanie wyceny zapasów';
        Text_007: Label 'Znaleziono %1 kalkulacji do rozwinięcia receptury BOMów\Czy kontynuować?';
        Text_008: Label 'Zaniechano rozwinięcia receptur BOMów.';
        Text_009: Label 'Znaleziono %1 kalkulacji do automatycznej wyceny BOMów\Czy kontynuować?';
        Text_010: Label 'Zaniechano automatycznej\kalkulacji receptur BOMów.';
        Text_011: Label 'Nie znaleziono wycen zapasów\do automatycznej kalkulacji receptur.';
        Text_012: Label 'Nie znaleziono wycen do\rozwinięcia receptur BOMów.';
        Text_101: Label 'Czy przypisać na nowo znaczniki zapasów do wyceny?';
        Text_102: Label 'Anulowano wywołanie funkcji.';
        Text_103: Label 'Zakoñczono Przypisywanie Zapasów.\Wyroby i Półprodykty: Ilość %1.';
        Text_104: Label 'Brak oznaczonych zapsów do wygenerowania wyceny.';
        Text_105: Label 'Czy uruchomić generowanie wyceny?\  dla:\    Filtr Budżetu Zapasu:    %1\    Zapasy oznaczone do wyceny\    Il. zapasów do wyceny: %2';
}
