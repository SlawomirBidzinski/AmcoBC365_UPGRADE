page 50049 "AMC Item Forecast Plan. Card"
{
    ApplicationArea = All;
    Caption = 'Item Forecast Planning Card';
    PageType = Document;
    SourceTable = "AMC Forecast Planning Header";
    DelayedInsert = true;

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
                            UpdateForDay();
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
                            UpdateForDay();
                            UpdateForecast();
                            CurrPage.Update(false);
                        end;
                    }
                }
                group(SetWeek)
                {
                    ShowCaption = false;

                    field(SetPn; SetPn)
                    {
                        Caption = 'Set Monday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                    field(SetWt; SetWt)
                    {
                        Caption = 'Set Tuesday';
                        ApplicationArea = All;
                        Style = StrongAccent;
                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                    field(SetSr; SetSr)
                    {
                        Caption = 'Set Wednesday';
                        ApplicationArea = All;

                        Style = StrongAccent;
                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                    field(SetCz; SetCz)
                    {
                        Caption = 'Set Thursday';
                        ApplicationArea = All;

                        Style = StrongAccent;

                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                    field(SetPt; SetPt)
                    {
                        Caption = 'Set Friday';
                        ApplicationArea = All;

                        Style = StrongAccent;
                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                    field(SetSb; SetSb)
                    {
                        Caption = 'Set Saturday';
                        ApplicationArea = All;

                        Style = StrongAccent;
                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                    field(SetNi; SetNi)
                    {
                        Caption = 'Set Sunday';
                        ApplicationArea = All;

                        Style = StrongAccent;
                        trigger OnValidate()
                        begin
                            UpdateForDay();
                        end;
                    }
                }
                group(TotalWeek)
                {
                    ShowCaption = false;

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
                }
                group(TotalWeek2)
                {

                    ShowCaption = false;

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
            }
            part("AMC Forecast Planning Subpage"; "AMC Forecast Planning Subpage")
            {
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
                    begin
                        /* ForecPlanning.RESET();
                        ForecPlanning.SETRANGE("Forecast Code", SetForecastCode);
                        ForecPlanning.SETRANGE(Year, Rec.Year);
                        ForecPlanning.SETRANGE("Week No.", Rec."Week No.");
                        ForecPlanning.SetRange("Item No.", '');
                        ForecPlanning.DeleteAll();

                        ForecPlanning.RESET();
                        ForecPlanning.SETRANGE("Forecast Code", SetForecastCode);
                        ForecPlanning.SETRANGE(Year, Rec.Year);
                        ForecPlanning.SETRANGE("Week No.", Rec."Week No.");
                        ForecPlanning.SetFilter("Item No.", '<>%1', '');
                        IF ForecPlanning.FINDFIRST() THEN BEGIN
                            Question2 := STRSUBSTNO(Text_008, Rec.Year, Rec."Week No.");
                            IF NOT CONFIRM(Question2, TRUE) THEN
                                ERROR('Zaniechano Inicjowania Linii Prognozy');
                        END;

                        IF (Rec.Year <> 0) AND (Rec."Week No." <> 0) AND (SetForecastCode <> '') THEN BEGIN
                            ItemRec.RESET();
                            ItemRec.SETRANGE(Blocked, FALSE);
                            ItemRec.SETRANGE("Replenishment System", ItemRec."Replenishment System"::"Prod. Order");
                            IF ItemRec.FINDSet() THEN
                                REPEAT
                                    IF (ItemRec."AMC Item Type" <> ItemRec."AMC Item Type"::Próba) AND
                                       (ItemRec."AMC Item Type" <> ItemRec."AMC Item Type"::" ") AND
                                       (ItemRec."AMC Out Off Item List" = FALSE) THEN BEGIN

                                        ItemRec.TESTFIELD("Item Category Code");
                                        ForecPlanning.RESET();
                                        ForecPlanning.SETRANGE("Forecast Code", SetForecastCode);
                                        ForecPlanning.SETRANGE(Year, Rec.Year);
                                        ForecPlanning.SETRANGE("Week No.", Rec."Week No.");
                                        ForecPlanning.SETRANGE("Item No.", ItemRec."No.");
                                        IF NOT ForecPlanning.FINDFIRST() THEN BEGIN
                                            Rec.INIT();
                                            Rec."Forecast Code" := SetForecastCode;
                                            Rec.Year := Rec.Year;
                                            Rec."Week No." := Rec."Week No.";
                                            Rec."Week From Day" := SetDateFrom;
                                            Rec."Previous Week From Date" := CALCDATE('<-7D>', SetDateFrom);
                                            ItemCategory.RESET();
                                            IF ItemCategory.GET(ItemRec."Item Category Code") THEN
                                                Rec."Location Code" := ItemCategory."AMC Planning Location";

                                            Rec.VALIDATE("Item No.", ItemRec."No.");
                                            Rec.INSERT();
                                        END;
                                    END;
                                UNTIL ItemRec.NEXT() = 0;
                        END; */
                    end;
                }
                action(Update)
                {
                    ApplicationArea = All;
                    Caption = 'Update Forecast';
                    Image = UpdateDescription;

                    trigger OnAction()
                    var
                        ConfirmText: Text[200];
                        OldQty: Decimal;
                    begin
                        /* //---AL.06Jun13
                        ProdOrderTemp.RESET();
                        ProdOrderTemp.DELETEALL();
                        CLEAR(ProdOrderTemp);
                        //---AL.06Jun13

                        ContrForRemain := FALSE;

                        ForecastPlanning.RESET();
                        ForecastPlanning.SETRANGE("Forecast Code", Rec."Forecast Code");
                        ForecastPlanning.SETRANGE(Year, Rec.Year);
                        ForecastPlanning.SETRANGE("Week No.", Rec."Week No.");
                        ForecastPlanning.SETFILTER("Week Forecast Qty", '<>0');

                        IF ForecastPlanning.FINDSet() THEN
                            REPEAT
                                RemainForec := ForecastPlanning."Week Forecast Qty"
                                                 - ForecastPlanning.Monday
                                                 - ForecastPlanning.Tuesday
                                                 - ForecastPlanning.Wednesday
                                                 - ForecastPlanning.Thursday
                                                 - ForecastPlanning.Friday
                                                 - ForecastPlanning.Saturday
                                                 - ForecastPlanning.Sunday;

                                IF RemainForec <> 0 THEN BEGIN
                                    ConfirmText := STRSUBSTNO(Text_003, ForecastPlanning."Item No.");
                                    IF CONFIRM(ConfirmText, FALSE) THEN
                                        ContrForRemain := TRUE
                                END;
                            UNTIL (ForecastPlanning.NEXT() = 0) OR (ContrForRemain = TRUE);

                        CLEAR(ProdDate);
                        InitProductDate();
                        MfgSetup.GET();

                        ForecastPlanning.RESET();
                        ForecastPlanning.SETRANGE("Forecast Code", Rec."Forecast Code");
                        ForecastPlanning.SETRANGE(Year, Rec.Year);
                        ForecastPlanning.SETRANGE("Week No.", Rec."Week No.");
                        ForecastPlanning.SETFILTER("Week Forecast Qty", '<>0');
                        IF ForecastPlanning.FINDSet() THEN
                            REPEAT
                                IF ForecastPlanning.Monday <> 0 THEN BEGIN

                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder.SETRANGE("Due Date", ProdDate[1]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Monday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Monday";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13
                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(
                                            MfgSetup."Firm Planned Order Nos.",
                                            ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;
                                        ProdOrder.INSERT();

                                        ProdOrder.VALIDATE("Due Date", ProdDate[1]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Monday);

                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Monday";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END;
                                END;

                                IF ForecastPlanning.Tuesday <> 0 THEN BEGIN

                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder.SETRANGE("Due Date", ProdDate[2]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13

                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Tuesday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Tuesdy";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13
                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Firm Planned Order Nos.", ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;

                                        ProdOrder.INSERT();
                                        ProdOrder.VALIDATE("Due Date", ProdDate[2]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Tuesday);

                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Tuesdy";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13
                                    END;
                                END;

                                IF ForecastPlanning.Wednesday <> 0 THEN BEGIN
                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder.SETRANGE("Due Date", ProdDate[3]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13

                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Wednesday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Wednesday";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Firm Planned Order Nos.", ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;
                                        ProdOrder.INSERT();

                                        ProdOrder.VALIDATE("Due Date", ProdDate[3]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Wednesday);

                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Wednesday";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END;
                                END;

                                IF ForecastPlanning.Thursday <> 0 THEN BEGIN
                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder.SETRANGE("Due Date", ProdDate[4]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13

                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Thursday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Thursday";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Firm Planned Order Nos.", ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;
                                        ProdOrder.INSERT();

                                        ProdOrder.VALIDATE("Due Date", ProdDate[4]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Thursday);

                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Thursday";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END;
                                END;

                                IF ForecastPlanning.Friday <> 0 THEN BEGIN
                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder.SETRANGE("Due Date", ProdDate[5]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13

                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Friday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID();
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Friday";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Firm Planned Order Nos.", ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;
                                        ProdOrder.INSERT();

                                        ProdOrder.VALIDATE("Due Date", ProdDate[5]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Friday);

                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Friday";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13
                                    END;
                                END;

                                IF ForecastPlanning.Saturday <> 0 THEN BEGIN
                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder."AMC Update End Time" := TRUE;
                                    ProdOrder.SETRANGE("Due Date", ProdDate[6]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13

                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Saturday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Saturday";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Firm Planned Order Nos.", ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;
                                        //---AL.03Jun13
                                        ProdOrder."AMC For Demand" := TRUE;
                                        //+++AL.03Jun13
                                        ProdOrder.INSERT();

                                        ProdOrder.VALIDATE("Due Date", ProdDate[6]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Saturday);
                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Saturday";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END;
                                END;

                                IF ForecastPlanning.Sunday <> 0 THEN BEGIN

                                    ProdOrder.RESET();
                                    ProdOrder.SETRANGE("AMC Forecast Planning Year", ForecastPlanning.Year);
                                    ProdOrder.SETRANGE("AMC Forecast Planning Week", ForecastPlanning."Week No.");
                                    ProdOrder.SETRANGE("Source Type", ProdOrder."Source Type"::Item);
                                    ProdOrder.SETRANGE("Source No.", ForecastPlanning."Item No.");
                                    ProdOrder."AMC Update End Time" := TRUE;
                                    ProdOrder.SETRANGE("Due Date", ProdDate[7]);
                                    IF ProdOrder.FINDFIRST() THEN BEGIN
                                        //---AL.05Jun13
                                        OldQty := ProdOrder.Quantity;
                                        //+++AL.05Jun13

                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Sunday);
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Saturday";
                                        ProdOrder.MODIFY();
                                        //---AL.03Jan13
                                        IF OldQty <> ProdOrder.Quantity THEN
                                            RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END ELSE BEGIN
                                        ProdOrder.INIT();
                                        ProdOrder.Status := ProdOrder.Status::"Firm Planned";

                                        ProdOrder."No." := NoSeriesMgt.GetNextNo(MfgSetup."Firm Planned Order Nos.", ProdOrder."Due Date", true);
                                        ProdOrder."No. Series" := MfgSetup."Firm Planned Order Nos.";

                                        ProdOrder."Location Code" := ForecastPlanning."Location Code";
                                        ProdOrder."Source Type" := ProdOrder."Source Type"::Item;
                                        ProdOrder.VALIDATE("Source No.", ForecastPlanning."Item No.");
                                        ProdOrder."AMC Update End Time" := TRUE;
                                        ProdOrder.INSERT();

                                        ProdOrder.VALIDATE("Due Date", ProdDate[7]);
                                        ProdOrder.VALIDATE(Quantity, ForecastPlanning.Sunday);

                                        ProdOrder."AMC Forecast Planning Year" := ForecastPlanning.Year;
                                        ProdOrder."AMC Forecast Planning Week" := ForecastPlanning."Week No.";
                                        ProdOrder."AMC Planning Creation User Id" := USERID;
                                        ProdOrder."AMC Forecast Order" := NOT ForecastPlanning."Set Saturday";
                                        ProdOrder."Creation Date" := WORKDATE();
                                        ProdOrder."Last Date Modified" := WORKDATE();
                                        ProdOrder."AMC Planning Creation Date" := WORKDATE();
                                        ProdOrder."Starting Time" := MfgSetup."Normal Starting Time";
                                        ProdOrder."Ending Time" := MfgSetup."Normal Ending Time";
                                        ProdOrder."Starting Date-Time" := CREATEDATETIME(ProdOrder."Starting Date", ProdOrder."Starting Time");
                                        ProdOrder."Ending Date-Time" := CREATEDATETIME(ProdOrder."Ending Date", ProdOrder."Ending Time");

                                        ProdOrder.MODIFY;
                                        //---AL.03Jan13
                                        RefreshOrder(ProdOrder);
                                        //+++AL.03Jan13

                                    END;
                                END;
                            UNTIL ForecastPlanning.NEXT = 0;
                        RefreshOrders(); */
                    end;
                }
            }
        }
        area(Reporting)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';

                trigger OnAction()
                var
                    Filter_Pn: Text[50];
                    Filter_Wt: Text[50];
                    Filter_Sr: Text[50];
                    Filter_Cz: Text[50];
                    Filter_Pt: Text[50];
                    SetDay: Enum "AMC Day of Week";
                begin
                    /* Filter_Pn := Rec.GETFILTER(Monday);
                    Filter_Wt := Rec.GETFILTER(Tuesday);
                    Filter_Sr := Rec.GETFILTER(Wednesday);
                    Filter_Cz := Rec.GETFILTER(Thursday);
                    Filter_Pt := Rec.GETFILTER(Friday);

                    IF Filter_Pn <> '' THEN
                        SetDay := SetDay::Pn
                    ELSE
                        IF Filter_Wt <> '' THEN
                            SetDay := SetDay::Wt
                        ELSE
                            IF Filter_Sr <> '' THEN
                                SetDay := SetDay::Sr
                            ELSE
                                IF Filter_Cz <> '' THEN
                                    SetDay := SetDay::Cz
                                ELSE
                                    IF Filter_Pt <> '' THEN
                                        SetDay := SetDay::Pt
                                    ELSE
                                        SetDay := SetDay::" ";

                    ForecastPlanningList.SetInitDate(Rec.Year, Rec."Week No.", SetDay);
                    ForecastPlanningList.RUN(); */
                end;
            }
        }
    }

    local procedure UpdateLine()
    begin
        /* Rec.CALCFIELDS("Total Week Forecast", "Total Monday", "Total Tuesdey", "Total Wednesday", "Total Thursday", "Total Friday",
         "Total Saturday", "Total Sunday");
        //rec.CalcFields("Date Filter CM", "Date Filter CM-1M", "Date Filter CM-2M", "Date Filter CM-3M", "Date Filter CM-4M", "Date Filter 5M");

        RemainingForecast := Rec."Week Forecast Qty"
                           - Rec.Monday
                           - Rec.Tuesday
                           - Rec.Wednesday
                           - Rec.Thursday
                           - Rec.Friday
                           - Rec.Saturday
                           - Rec.Sunday; */
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateForecast();
        UpdateLine();
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        SetDeleteLine := FALSE;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        SetDeleteLine := FALSE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    var c:Page "Customer Card";
    begin
        Rec.InitForecast();
    end;

    trigger OnOpenPage()
    begin
        SetDeleteLine := FALSE;

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

    trigger OnDeleteRecord(): Boolean
    begin
        IF not SetDeleteLine THEN BEGIN
            ForecastPlanning.RESET();
            ForecastPlanning.SETRANGE("Forecast Planning No.", Rec."No.");
            ForecastPlanning.SETFILTER("Week Forecast Qty", '<>0');
            IF ForecastPlanning.FINDFIRST() THEN
                IF CONFIRM(Text_001, FALSE) THEN
                    SetDeleteLine := TRUE
                ELSE
                    ERROR(Text_002);
        END;
    end;

    local procedure UpdateForecast()
    begin
        /* SetPn := FALSE;
        SetWt := FALSE;
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

    local procedure UpdateForDay()
    begin
        /* ForecastPlanning.RESET();
        ForecastPlanning.SETRANGE("Forecast Code", Rec."Forecast Code");
        ForecastPlanning.SETRANGE(Year, Rec.Year);
        ForecastPlanning.SETRANGE("Week No.", Rec."Week No.");
        IF ForecastPlanning.FINDset() THEN
            REPEAT
                ForecastPlanning."Set Monday" := SetPn;
                ForecastPlanning."Set Tuesdy" := SetWt;
                ForecastPlanning."Set Wednesday" := SetSr;
                ForecastPlanning."Set Thursday" := SetCz;
                ForecastPlanning."Set Friday" := SetPt;
                ForecastPlanning."Set Saturday" := SetSb;
                ForecastPlanning."Set Sunday" := SetNi;
                ForecastPlanning.MODIFY();
            UNTIL ForecastPlanning.NEXT() = 0; */
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

        //nie odświeżaj zleceñ zwolnionych
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
        lProdOrder: Record "Production Order";
    begin
        ProdOrderTemp.RESET();
        IF ProdOrderTemp.FINDSET() THEN
            REPEAT
                lProdOrder.SETRANGE(Status, ProdOrderTemp.Status);
                lProdOrder.SETRANGE("No.", ProdOrderTemp."No.");
                REPORT.RUN(REPORT::"Refresh Production Order", FALSE, FALSE, lProdOrder);
            UNTIL ProdOrderTemp.NEXT() = 0;
    end;

    var
        MfgSetup: Record "Manufacturing Setup";
        ForecPlanning: Record "AMC Forecast Planning Line";
        SalesSetup: Record "Sales & Receivables Setup";
        ItemRec: Record Item;
        ForecastPlanning: Record "AMC Forecast Planning Line";
        ProdForectEntry: Record "Production Forecast Entry";
        ItemCategory: Record "Item Category";
        ProdOrder: Record "Production Order";
        NoSeriesMgt: Codeunit "No. Series";
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
        SetPn: Boolean;
        SetWt: Boolean;
        SetSr: Boolean;
        SetCz: Boolean;
        SetPt: Boolean;
        SetSb: Boolean;
        SetNi: Boolean;
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
        ProdOrderTemp: Record "Production Order" temporary;
        SetLotQty: Decimal;
        SetMinimStock: Decimal;
        SetMaximStok: Decimal;
        QuestConfirm: Text[200];
        Question2: Text[200];
        DateFilter_CM: Text[100];
        DateFilter_CM_1M: Text[100];
        DateFilter_CM_2M: Text[100];
        DateFilter_CM_3M: Text[100];
        DateFilter_CM_4M: Text[100];
        DateFilter_5M: Text[100];

        Text_001: Label 'Prognozy zawierają planowaną produkcję \ Czy usunąć oznaczone linie?';
        Text_002: Label 'Zaniechano Usunięcia Linii';
        Text_003: Label 'Zapas %1 posiada nierozpisaną ilość planowania.\ Czy kontynuować?';
        Text_004: Label 'Czy przypisać Ilość %1 \do Szarży Produkcji Zapasu: %2?';
        Text_005: Label 'Zaniechano zmiany Szarży Produkcji.';
        Text_006: Label 'Czy przypisać Ilość %1 \do Minimalnego Stanu Zapasu: %2?';
        Text_007: Label 'Zaniechano zmiany Bezpiecznego Stanu Wyrobu.';
        Text_008: Label 'W okresie %1/%2 znaleziono wygenerowaną prognozę,\czy uzupełnić brakujące linie?';
        Text_009: Label 'Czy przypisać Ilość %1 \do Maks. Stoku Zapasu: %2?';
        Text_010: Label 'Zaniechano zmiany Maksymalnego Stoku Zapasu.';
}
