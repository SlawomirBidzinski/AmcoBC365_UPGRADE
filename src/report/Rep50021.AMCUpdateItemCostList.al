report 50021 "AMC Update Item Cost List"
{
    Caption = 'Update Item Cost List';

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
                        TableRelation = "AMC Item Budget Instance";
                        Editable = false;
                    }
                    field(ItemCodeFilter; ItemCodeFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Item Code Filter';
                        TableRelation = Item;
                    }
                    field(ItemTypeFilter; ItemTypeFilter)
                    {
                        ApplicationArea = All;
                        Caption = 'Item Type Filter';
                    }
                    field(SetDateFrom; SetDateFrom)
                    {
                        ApplicationArea = All;
                        Caption = 'Set Date From';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        IF InstanceBudgetCode = '' THEN
            ERROR(Text_001);

        ItemRec.RESET();
        ItemRec.SETRANGE(Blocked, FALSE);
        CASE ItemTypeFilter OF
            ItemTypeFilter::Surowiec:
                ItemRec.SETRANGE("AMC Item Type", ItemRec."AMC Item Type"::Surowce);
            ItemTypeFilter::Opakowanie:
                ItemRec.SETRANGE("AMC Item Type", ItemRec."AMC Item Type"::Opakowania);
            ItemTypeFilter::" ":
                BEGIN
                    ItemTypeFilterTxt := STRSUBSTNO('%1|%2', ItemRec."AMC Item Type"::Surowce, ItemRec."AMC Item Type"::Opakowania);
                    ItemRec.SETFILTER("AMC Item Type", ItemTypeFilterTxt);
                END;
        END;

        IF ItemCodeFilter <> '' THEN
            ItemRec.SETFILTER("No.", ItemCodeFilter);

        IF ItemRec.FindSet() THEN
            REPEAT
                ItemBudgetDetails.RESET();
                ItemBudgetDetails.SETRANGE("Item Budget Instance", InstanceBudgetCode);
                ItemBudgetDetails.SETRANGE("Item Code", ItemRec."No.");
                ItemBudgetDetails.SETRANGE("Unit of Measure Code", ItemRec."Base Unit of Measure");
                //  ItemBudgetDetails.SETRANGE("Minimum Order Qty",0);
                IF NOT ItemBudgetDetails.FINDFIRST() THEN BEGIN
                    ItemBudgetDetails.INIT();
                    ItemBudgetDetails."Item Budget Instance" := InstanceBudgetCode;
                    ItemBudgetDetails.VALIDATE("Item Code", ItemRec."No.");
                    ItemBudgetDetails."Due Date" := SetDateFrom;
                    ItemBudgetDetails."Currency Code" := '';
                    ItemBudgetDetails."Currency Exchange Rate" := 1;
                    ItemBudgetDetails.INSERT();
                END;
            UNTIL ItemRec.NEXT() = 0;
    end;

    procedure SetItemInitReport(Var Set_BudgetInstance: Code[20])
    begin
        InstanceBudgetCode := Set_BudgetInstance;
        SetDateFrom := DMY2Date(1, 1, 2022);
    end;

    var
        ItemBudgetDetails: Record "AMC Item Budget Details";
        ItemRec: Record Item;
        InstanceBudgetCode: Code[20];
        ItemCodeFilter: Code[200];
        ItemTypeFilter: Option " ",Surowiec,Opakowanie;
        ItemTypeFilterTxt: Text[20];
        SetDateFrom: Date;
        Text_001: Label 'Nie można uruchamiać raportu bez podania kodu Instancji Budżetu';
}
