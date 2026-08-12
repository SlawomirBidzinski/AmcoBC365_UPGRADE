page 50054 "AMC Item Budget Specification"
{
    ApplicationArea = All;
    Caption = 'Item Budget Specification';
    PageType = List;
    SourceTable = "AMC Item Budget Details";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ItemBudgetCode; ItemBudgetCode)
                {
                    ApplicationArea = All;
                    Caption = 'Item Budget Code';
                    TableRelation = "AMC Item Budget Instance";

                    trigger OnValidate()
                    begin
                        UpdateFilters();
                        CurrPage.Update(false);
                    end;
                }
                field(SetItemTypeFilter; SetItemTypeFilter)
                {
                    ApplicationArea = All;
                    Caption = 'Set Item Type Filter';

                    trigger OnValidate()
                    begin
                        UpdateFilters();
                        CurrPage.Update(false);
                    end;
                }
                field(SetCurrencyFilter; SetCurrencyFilter)
                {
                    Caption = 'Set Currency Filter';
                    ApplicationArea = All;
                    TableRelation = Currency;

                    trigger OnValidate()
                    begin
                        UpdateFilters();
                        CurrPage.Update(false);
                    end;
                }
                field(SetCurrency; SetCurrency)
                {
                    ApplicationArea = All;
                    Caption = 'Set Currency';
                    TableRelation = Currency;

                    trigger OnValidate()
                    begin
                        IF ItemBudgetCode <> '' THEN
                            Rec.SETRANGE("Item Budget Instance", ItemBudgetCode)
                        ELSE
                            Rec.SETRANGE("Item Budget Instance");

                        CurrPage.Update(false);
                        ;
                    end;
                }
            }
            repeater(BudgetLines)
            {
                ShowCaption = true;
                field("Item Budget Instance"; Rec."Item Budget Instance")
                {
                    ToolTip = 'Specifies the value of the Item Budget Instance field.', Comment = '%';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ToolTip = 'Specifies the value of the Data Obowiązywania field.', Comment = '%';
                }
                field("Item Code"; Rec."Item Code")
                {
                    ToolTip = 'Specifies the value of the Item Code field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Nazwa Zapasu field.', Comment = '%';
                }
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Typ Zapasu field.', Comment = '%';
                }
                field("Block in Autom. Calc"; Rec."Block in Autom. Calc")
                {
                    ToolTip = 'Specifies the value of the Blokuj w Automat. Kalkulacji field.', Comment = '%';
                }
                field("IFF Aromat"; Rec."IFF Aromat")
                {
                    ToolTip = 'Specifies the value of the Aromat IFF field.', Comment = '%';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Kod Jedn. Miary field.', Comment = '%';
                }
                field("Minimum Order Qty"; Rec."Minimum Order Qty")
                {
                    ToolTip = 'Specifies the value of the Min. Ilość Zamówienia field.', Comment = '%';
                }
                field("Item Price Verified"; Rec."Item Price Verified")
                {
                    ToolTip = 'Specifies the value of the Cena zweryfikowana field.', Comment = '%';
                }
                field("Verification Date"; Rec."Verification Date")
                {
                    ToolTip = 'Specifies the value of the Data Weryfikacji field.', Comment = '%';
                }
                field("UserId Verification"; Rec."UserId Verification")
                {
                    ToolTip = 'Specifies the value of the Osoba Weryfikująca field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(UpdateCurrency)
            {
                ApplicationArea = All;
                Image = Currencies;

                trigger OnAction()
                begin
                    IF ItemBudgetCode = '' THEN
                        ERROR(Text_001);

                    IF ItemBudgetInstance.GET(ItemBudgetCode) THEN BEGIN
                        ItemBudgetInstance.TESTFIELD("Curency Rate EUR");
                        ItemBudgetInstance.TESTFIELD("Curency Rate USD");
                        ItemBudgetInstance.TESTFIELD("Curency Rate GBP");
                        ItemBudgetInstance.TESTFIELD("Curency Rate CHF");
                    END;

                    ItemBudgetDetails.RESET();
                    ItemBudgetDetails.SETRANGE("Item Budget Instance", ItemBudgetCode);
                    ItemBudgetDetails.SETFILTER("Unit Cost", '<>0');
                    IF ItemBudgetDetails.FindSet() THEN
                        REPEAT
                            IF ItemBudgetDetails."Item Code" <> Rec."Item Code" THEN BEGIN
                                IF ItemBudgetDetails."Currency Code" <> '' THEN BEGIN
                                    IF ItemBudgetDetails."Currency Code" = 'EUR' THEN
                                        ItemBudgetDetails."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate EUR";

                                    IF ItemBudgetDetails."Currency Code" = 'USD' THEN
                                        ItemBudgetDetails."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate USD";

                                    IF ItemBudgetDetails."Currency Code" = 'GBP' THEN
                                        ItemBudgetDetails."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate GBP";

                                    IF ItemBudgetDetails."Currency Code" = 'CHF' THEN
                                        ItemBudgetDetails."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate CHF";

                                    ItemBudgetDetails."Unit Cost LCY" := (ItemBudgetDetails."Unit Cost" + ItemBudgetDetails."Add. Cost") *
                                                       ItemBudgetDetails."Currency Exchange Rate";

                                    ItemBudgetDetails.MODIFY();
                                END;
                            END ELSE
                                IF Rec."Currency Code" <> '' THEN BEGIN
                                    IF Rec."Currency Code" = 'EUR' THEN
                                        Rec."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate EUR";

                                    IF Rec."Currency Code" = 'USD' THEN
                                        Rec."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate USD";

                                    IF Rec."Currency Code" = 'GBP' THEN
                                        Rec."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate GBP";

                                    IF Rec."Currency Code" = 'CHF' THEN
                                        Rec."Currency Exchange Rate" := ItemBudgetInstance."Curency Rate CHF";

                                    Rec."Unit Cost LCY" := (Rec."Unit Cost" + Rec."Add. Cost") * Rec."Currency Exchange Rate";

                                    Rec.MODIFY();
                                END;
                        UNTIL ItemBudgetDetails.NEXT() = 0;
                end;
            }
            action(Copy)
            {
                ApplicationArea = All;
                Image = CopyBudget;

                trigger OnAction()
                begin
                    IF ItemBudgetCode = '' THEN
                        ERROR(Text_001);

                    CreateItemCostList.SetItemInitReport(ItemBudgetCode);
                    CreateItemCostList.RUN();

                    CurrPage.Update();
                end;
            }
            action(Generate)
            {
                ApplicationArea = All;
                Image = GeneralPostingSetup;

                trigger OnAction()
                begin
                    IF ItemBudgetCode = '' THEN
                        ERROR(Text_001);

                    UpdateItemCostList.SetItemInitReport(ItemBudgetCode);
                    UpdateItemCostList.RUN();

                    CurrPage.Run();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ItemBudgetCode := Rec.GETFILTER("Item Budget Instance");
        Rec.SETRANGE("Currency Code");
        Rec.SETRANGE("Item Type");
    end;

    local procedure UpdateFilters()
    begin
        IF ItemBudgetCode <> '' THEN
            Rec.SETRANGE("Item Budget Instance", ItemBudgetCode)
        ELSE
            Rec.SETRANGE("Item Budget Instance");

        CASE SetItemTypeFilter OF
            SetItemTypeFilter::Surowce:
                Rec.SETRANGE("Item Type", "Item Type"::Inventory);
            SetItemTypeFilter::Opakowania:
                Rec.SETRANGE("Item Type", "Item Type"::"Non-Inventory");
            SetItemTypeFilter::" ":
                Rec.SETRANGE("Item Type");
        END;

        IF SetCurrencyFilter <> '' THEN
            Rec.SETRANGE("Currency Code", SetCurrencyFilter)
        ELSE
            Rec.SETRANGE("Currency Code");

        CurrPage.Update(false);
    end;

    var
        ItemBudgetInstance: Record "AMC Item Budget Instance";
        ItemBudgetDetails: Record "AMC Item Budget Details";
        UpdateItemCostList: Report "AMC Update Item Cost List";
        CreateItemCostList: Report "AMC Create Item Cost List";
        ItemBudgetCode: Code[20];
        SetCurrency: Code[20];
        SetItemTypeFilter: Option " ",Surowce,Opakowania;
        SetCurrencyFilter: Code[20];
        Text_001: Label 'Wybierz najpierw kod Filtru Budżetu Zapasu';
}
