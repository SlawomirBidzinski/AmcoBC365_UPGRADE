codeunit 50010 "AMC Item Calculation"
{

    procedure GenerateSerialActiveCard(Set_ItemSalesDate: Date; DefaultInstanceCode: Code[20]; VAR CountCalculation: Integer)
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
        CalculationFilterStatus: Text[300];
    begin
        CountCalculation := 0;

        IF Set_ItemSalesDate = 0D THEN
            ERROR(Text_201a);

        ItemRec.RESET();

        ItemRec.SETRANGE("AMC Item Type", ItemRec."AMC Item Type"::Wyroby);
        ItemRec.SETRANGE(Blocked, FALSE);
        IF ItemRec.FindSet() THEN
            REPEAT
                ItemLedgerEntry.RESET();
                ItemLedgerEntry.SETCURRENTKEY("Item No.", "Entry Type", "Variant Code", "Drop Shipment", "Location Code", "Posting Date");
                ItemLedgerEntry.SETRANGE("Item No.", ItemRec."No.");
                ItemLedgerEntry.SEtfilter("Posting Date", '%1..', Set_ItemSalesDate);
                ItemLedgerEntry.SETRANGE("Entry Type", ItemLedgerEntry."Entry Type"::Sale);
                IF ItemLedgerEntry.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc.RESET();
                    ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);

                    CalculationFilterStatus := STRSUBSTNO('%1|%2|%3',
                                                        ItemCalculationLoc."Calculation Status"::New,
                                                        ItemCalculationLoc."Calculation Status"::Ordered,
                                                        ItemCalculationLoc."Calculation Status"::"In Process");

                    ItemCalculationLoc.SETFILTER("Calculation Status", CalculationFilterStatus);
                    ItemCalculationLoc.SETRANGE("Source Code", ItemRec."No.");
                    IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                        ItemCalculationLoc.INIT();
                        CountCalculation += 1;

                        PurchasesSetup.GET();
                        PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                        CalculationDate := WORKDATE();

                        ItemCalculationLoc."Calculation No" := '';
                        ItemCalculationLoc."Calculation Date" := CalculationDate;

                        ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                        ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;
                        ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::Item;
                        ItemCalculationLoc.VALIDATE("Source Code", ItemRec."No.");
                        ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                        ItemCalculationLoc."Calculation Date" := CalculationDate;
                        ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                        ItemCalculationLoc."Init UserID" := USERID;
                        ItemCalculationLoc."Calculatin Init" := TRUE;
                        ItemCalculationLoc."Calculation Status" := ItemCalculationLoc."Calculation Status"::Ordered;
                        ItemCalculationLoc."Generowanie Zbiorcze" := TRUE;

                        ItemBudgetInstance.RESET();
                        ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                        ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                        IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                            ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                            ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                            ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                            ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                        END;
                        ItemCalculationLoc.INSERT();
                    END;
                END;
            UNTIL ItemRec.NEXT() = 0;
    end;

    procedure GenerateSerialCalculationCard(Set_ItemCodeFilter: Code[200]; DefaultInstanceCode: Code[20]; VAR CountCalculation: Integer)
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
        CalculationFilterStatus: Text[300];
    begin
        CountCalculation := 0;

        IF Set_ItemCodeFilter = '' THEN
            ERROR(Text_201);

        ItemRec.RESET();
        ItemRec.SETFILTER("No.", Set_ItemCodeFilter);
        ItemRec.SETRANGE("AMC Item Type", ItemRec."AMC Item Type"::Wyroby);
        ItemRec.SETRANGE(Blocked, FALSE);
        IF ItemRec.FindSet() THEN
            REPEAT
                ItemCalculationLoc.RESET();
                ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);

                CalculationFilterStatus := STRSUBSTNO('%1|%2|%3',
                                                    ItemCalculationLoc."Calculation Status"::New,
                                                    ItemCalculationLoc."Calculation Status"::Ordered,
                                                    ItemCalculationLoc."Calculation Status"::"In Process");

                ItemCalculationLoc.SETFILTER("Calculation Status", CalculationFilterStatus);
                ItemCalculationLoc.SETRANGE("Source Code", ItemRec."No.");
                IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc.INIT();
                    CountCalculation += 1;

                    PurchasesSetup.GET();
                    PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                    CalculationDate := WORKDATE();

                    ItemCalculationLoc."Calculation No" := '';
                    ItemCalculationLoc."Calculation Date" := CalculationDate;

                    ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                    ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;
                    ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::Item;
                    ItemCalculationLoc.VALIDATE("Source Code", ItemRec."No.");
                    ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                    ItemCalculationLoc."Calculation Date" := CalculationDate;
                    ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                    ItemCalculationLoc."Init UserID" := USERID;
                    ItemCalculationLoc."Calculatin Init" := TRUE;
                    ItemCalculationLoc."Calculation Status" := ItemCalculationLoc."Calculation Status"::Ordered;
                    ItemCalculationLoc."Generowanie Zbiorcze" := TRUE;

                    ItemBudgetInstance.RESET();
                    ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                    ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                    IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                        ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                        ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                        ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                        ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                    END;
                    ItemCalculationLoc.INSERT();

                END;
            UNTIL ItemRec.NEXT() = 0;
    end;

    procedure GenerateSerialCalculationItem(DefaultInstanceCode: Code[20]; VAR CountCalculation: Integer)
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
        CalculationFilterStatus: Text[300];
    begin
        CountCalculation := 0;

        ItemRec.RESET();
        ItemRec.SETRANGE("AMC Item Budget 2022", TRUE);

        Item_Filter := STRSUBSTNO('%1|%2', ItemRec."AMC Item Type"::Wyroby, ItemRec."AMC Item Type"::"Półprodukt");
        ItemRec.SETFILTER("AMC Item Type", Item_Filter);

        IF ItemRec.FindSet() THEN
            REPEAT
                ItemCalculationLoc.RESET();
                ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);

                CalculationFilterStatus := STRSUBSTNO('%1|%2|%3',
                                                    ItemCalculationLoc."Calculation Status"::New,
                                                    ItemCalculationLoc."Calculation Status"::Ordered,
                                                    ItemCalculationLoc."Calculation Status"::"In Process");

                ItemCalculationLoc.SETFILTER("Calculation Status", CalculationFilterStatus);
                ItemCalculationLoc.SETRANGE("Source Code", ItemRec."No.");
                IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc.INIT();
                    CountCalculation += 1;

                    PurchasesSetup.GET();
                    PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                    CalculationDate := WORKDATE();

                    ItemCalculationLoc."Calculation No" := '';
                    ItemCalculationLoc."Calculation Date" := CalculationDate;

                    ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                    ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;
                    ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::Item;
                    ItemCalculationLoc.VALIDATE("Source Code", ItemRec."No.");
                    ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                    ItemCalculationLoc."Calculation Date" := CalculationDate;
                    ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                    ItemCalculationLoc."Init UserID" := USERID;
                    ItemCalculationLoc."Calculatin Init" := TRUE;
                    ItemCalculationLoc."Calculation Status" := ItemCalculationLoc."Calculation Status"::Ordered;
                    ItemCalculationLoc."Generowanie Zbiorcze" := TRUE;

                    ItemBudgetInstance.RESET();
                    ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                    ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                    IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                        ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                        ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                        ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                        ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                    END;
                    ItemCalculationLoc.INSERT();

                END;

                ItemRec."AMC Item Budget 2022" := FALSE;
                ItemRec.MODIFY();
            UNTIL ItemRec.NEXT() = 0;
    end;

    procedure GenerateCalculationCard(DefaultInstanceCode: Code[20]; VAR CountCalculation: Integer)
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
    begin
        CountCalculation := 0;

        ItemRec.RESET();
        //ItemRec.SETFILTER("No.",'31.119.20|31.192.98|31.173.20');
        ItemRec.SETRANGE(Blocked, FALSE);
        ItemRec.SETRANGE("AMC Item Type", ItemRec."AMC Item Type"::Wyroby);
        ItemRec.SETRANGE("AMC Item Budget 2022", TRUE);
        IF ItemRec.FindSet() THEN
            REPEAT
                ItemCalculationLoc.RESET();
                ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                ItemCalculationLoc.SETRANGE("Source Code", ItemRec."No.");
                IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc.INIT();
                    CountCalculation += 1;

                    PurchasesSetup.GET();
                    PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                    CalculationDate := WORKDATE();

                    ItemCalculationLoc."Calculation No" := '';
                    ItemCalculationLoc."Calculation Date" := CalculationDate;

                    ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                    ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;
                    ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::Item;
                    ItemCalculationLoc.VALIDATE("Source Code", ItemRec."No.");
                    ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                    ItemCalculationLoc."Calculation Date" := CalculationDate;
                    ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                    ItemCalculationLoc."Init UserID" := USERID;
                    ItemCalculationLoc."Calculatin Init" := TRUE;

                    ItemBudgetInstance.RESET();
                    ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                    ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                    IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                        ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                        ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                        ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                        ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                    END;
                    ItemCalculationLoc.INSERT();

                END;
            UNTIL ItemRec.NEXT() = 0;
    end;

    procedure GenerateItemCard(SetItem: Code[20]; DefaultInstanceCode: Code[20]; InitNotes: Text[250])
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
    begin
        IF SetItem = '' THEN
            ERROR(Text_001);

        ItemRec.SETRANGE("AMC Item Type", ItemRec."AMC Item Type"::Wyroby);
        ItemRec.SETRANGE("No.", SetItem);
        IF ItemRec.FINDFIRST() THEN BEGIN
            IF ItemRec.Blocked THEN
                ERROR(Text_002);

            ItemCalculationLoc.RESET();
            ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);
            ItemCalculationLoc.SETRANGE("Source Code", ItemRec."No.");
            ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);
            ItemCalculationLoc.SETFILTER("Calculation Status",
                                        STRSUBSTNO('%1|%2|%3',
                                        ItemCalculationLoc."Calculation Status"::New,
                                        ItemCalculationLoc."Calculation Status"::Ordered,
                                        ItemCalculationLoc."Calculation Status"::"In Process"));
            IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                ItemCalculationLoc.INIT();

                PurchasesSetup.GET();
                PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                CalculationDate := WORKDATE();

                ItemCalculationLoc."Calculation No" := '';
                ItemCalculationLoc."Calculation Date" := CalculationDate;

                ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;
                ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::Item;
                ItemCalculationLoc.VALIDATE("Source Code", ItemRec."No.");
                ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                ItemCalculationLoc."Calculation Date" := CalculationDate;
                ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                ItemCalculationLoc."Init UserID" := USERID;
                ItemCalculationLoc."Calculatin Init" := TRUE;
                ItemCalculationLoc."Init Notes" := InitNotes;

                ItemBudgetInstance.RESET();
                ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                    ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                    ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                    ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                END;
                ItemCalculationLoc.INSERT();
                MESSAGE(Text_003, ItemRec."No.");
            END;
        END ELSE
            MESSAGE(Text_004);
    end;

    procedure GenerateBOMCard(SetBOM: Code[20]; DefaultInstanceCode: Code[20]; InitNotes: Text[250])
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
    begin
        IF SetBOM = '' THEN
            ERROR(Text_101);

        ProductionBOMHeader.SETRANGE("AMC BOM Type", ProductionBOMHeader."AMC BOM Type"::RiD);
        ProductionBOMHeader.SETRANGE("No.", SetBOM);
        IF ProductionBOMHeader.FINDFIRST() THEN BEGIN
            IF ProductionBOMHeader.Status <> ProductionBOMHeader.Status::Certified THEN
                ERROR(Text_102);

            ItemCalculationLoc.RESET();
            ItemCalculationLoc.SETRANGE("Source Type", ItemCalculationLoc."Source Type"::BOM);
            ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);
            ItemCalculationLoc.SETRANGE("Source Code", ProductionBOMHeader."No.");
            ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);
            ItemCalculationLoc.SETFILTER("Calculation Status",
                                        STRSUBSTNO('%1|%2|%3',
                                        ItemCalculationLoc."Calculation Status"::New,
                                        ItemCalculationLoc."Calculation Status"::Ordered,
                                        ItemCalculationLoc."Calculation Status"::"In Process"));
            IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                ItemCalculationLoc.INIT();

                PurchasesSetup.GET();
                PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                CalculationDate := WORKDATE();

                ItemCalculationLoc."Calculation No" := '';
                ItemCalculationLoc."Calculation Date" := CalculationDate;

                ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;
                ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::BOM;
                ItemCalculationLoc.VALIDATE("Source Code", ProductionBOMHeader."No.");
                ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                ItemCalculationLoc."Calculation Date" := CalculationDate;
                ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                ItemCalculationLoc."Init UserID" := USERID;
                ItemCalculationLoc."Calculatin Init" := TRUE;
                ItemCalculationLoc."Init Notes" := InitNotes;

                ItemBudgetInstance.RESET();
                ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                    ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                    ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                    ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                END;
                ItemCalculationLoc.INSERT();
                MESSAGE(Text_003, ProductionBOMHeader."No.");

            END;
        END ELSE
            MESSAGE(Text_004);
    end;

    procedure GenerateRequestCard(BOMType: Option Production,RiD; SetBOM: Code[20]; OptimalisationCode: Code[20]; DefaultInstanceCode: Code[20]; InitNotes: Text[250]; var CalculationCode: Code[20])
    var
        PurchasesSetup: Record "Purchases & Payables Setup";
        ItemCalculationLoc: Record "AMC Item Calculation";
        CalculationDate: Date;
    begin
        IF SetBOM = '' THEN
            ERROR(Text_101);

        CASE BOMType OF
            BOMType::Production:
                ProductionBOMHeader.SETRANGE("AMC BOM Type", ProductionBOMHeader."AMC BOM Type"::Production);
            BOMType::RiD:
                ProductionBOMHeader.SETRANGE("AMC BOM Type", ProductionBOMHeader."AMC BOM Type"::RiD);
        END;

        ProductionBOMHeader.SETRANGE("No.", SetBOM);
        IF ProductionBOMHeader.FINDFIRST() THEN BEGIN
            IF ProductionBOMHeader.Status <> ProductionBOMHeader.Status::Certified THEN
                ERROR(Text_102);

            ItemCalculationLoc.RESET();

            CASE BOMType OF
                BOMType::Production:
                    BEGIN
                        ItemCalculationLoc.SETRANGE("Source Type", ItemCalculationLoc."Source Type"::Item);
                        ItemCalculationLoc.SETRANGE("Source Code", SetBOM);
                    END;
                BOMType::RiD:
                    BEGIN
                        ItemCalculationLoc.SETRANGE("Source Type", ItemCalculationLoc."Source Type"::BOM);
                        ItemCalculationLoc.SETRANGE("Source Code", SetBOM);
                    END;
            END;

            ItemCalculationLoc.SETRANGE("Item Budget Instance", DefaultInstanceCode);
            ItemCalculationLoc.SETRANGE("Init Source", ItemCalculationLoc."Init Source"::Optimalisation);
            ItemCalculationLoc.SETFILTER("Calculation Status",
                                        STRSUBSTNO('%1|%2|%3',
                                        ItemCalculationLoc."Calculation Status"::New,
                                        ItemCalculationLoc."Calculation Status"::Ordered,
                                        ItemCalculationLoc."Calculation Status"::"In Process"));
            IF NOT ItemCalculationLoc.FINDFIRST() THEN BEGIN
                ItemCalculationLoc.INIT();

                PurchasesSetup.GET();
                PurchasesSetup.TESTFIELD("AMC Item Calculation Nos.");
                CalculationDate := WORKDATE();

                ItemCalculationLoc."Calculation No" := '';
                ItemCalculationLoc."Calculation Date" := CalculationDate;

                ItemCalculationLoc."No. Series" := PurchasesSetup."AMC Item Calculation Nos.";

                ItemCalculationLoc."Item Budget Instance" := DefaultInstanceCode;

                CASE BOMType OF
                    BOMType::Production:
                        BEGIN
                            ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::Item;
                            ItemCalculationLoc.VALIDATE("Source Code", SetBOM);
                        END;

                    BOMType::RiD:
                        BEGIN
                            ItemCalculationLoc."Source Type" := ItemCalculationLoc."Source Type"::BOM;
                            ItemCalculationLoc.VALIDATE("Source Code", ProductionBOMHeader."No.");
                        END;
                END;

                ItemCalculationLoc."Calculation Type" := ItemCalculationLoc."Calculation Type"::"wg cennika";
                ItemCalculationLoc."Calculation Date" := CalculationDate;
                ItemCalculationLoc."Init Date Time" := CURRENTDATETIME;
                ItemCalculationLoc."Init UserID" := USERID;
                ItemCalculationLoc."Calculatin Init" := TRUE;
                ItemCalculationLoc."Calculation Status" := ItemCalculationLoc."Calculation Status"::Ordered;
                ItemCalculationLoc."Init Source" := ItemCalculationLoc."Init Source"::Optimalisation;
                ItemCalculationLoc."Optimalisation Code" := OptimalisationCode;
                ItemCalculationLoc."Init Notes" := InitNotes;

                ItemBudgetInstance.RESET();
                ItemBudgetInstance.SETRANGE("Typ Wyceny", ItemBudgetInstance."Typ Wyceny"::"based on price list");
                ItemBudgetInstance.SETRANGE("Item Budget Instance", DefaultInstanceCode);
                IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
                    ItemCalculationLoc."Currency USD Rate" := ItemBudgetInstance."Curency Rate USD";
                    ItemCalculationLoc."Currency EUR Rate" := ItemBudgetInstance."Curency Rate EUR";
                    ItemCalculationLoc."Currency GBP Rate" := ItemBudgetInstance."Curency Rate GBP";
                    ItemCalculationLoc."Currency CHF Rate" := ItemBudgetInstance."Curency Rate CHF";
                END;
                ItemCalculationLoc.INSERT();
                CalculationCode := ItemCalculationLoc."Calculation No";
                MESSAGE(Text_003, ProductionBOMHeader."No.");
            END;
        END ELSE
            MESSAGE(Text_004);
    end;

    var
        ItemRec: Record Item;
        ProductionBOMHeader: Record "Production BOM Header";
        ItemBudgetInstance: Record "AMC Item Budget Instance";
        NoSeriesMgt: Codeunit "No. Series";
        Item_Filter: Text[100];
        Text_001: Label 'Należy wprowadzić kod wycenianego zapasu';
        Text_002: Label 'Zapas %1 zablokowany.\Wycena zapasu wstrzymana.';
        Text_003: Label 'Wykonano Zlecenie Wyceny Zapasu %1';
        Text_004: Label 'Nie wykonano zlecenia żadnej wyceny.';
        Text_101: Label 'Należy wprowadzić kod wycenianego BOMu';
        Text_102: Label 'BOM %1 nie jest certyfikowany.\Wycena zapasu wstrzymana.';
        Text_103: Label 'Wykonano Zlecenie Wyceny BOMu %1';
        Text_201: Label 'Uruchomiono automatyczne generowanie wyceny\bez ustawienia filtru zapasów';
        Text_201a: Label 'Uruchomiono automatyczne generowanie wyceny\dla actywnej sprzedaży bez wskazania Daty Od';
}
