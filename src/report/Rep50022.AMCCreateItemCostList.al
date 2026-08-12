report 50022 "AMC Create Item Cost List"
{
    Caption = 'Create Item Cost List';
    ProcessingOnly = True;
    ApplicationArea = All;

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    Caption = 'Options';

                    field(InstanceBudgetCode; InstanceBudgetCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Instance Budget Code';
                        Editable = false;
                        TableRelation = "AMC Item Budget Instance";
                    }
                    field(Set_NewInstanceCode; Set_NewInstanceCode)
                    {
                        ApplicationArea = All;
                        Caption = 'New Instance Budget Code';
                    }
                    field(Set_NewDateFrom; Set_NewDateFrom)
                    {
                        ApplicationArea = All;
                        Caption = 'New Date From';
                    }
                    field(Set_NewInstanceName; Set_NewInstanceName)
                    {
                        ApplicationArea = All;
                        Caption = 'New Instance Name';
                    }
                    field(Set_EUR; Set_EUR)
                    {
                        ApplicationArea = All;
                        Caption = 'EUR Curr. Code';
                    }
                    field(Set_USD; Set_USD)
                    {
                        ApplicationArea = All;
                        Caption = 'USD Curr. Code';
                    }
                    field(Set_GBP; Set_GBP)
                    {
                        ApplicationArea = All;
                        Caption = 'GBP Curr. Code';
                    }
                    field(Set_CHF; Set_CHF)
                    {
                        ApplicationArea = All;
                        Caption = 'CHF Curr. Code';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        IF InstanceBudgetCode = '' THEN
            ERROR(Text_001);

        IF Set_NewInstanceCode = '' THEN
            ERROR(Text_002);

        IF (Set_USD = 0) OR
           (Set_EUR = 0) OR
           (Set_GBP = 0) OR
           (Set_CHF = 0) THEN
            ERROR(Text_004);

        NewItemBudgetInstance.RESET();
        NewItemBudgetInstance.SETRANGE("Item Budget Instance", Set_NewInstanceCode);
        IF NewItemBudgetInstance.FINDFIRST() THEN
            ERROR(Text_003, Set_NewInstanceCode);

        Set_Question := STRSUBSTNO(Text_005, Set_NewInstanceCode, InstanceBudgetCode);

        IF NOT CONFIRM(Set_Question, FALSE) THEN
            ERROR(Text_006);

        ItemBudgetInstance.RESET();
        ItemBudgetInstance.SETRANGE("Item Budget Instance", InstanceBudgetCode);
        IF ItemBudgetInstance.FINDFIRST() THEN BEGIN

            NewItemBudgetInstance.INIT();
            NewItemBudgetInstance."Item Budget Instance" := Set_NewInstanceCode;
            NewItemBudgetInstance."Date From" := Set_NewDateFrom;
            NewItemBudgetInstance."Item Budget Name" := Set_NewInstanceName;

            NewItemBudgetInstance."Default Instance" := TRUE;
            NewItemBudgetInstance."Curency Rate EUR" := Set_EUR;
            NewItemBudgetInstance."Curency Rate USD" := Set_USD;
            NewItemBudgetInstance."Curency Rate GBP" := Set_GBP;
            NewItemBudgetInstance."Curency Rate CHF" := Set_CHF;
            NewItemBudgetInstance."Typ Wyceny" := ItemBudgetInstance."Typ Wyceny";

            NewItemBudgetInstance.INSERT();

            ItemBudgetInstance."Default Instance" := FALSE;
            ItemBudgetInstance.MODIFY();

            ItemBudgetDetails.RESET();
            ItemBudgetDetails.SETRANGE("Item Budget Instance", InstanceBudgetCode);
            IF ItemBudgetDetails.FindSet() THEN
                REPEAT
                    NewItemBudgetDetails.INIT();
                    NewItemBudgetDetails.TRANSFERFIELDS(ItemBudgetDetails);

                    NewItemBudgetDetails."Item Budget Instance" := Set_NewInstanceCode;

                    IF NewItemBudgetDetails."Currency Code" <> '' THEN BEGIN
                        IF NewItemBudgetDetails."Currency Code" = 'EUR' THEN
                            NewItemBudgetDetails."Currency Exchange Rate" := Set_EUR;

                        IF NewItemBudgetDetails."Currency Code" = 'USD' THEN
                            NewItemBudgetDetails."Currency Exchange Rate" := Set_USD;

                        IF NewItemBudgetDetails."Currency Code" = 'GBP' THEN
                            NewItemBudgetDetails."Currency Exchange Rate" := Set_GBP;

                        IF NewItemBudgetDetails."Currency Code" = 'CHF' THEN
                            NewItemBudgetDetails."Currency Exchange Rate" := Set_CHF;

                        NewItemBudgetDetails."Unit Cost LCY" := (NewItemBudgetDetails."Unit Cost" + NewItemBudgetDetails."Add. Cost") *
                                                               NewItemBudgetDetails."Currency Exchange Rate";

                        NewItemBudgetDetails."Item Price Verified" := FALSE;
                        NewItemBudgetDetails."Verification Date" := 0DT;
                        NewItemBudgetDetails."UserId Verification" := '';
                    END;
                    NewItemBudgetDetails.INSERT();
                UNTIL ItemBudgetDetails.NEXT() = 0;
        END;
    end;

    procedure SetItemInitReport(Var Set_BudgetInstance: Code[20])
    begin
        InstanceBudgetCode := Set_BudgetInstance;
        ItemBudgetInstance.RESET();
        ItemBudgetInstance.SETRANGE("Item Budget Instance", Set_BudgetInstance);
        IF ItemBudgetInstance.FINDFIRST() THEN BEGIN
            Set_USD := ItemBudgetInstance."Curency Rate USD";
            Set_EUR := ItemBudgetInstance."Curency Rate EUR";
            Set_GBP := ItemBudgetInstance."Curency Rate GBP";
            Set_CHF := ItemBudgetInstance."Curency Rate CHF";

            Set_NewInstanceName := ItemBudgetInstance."Item Budget Name";
        END;
        Set_NewDateFrom := DMY2DATE(1, DATE2DMY(WORKDATE(), 2), DATE2DMY(WORKDATE(), 3));
    end;

    var
        ItemBudgetDetails: Record "AMC Item Budget Details";
        NewItemBudgetDetails: Record "AMC Item Budget Details";
        ItemBudgetInstance: Record "AMC Item Budget Instance";
        NewItemBudgetInstance: Record "AMC Item Budget Instance";
        ItemRec: Record Item;
        InstanceBudgetCode: Code[20];
        ItemCodeFilter: Code[200];
        ItemTypeFilter: Option " ",Surowiec,Opakowanie;
        ItemTypeFilterTxt: Text[20];
        Set_Question: Text[200];
        Set_NewDateFrom: Date;
        Set_NewInstanceCode: Code[20];
        Set_NewInstanceName: Text[100];
        Set_USD: Decimal;
        Set_EUR: Decimal;
        Set_GBP: Decimal;
        Set_CHF: Decimal;
        Text_001: Label 'Nie można uruchamiać raportu bez podania kodu Instancji Budżetu';
        Text_002: Label 'Przed uruchomieniem raportu wprowadź Nowy kod Instancji Budżetu';
        Text_003: Label 'Kod Instancji Budżetu %1 już istnieje.\Wprowadź nowy kod.';
        Text_004: Label 'Kursy przeliczeniowe walut nie mogą być równe 0,0000';
        Text_005: Label 'Czy utworzyć Kod Instacji %1 i\skopiować cennik zapasów z instancji %2?';
        Text_006: Label 'Zaniechano kopiowania cennika.';
}
