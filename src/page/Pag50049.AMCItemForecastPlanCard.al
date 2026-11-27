page 50049 "AMC Item Forecast Plan. Card"
{
    ApplicationArea = All;
    Caption = 'Item Forecast Planning Card';
    PageType = Document;
    SourceTable = "AMC Forecast Planning Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                group(SetDate)
                {
                    ShowCaption = false;
                    field("Forecast Code"; Rec."Forecast Code")
                    {
                        ApplicationArea = All;
                    }
                    field(Year; Rec.Year)
                    {
                        ApplicationArea = All;
                    }
                    field("Week No."; Rec."Week No.")
                    {
                        ApplicationArea = All;
                    }

                    field("Week Starting Date"; Rec."Week Starting Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Week Ending Date"; Rec."Week Ending Date")
                    {
                        ApplicationArea = All;
                    }
                    field("Previous Week From Date"; Rec."Previous Week From Date")
                    {
                        ApplicationArea = All;
                    }
                    field(LowItemLevel; LowItemLevel)
                    {
                        Caption = 'Show Low Levels';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            FilterLowItems;
                            UpdateForecast();
                            CurrPage.Update(false);
                        end;
                    }
                    field(NoZeroForecast; NoZeroForecast)
                    {
                        Caption = 'Show No Zero Forecast';
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            UpdateForecast();
                            CurrPage.Update(false);
                        end;
                    }
                }
                group(SetWeek)
                {
                    ShowCaption = false;

                    field(SetMonday; Rec."Set Monday")
                    {
                        Caption = 'Set Monday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                    field(SetTuesday; Rec."Set Tuesday")
                    {
                        Caption = 'Set Tuesday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                    field(SetWednesday; Rec."Set Wednesday")
                    {
                        Caption = 'Set Wednesday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                    field(SetThursday; Rec."Set Thursday")
                    {
                        Caption = 'Set Thursday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                    field(SetFriday; Rec."Set Friday")
                    {
                        Caption = 'Set Friday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                    field(SetSaturday; Rec."Set Saturday")
                    {
                        Caption = 'Set Saturday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                    field(SetSunday; Rec."Set Sunday")
                    {
                        Caption = 'Set Sunday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                    }
                }
            }
            group(TotalWeek)
            {
                Caption = 'Week';

                field("Total Monday"; Rec."Total Monday")
                {
                    Caption = 'Total Monday';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Tuesday"; Rec."Total Tuesdey")
                {
                    Caption = 'Total Tuesday';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Wednesday"; Rec."Total Wednesday")
                {
                    Caption = 'Total Wednesday';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Thursday"; Rec."Total Thursday")
                {
                    Caption = 'Total Thursday';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Friday"; Rec."Total Friday")
                {
                    Caption = 'Total Friday';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Saturday"; Rec."Total Saturday")
                {
                    Caption = 'Razem Sb.';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Sunday"; Rec."Total Sunday")
                {
                    Caption = 'Razem Ni.';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }
                field("Total Week Forecast"; Rec."Total Week Forecast")
                {
                    Caption = 'Zapl. w tygod.';
                    ApplicationArea = All;
                    Editable = false;
                    Style = StrongAccent;
                }

            }

            part("AMC Forecast Planning Subpage"; "AMC Forecast Planning Subpage")
            {
                Caption = 'Items';
                SubPageLink = "Forecast Planning No." = field("No.");
                ApplicationArea = All;
            }
            /* group(Stats)
            {
                Caption = 'Cust. Sales Statistics';
                part("AMC Customer Sales Statistics"; "AMC Customer Sales Statistics")
                {
                    ApplicationArea = All;
                    Caption = 'Customer Sales Statistics';

                    SubPageLink = "AMC Item Filter" = FIELD("Item No."),
                              "AMC Date Filter CM" = FIELD("Date Filter CM"),
                              "AMC Date Filter CM-1M" = FIELD("Date Filter CM-1M"),
                              "AMC Date Filter CM-2M" = FIELD("Date Filter CM-2M"),
                              "AMC Date Filter CM-3M" = FIELD("Date Filter CM-3M"),
                              "AMC Date Filter CM-4M" = FIELD("Date Filter CM-4M"),
                              "AMC Date Filter 5M" = FIELD("Date Filter 5M");
                }
            } */
            /* group(OrderLine)
            {
                Caption = 'Sales Orders';
                part("AMC Sales Order Line"; "AMC Sales Order Line")
                {
                    ApplicationArea = All;
                    SubPageLink = Type = CONST(Item), "No." = FIELD("Item No."), "Document Type" = CONST(Order);
                }
            } */

            group(Filters)
            {
                Caption = 'Filters';

                field(DateFilter_CM; DateFilter_CM)
                {
                    Caption = 'Filtr Daty BM';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(DateFilter_CM_1M; DateFilter_CM_1M)
                {
                    Caption = 'Filtr Daty BM-1';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(DateFilter_CM_2M; DateFilter_CM_2M)
                {
                    Caption = 'Filtr Daty BM-2';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(DateFilter_CM_3M; DateFilter_CM_3M)
                {
                    Caption = 'Filtr Daty BM-3';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(DateFilter_CM_4M; DateFilter_CM_4M)
                {
                    Caption = 'Filtr Daty BM-4';
                    ApplicationArea = All;
                    Editable = false;
                }
                field(DateFilter_5M; DateFilter_5M)
                {
                    Caption = 'Filtr Daty 5M';
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Forecast)
            {
                action(Initiate)
                {
                    ApplicationArea = All;
                    Caption = 'Initiate Forecast';
                    Image = Interaction;

                    trigger OnAction()
                    var
                        ForecastPlanningLine: Record "AMC Forecast Planning Line";
                        Item: Record Item;
                        ItemCategory: Record "Item Category";
                        Text001: Label 'Zaniechano Inicjowania Linii Prognozy';
                        Text002: Label 'W okresie %1/%2 znaleziono wygenerowaną prognozę,\czy uzupełnić brakujące linie?';
                    begin
                        ForecastPlanningLine.RESET();
                        ForecastPlanningLine.SETRANGE("Forecast Planning No.", Rec."No.");
                        ForecastPlanningLine.SetRange("Item No.", '');
                        ForecastPlanningLine.DeleteAll();

                        ForecastPlanningLine.SetFilter("Item No.", '<>%1', '');
                        IF not ForecastPlanningLine.IsEmpty THEN BEGIN
                            IF NOT Confirm(StrSubstNo(Text002, Rec.Year, Rec."Week No."), TRUE) THEN
                                Error(Text001);
                        END;

                        if (Rec."Forecast Code" = '') or (Rec.Year = 0) or (Rec."Week No." = 0) then
                            exit;

                        Item.RESET();
                        Item.SETRANGE(Blocked, FALSE);
                        Item.SETRANGE("Replenishment System", Item."Replenishment System"::"Prod. Order");
                        IF Item.FindSet() THEN
                            REPEAT
                                IF (Item."AMC Item Type" <> Item."AMC Item Type"::Próba) AND
                                   (Item."AMC Item Type" <> Item."AMC Item Type"::" ") AND
                                   (not Item."AMC Out Off Item List") THEN BEGIN

                                    Item.TESTFIELD("Item Category Code");
                                    ForecastPlanningLine.RESET();
                                    ForecastPlanningLine.SETRANGE("Forecast Planning No.", Rec."No.");
                                    ForecastPlanningLine.SETRANGE("Item No.", Item."No.");
                                    IF ForecastPlanningLine.IsEmpty THEN BEGIN
                                        ForecastPlanningLine.Init();
                                        ForecastPlanningLine."Forecast Planning No." := Rec."No.";
                                        ForecastPlanningLine."Forecast Code" := Rec."No.";
                                        ForecastPlanningLine.Year := Rec.Year;
                                        ForecastPlanningLine."Week No." := Rec."Week No.";
                                        ForecastPlanningLine."Week Starting Date" := Rec."Week Starting Date";
                                        ForecastPlanningLine."Week Ending Date" := Rec."Week Ending Date";
                                        ForecastPlanningLine."Previous Week From Date" := Rec."Previous Week From Date";

                                        IF ItemCategory.GET(Item."Item Category Code") THEN
                                            ForecastPlanningLine."Location Code" := ItemCategory."AMC Planning Location";

                                        ForecastPlanningLine.Validate("Item No.", Item."No.");
                                        ForecastPlanningLine.Insert();
                                    END;
                                END;
                            UNTIL Item.NEXT() = 0;
                    end;
                }
                action(Update)
                {
                    ApplicationArea = All;
                    Caption = 'Update Forecast';
                    Image = UpdateDescription;

                    trigger OnAction()
                    var
                        ForecastPlanningLine: Record "AMC Forecast Planning Line";
                        Text001: Label 'Zapas %1 posiada nierozpisaną ilość planowania.\ Czy kontynuować?';
                        ConfirmText: Text[200];
                        OldQty: Decimal;
                    begin
                        ProdOrderTemp.RESET();
                        ProdOrderTemp.DELETEALL();
                        CLEAR(ProdOrderTemp);

                        ContrForRemain := FALSE;

                        ForecastPlanningLine.RESET();
                        ForecastPlanningLine.SETRANGE("Forecast Planning No.", Rec."No.");
                        ForecastPlanningLine.SETFILTER("Week Forecast Qty", '<>0');
                        IF ForecastPlanningLine.FindSet() THEN
                            REPEAT
                                RemainForec := ForecastPlanningLine."Week Forecast Qty"
                                                 - ForecastPlanningLine.Monday
                                                 - ForecastPlanningLine.Tuesday
                                                 - ForecastPlanningLine.Wednesday
                                                 - ForecastPlanningLine.Thursday
                                                 - ForecastPlanningLine.Friday
                                                 - ForecastPlanningLine.Saturday
                                                 - ForecastPlanningLine.Sunday;

                                IF RemainForec <> 0 THEN BEGIN
                                    ConfirmText := STRSUBSTNO(Text001, ForecastPlanningLine."Item No.");
                                    IF CONFIRM(ConfirmText, FALSE) THEN
                                        ContrForRemain := TRUE
                                END;
                            UNTIL (ForecastPlanningLine.NEXT() = 0) OR (ContrForRemain);

                        CLEAR(ProdDate);
                        InitProductDate();

                        ForecastPlanningLine.RESET();
                        ForecastPlanningLine.SETRANGE("Forecast Planning No.", Rec."No.");
                        ForecastPlanningLine.SETFILTER("Week Forecast Qty", '<>0');
                        IF ForecastPlanningLine.FindSet() THEN
                            REPEAT
                                IF ForecastPlanningLine.Monday <> 0 THEN
                                    UpdateProdOrder(Rec."Set Monday", ForecastPlanningLine.Monday, ForecastPlanningLine, 1);

                                IF ForecastPlanningLine.Tuesday <> 0 THEN
                                    UpdateProdOrder(Rec."Set Tuesday", ForecastPlanningLine.Tuesday, ForecastPlanningLine, 2);

                                IF ForecastPlanningLine.Wednesday <> 0 Then
                                    UpdateProdOrder(Rec."Set Wednesday", ForecastPlanningLine.Wednesday, ForecastPlanningLine, 3);

                                IF ForecastPlanningLine.Thursday <> 0 THEN
                                    UpdateProdOrder(Rec."Set Thursday", ForecastPlanningLine.Thursday, ForecastPlanningLine, 4);

                                IF ForecastPlanningLine.Friday <> 0 THEN
                                    UpdateProdOrder(Rec."Set Friday", ForecastPlanningLine.Friday, ForecastPlanningLine, 5);

                                IF ForecastPlanningLine.Saturday <> 0 THEN
                                    UpdateProdOrder(Rec."Set Saturday", ForecastPlanningLine.Saturday, ForecastPlanningLine, 6);

                                IF ForecastPlanningLine.Sunday <> 0 THEN
                                    UpdateProdOrder(Rec."Set Sunday", ForecastPlanningLine.Sunday, ForecastPlanningLine, 7);
                            UNTIL ForecastPlanningLine.NEXT = 0;
                        RefreshOrders();
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateForecast();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.InitForecast();
    end;

    trigger OnOpenPage()
    begin
        /* CurrMonth := DATE2DMY(WORKDATE(), 2);

        FirstDayofCM := DMY2DATE(1, CurrMonth, Rec.Year);
        LastDayofCM := CALCDATE('<CM>', WORKDATE());

        IF CurrMonth >= 5 THEN BEGIN
            "FirstDayofCM1" := DMY2DATE(1, CurrMonth - 1, Rec.Year);
            "LastDayofCM1" := CALCDATE('<-1D>', FirstDayofCM);

            "FirstDayofCM2" := DMY2DATE(1, CurrMonth - 2, Rec.Year);
            "LastDayofCM2" := CALCDATE('<-1D>', "FirstDayofCM1");

            "FirstDayofCM3" := DMY2DATE(1, CurrMonth - 3, Rec.Year);
            "LastDayofCM3" := CALCDATE('<-1D>', "FirstDayofCM2");

            "FirstDayofCM4" := DMY2DATE(1, CurrMonth - 4, Rec.Year);
            "LastDayofCM4" := CALCDATE('<-1D>', "FirstDayofCM3");
        END;

        IF CurrMonth = 4 THEN BEGIN
            "FirstDayofCM1" := DMY2DATE(1, CurrMonth - 1, Rec.Year);
            "LastDayofCM1" := CALCDATE('<-1D>', FirstDayofCM);

            "FirstDayofCM2" := DMY2DATE(1, CurrMonth - 2, Rec.Year);
            "LastDayofCM2" := CALCDATE('<-1D>', "FirstDayofCM1");

            "FirstDayofCM3" := DMY2DATE(1, CurrMonth - 3, Rec.Year);
            "LastDayofCM3" := CALCDATE('<-1D>', "FirstDayofCM2");

            "FirstDayofCM4" := DMY2DATE(1, 12, Rec.Year - 1);
            "LastDayofCM4" := CALCDATE('<-1D>', "FirstDayofCM3");
        END;

        IF CurrMonth = 3 THEN BEGIN
            "FirstDayofCM1" := DMY2DATE(1, CurrMonth - 1, Rec.Year);
            "LastDayofCM1" := CALCDATE('<-1D>', FirstDayofCM);

            "FirstDayofCM2" := DMY2DATE(1, CurrMonth - 2, Rec.Year);
            "LastDayofCM2" := CALCDATE('<-1D>', "FirstDayofCM1");

            "FirstDayofCM3" := DMY2DATE(1, 12, Rec.Year - 1);
            "LastDayofCM3" := CALCDATE('<-1D>', "FirstDayofCM2");

            "FirstDayofCM4" := DMY2DATE(1, 11, Rec.Year - 1);
            "LastDayofCM4" := CALCDATE('<-1D>', "FirstDayofCM3");
        END;

        IF CurrMonth = 2 THEN BEGIN
            "FirstDayofCM1" := DMY2DATE(1, CurrMonth - 1, Rec.Year);
            "LastDayofCM1" := CALCDATE('<-1D>', FirstDayofCM);

            "FirstDayofCM2" := DMY2DATE(1, 12, Rec.Year - 1);
            "LastDayofCM2" := CALCDATE('<-1D>', "FirstDayofCM1");

            "FirstDayofCM3" := DMY2DATE(1, 11, Rec.Year - 1);
            "LastDayofCM3" := CALCDATE('<-1D>', "FirstDayofCM2");

            "FirstDayofCM4" := DMY2DATE(1, 10, Rec.Year - 1);
            "LastDayofCM4" := CALCDATE('<-1D>', "FirstDayofCM3");
        END;

        IF CurrMonth = 1 THEN BEGIN
            "FirstDayofCM1" := DMY2DATE(1, 12, Rec.Year - 1);
            "LastDayofCM1" := CALCDATE('<-1D>', FirstDayofCM);

            "FirstDayofCM2" := DMY2DATE(1, 11, Rec.Year - 1);
            "LastDayofCM2" := CALCDATE('<-1D>', "FirstDayofCM1");

            "FirstDayofCM3" := DMY2DATE(1, 10, Rec.Year - 1);
            "LastDayofCM3" := CALCDATE('<-1D>', "FirstDayofCM2");

            "FirstDayofCM4" := DMY2DATE(1, 9, Rec.Year - 1);
            "LastDayofCM4" := CALCDATE('<-1D>', "FirstDayofCM3");
        END; */

        /* Rec.RESET();
        Rec.SETRANGE("Forecast Code", SetForecastCode);
        Rec.SETRANGE(Year, Rec.Year);
        Rec.SETRANGE("Week No.", Rec."Week No.");

        Rec.SETRANGE("Date Filter CM", FirstDayofCM, LastDayofCM);
        DateFilter_CM := StrSubstNo('%1..%2', FirstDayofCM, LastDayofCM);

        Rec.SETRANGE("Date Filter CM-1M", "FirstDayofCM1", "LastDayofCM1");
        DateFilter_CM_1M := StrSubstNo('%1..%2', FirstDayofCM1, LastDayofCM1);

        Rec.SETRANGE("Date Filter CM-2M", "FirstDayofCM2", "LastDayofCM2");
        DateFilter_CM_2M := StrSubstNo('%1..%2', FirstDayofCM2, LastDayofCM2);

        Rec.SETRANGE("Date Filter CM-3M", "FirstDayofCM3", "LastDayofCM3");
        DateFilter_CM_3M := StrSubstNo('%1..%2', FirstDayofCM3, LastDayofCM3);

        Rec.SETRANGE("Date Filter CM-4M", "FirstDayofCM4", "LastDayofCM4");
        DateFilter_CM_4M := StrSubstNo('%1..%2', FirstDayofCM4, LastDayofCM4);

        Rec.SETRANGE("Date Filter 5M", "FirstDayofCM4", LastDayofCM);
        DateFilter_5M := StrSubstNo('%1..%2', FirstDayofCM4, LastDayofCM);*/

        //IF Rec."Week No." > 1 THEN
        //    Rec.SETRANGE("Prev. Forecast Filter", (Rec."Week No." - 1)); 
    end;

    local procedure UpdateProdOrder(SetDoW: Boolean; Qty: Decimal;
                                   ForecastPlanningLine: Record "AMC Forecast Planning Line"; DoW: Integer)
    var
        ProdOrder: Record "Production Order";
        MfgSetup: Record "Manufacturing Setup";
        NoSeriesMgt: Codeunit "No. Series";
        OldQty: Decimal;
    begin
        MfgSetup.Get();

        ProdOrder.RESET();
        ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanningLine.Year);
        ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanningLine."Week No.");
        ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
        ProdOrder.SETRANGE("Source No.", ForecastPlanningLine."Item No.");
        ProdOrder.SETRANGE("Due Date", ProdDate[DoW]);
        IF ProdOrder.FINDFIRST() THEN BEGIN
            OldQty := ProdOrder.Quantity;
            ProdOrder.VALIDATE(Quantity, Qty);
            ProdOrder."Last Date Modified" := WORKDATE();
            ProdOrder."AMC Planning Creation User Id" := USERID;
            ProdOrder."AMC Forecast Order" := NOT Rec."Set Monday";
            ProdOrder.MODIFY();

            IF OldQty <> ProdOrder.Quantity THEN
                RefreshOrder(ProdOrder);
        END ELSE BEGIN
            ProdOrder.INIT();
            ProdOrder.Status := ProdOrder.Status::"Firm Planned";

            ProdOrder."No." := NoSeriesMgt.GetNextNo(
                MfgSetup."Firm Planned Order Nos.",
                ProdOrder."Due Date", true);
            ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

            ProdOrder."Location Code" := ForecastPlanningLine."Location Code";
            ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
            ProdOrder.VALIDATE("Source No.", ForecastPlanningLine."Item No.");
            ProdOrder."AMC Update End Time" := TRUE;
            ProdOrder.INSERT();

            ProdOrder.VALIDATE("Due Date", ProdDate[DoW]);
            ProdOrder.VALIDATE(Quantity, Qty);

            ProdOrder."AMC Forecast Planning Year" := Rec.Year;
            ProdOrder."AMC Forecast Planning Week" := Rec."Week No.";
            ProdOrder."AMC Planning Creation User Id" := USERID;
            ProdOrder."AMC Forecast Order" := NOT SetDoW;
            ProdOrder."Creation Date" := WORKDATE();
            ProdOrder."Last Date Modified" := WORKDATE();
            ProdOrder."AMC Planning Creation Date" := WORKDATE();
            ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
            ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
            ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
            ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");
            ProdOrder.MODIFY();
            RefreshOrder(ProdOrder);
        END;
    end;

    local procedure UpdateForecast()
    begin
        Rec."Set Monday" := false;
        /*SetWt := FALSE;
        SetSr := FALSE;
        SetCz := FALSE;
        SetPt := FALSE;
        SetSb := FALSE;
        SetNi := FALSE;

        IF Rec.Year < 100 THEN
            Rec.Year := 2000 + Rec.Year;

        //RESET;
        Rec.SETRANGE("Forecast Code", SetForecastCode);
        Rec.SETRANGE(Year, Rec.Year);
        Rec.SETRANGE("Week No.", Rec."Week No.");
        IF Rec."Week No." > 1 THEN
            Rec.SETRANGE("Prev. Forecast Filter", (Rec."Week No." - 1));

        SetDateFrom := DWY2DATE(1, Rec."Week No.", Rec.Year);
        SetDateTo := DWY2DATE(7, Rec."Week No.", Rec.Year);

        //IF RemainingForecast < 0 THEN
        //  "Week Forecast Qty":="Week Forecast Qty" - RemainingForecast;

        IF NoZeroForecast = TRUE THEN BEGIN
            ItemRec.RESET();
            ItemRec.SETRANGE("Replenishment System", ItemRec."Replenishment System"::"Prod. Order");
            ItemRec.SETFILTER("AMC Production Forecast", '<>0');
            IF ItemRec.FINDFIRST() THEN
                Rec.SETFILTER("Week Forecast Qty", '<>0')
            ELSE
                Rec.SETRANGE("Week Forecast Qty");
        END ELSE
            Rec.SETRANGE("Week Forecast Qty");

        ForecastPlanning.RESET();
        ForecastPlanning.SETRANGE("Forecast Code", Rec."Forecast Code");
        ForecastPlanning.SETRANGE(Year, Rec.Year);
        ForecastPlanning.SETRANGE("Week No.", Rec."Week No.");
        IF ForecastPlanning.FINDSet() THEN
            REPEAT
                IF ForecastPlanning."Set Monday" = TRUE THEN
                    SetPn := TRUE;
                IF ForecastPlanning."Set Tuesdy" = TRUE THEN
                    SetWt := TRUE;
                IF ForecastPlanning."Set Wednesday" = TRUE THEN
                    SetSr := TRUE;
                IF ForecastPlanning."Set Thursday" = TRUE THEN
                    SetCz := TRUE;
                IF ForecastPlanning."Set Friday" = TRUE THEN
                    SetPt := TRUE;
                IF ForecastPlanning."Set Saturday" = TRUE THEN
                    SetSb := TRUE;
                IF ForecastPlanning."Set Sunday" = TRUE THEN
                    SetNi := TRUE;
            UNTIL ForecastPlanning.NEXT() = 0; */
    end;

    local procedure FilterLowItems()
    begin
        /* IF LowItemLevel = TRUE THEN BEGIN
            ItemRec.RESET();
            ItemRec.SETRANGE("Replenishment System", ItemRec."Replenishment System"::"Prod. Order");
            ItemRec.SETFILTER("Reorder Point", '<>0');
            IF ItemRec.FINDSet() THEN
                REPEAT
                    ItemRec.CALCFIELDS("AMC Items on M.GL");
                    IF ItemRec."AMC Items on M.GL" < ItemRec."Reorder Point" THEN
                        IF Rec.GET(SetForecastCode, Rec.Year, Rec."Week No.", ItemRec."No.") THEN
                            Rec.MARK(TRUE);
                UNTIL ItemRec.NEXT() = 0;
        END ELSE BEGIN
            ItemRec.RESET();
            IF Rec.FINDSet() THEN
                REPEAT
                    Rec.MARK(FALSE);
                UNTIL Rec.NEXT() = 0;
        END;

        IF LowItemLevel THEN
            Rec.MARKEDONLY(TRUE)
        ELSE
            Rec.MARKEDONLY(FALSE);

        CurrPage.UPDATE(); */
    end;

    local procedure InitProductDate()
    begin
        ProdDate[1] := DWY2DATE(1, Rec."Week No.", Rec.Year);
        ProdDate[2] := DWY2DATE(2, Rec."Week No.", Rec.Year);
        ProdDate[3] := DWY2DATE(3, Rec."Week No.", Rec.Year);
        ProdDate[4] := DWY2DATE(4, Rec."Week No.", Rec.Year);
        ProdDate[5] := DWY2DATE(5, Rec."Week No.", Rec.Year);
        ProdDate[6] := DWY2DATE(6, Rec."Week No.", Rec.Year);
        ProdDate[7] := DWY2DATE(7, Rec."Week No.", Rec.Year);
    end;

    local procedure RefreshOrder(Var lProdOrder: Record "Production Order")
    var
        lrProdOrderTemp: Record "Production Order";
        lrProditem: Record Item;
        lrProdBom: Record "Production BOM Header";
        lrProdrouting: Record "Routing Header";
        lRunStatus: Boolean;
    begin
        lRunStatus := TRUE;

        lrProditem.GET(lProdOrder."Source No.");
        IF lrProdBom.GET(lrProditem."Production BOM No.") THEN
            IF lrProdBom.Status <> lrProdBom.Status::Certified THEN
                lRunStatus := FALSE;

        IF lrProdrouting.GET(lrProditem."Routing No.") THEN
            IF lrProdrouting.Status <> lrProdrouting.Status::Certified THEN
                lRunStatus := FALSE;

        IF lProdOrder.Status.AsInteger() > 2 THEN lRunStatus := FALSE;

        IF lRunStatus = TRUE THEN BEGIN
            ProdOrderTemp.INIT();
            ProdOrderTemp.Status := lProdOrder.Status;
            ProdOrderTemp."No." := lProdOrder."No.";
            ProdOrderTemp.INSERT();
        END;
    end;

    local procedure RefreshOrders()
    var
        ProdOrder: Record "Production Order";
    begin
        ProdOrderTemp.RESET();
        IF ProdOrderTemp.FINDSET() THEN
            REPEAT
                ProdOrder.SETRANGE(Status, ProdOrderTemp.Status);
                ProdOrder.SETRANGE("No.", ProdOrderTemp."No.");
                REPORT.RUN(REPORT::"Refresh Production Order", FALSE, FALSE, ProdOrder);
            UNTIL ProdOrderTemp.NEXT() = 0;
    end;

    var
        ProdOrderTemp: Record "Production Order" temporary;
        ProdForectEntry: Record "Production Forecast Entry";

        ItemList: Page "Item List";
        ForecastPlanningList: Report "AMC Forecast Planning List";
        RemainingForecast: Decimal;
        NoZeroForecast: Boolean;
        LowItemLevel: Boolean;
        EntryNo: Integer;
        SetDeleteLine: Boolean;
        ProdDate: array[7] of Date;
        ProdOrderNo: Code[20];
        RemainForec: Decimal;
        ContrForRemain: Boolean;
        FirstDayofCM: Date;
        FirstDayofCM1: Date;
        FirstDayofCM2: Date;
        FirstDayofCM3: Date;
        FirstDayofCM4: Date;
        LastDayofCM: Date;
        LastDayofCM1: Date;
        LastDayofCM2: Date;
        LastDayofCM3: Date;
        LastDayofCM4: Date;
        CurrMonth: Integer;
        SetLotQty: Decimal;
        SetMinimStock: Decimal;
        SetMaximStok: Decimal;
        QuestConfirm: Text[200];
        DateFilter_CM: Text[100];
        DateFilter_CM_1M: Text[100];
        DateFilter_CM_2M: Text[100];
        DateFilter_CM_3M: Text[100];
        DateFilter_CM_4M: Text[100];
        DateFilter_5M: Text[100];

        Text_001: Label 'Prognozy zawierają planowaną produkcję \ Czy usunąć oznaczone linie?';


        Text_004: Label 'Czy przypisać Ilość %1 \do Szarży Produkcji Zapasu: %2?';
        Text_005: Label 'Zaniechano zmiany Szarży Produkcji.';
        Text_006: Label 'Czy przypisać Ilość %1 \do Minimalnego Stanu Zapasu: %2?';
        Text_007: Label 'Zaniechano zmiany Bezpiecznego Stanu Wyrobu.';

        Text_009: Label 'Czy przypisać Ilość %1 \do Maks. Stoku Zapasu: %2?';
        Text_010: Label 'Zaniechano zmiany Maksymalnego Stoku Zapasu.';
}
