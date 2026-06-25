report 50020 "AMC Forecast Planning List"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/report/layout/AMC Forecast Planning List.rdl';
    Caption = 'Forecast Planning List';
    dataset
    {
        dataitem("Forecast Planning Line"; "AMC Forecast Planning")
        {
            DataItemTableView = SORTING("Forecast Code", Year, "Week No.", "Item No.");

            column(CompanyPicture; CompanyInfo.Picture) { }
            column(DocumentTitle; DocumentTitle) { }
            column(ReportDateTime; Format(ReportDateTime)) { }
            column(ReportDay; Format(ReportDay)) { }
            column(DocumentNo; DocumentNo) { }
            column(ConsNo; Lp) { }
            column(Item_No_; "Item No.") { }
            column(Item_Description; "Item Description") { }
            column(ReportQty; ReportQty) { }
            column(Base_Unit_of_Measure; "Base Unit of Measure") { }
            column(ItemPack; ItemPack) { }
            column(Forecast_Remarks; "Forecast Remarks") { }
            column(ForecastRemarksText; ForecastRemarksText) { }
            column(LastMenufOrder; LastManufOrder) { }
            column(Alergeny; Alergeny) { }
            column(FormalReport; FormalReport) { }

            trigger OnPreDataItem()
            begin
                CompanyInfo.GET();
                CompanyInfo.CalcFields(Picture);

                DocumentTitle := Text_001;
                ReportDateTime := STRSUBSTNO('%1 // %2', USERID, CURRENTDATETIME);

                CASE SetDay OF
                    SetDay::Pn:
                        Daytext := 'Poniedziałek';
                    SetDay::Wt:
                        Daytext := 'Wtorek';
                    SetDay::Sr:
                        Daytext := 'środa';
                    SetDay::Cz:
                        Daytext := 'Czwartek';
                    SetDay::Pt:
                        Daytext := 'Piątek';
                    SetDay::Sb:
                        Daytext := 'Sobota';
                    SetDay::Ni:
                        Daytext := 'Niedziela';
                END;

                CASE SetDay OF
                    SetDay::" ":
                        BEGIN
                            ReportDay := STRSUBSTNO(Text_007, FORMAT(SetDateFrom, 0, '<day,2>-<month,2>-<year4>'),
                                                           FORMAT(SetDateTo, 0, '<day,2>-<month,2>-<year4>'));
                            IF SetWeekNo < 10 THEN
                                DocumentNo := STRSUBSTNO('Nr: %1/0%2', SetYear, SetWeekNo)
                            ELSE
                                DocumentNo := STRSUBSTNO('Nr: %1/%2', SetYear, SetWeekNo);
                        END ELSE BEGIN
                        DayNo := SetDay - 1;
                        ExprDate := STRSUBSTNO('<+%1D>', DayNo);
                        ReportDate := CALCDATE(ExprDate, SetDateFrom);
                        ReportDay := STRSUBSTNO(Text_008, FORMAT(ReportDate, 0, '<day,2>-<month,2>-<year4>'), Daytext);

                        IF SetWeekNo < 10 THEN
                            DocumentNo := STRSUBSTNO('Nr: %1/0%2/%3', SetYear, SetWeekNo, SetDay)
                        ELSE
                            DocumentNo := STRSUBSTNO('Nr: %1/%2/%3', SetYear, SetWeekNo, SetDay);
                    END;
                END;

                ForecastPlanningHeader.RESET();
                ForecastPlanningHeader.SETRANGE("Forecast Code", SetForecastCode);
                ForecastPlanningHeader.SETRANGE(Year, SetYear);
                ForecastPlanningHeader.SETRANGE("Week No.", SetWeekNo);
                IF NOT ForecastPlanningHeader.FINDFIRST() THEN
                    ERROR(Text_005, SetYear, SetWeekNo);

                "Forecast Planning Line".RESET();
                "Forecast Planning Line".SETRANGE("Forecast Code", SetForecastCode);
                "Forecast Planning Line".SETRANGE(Year, SetYear);
                "Forecast Planning Line".SETRANGE("Week No.", SetWeekNo);
                "Forecast Planning Line".SETFILTER("Week Forecast Qty", '<>0');
            end;

            trigger OnAfterGetRecord()
            begin
                CASE SetDay OF
                    SetDay::" ":
                        ReportQty := "Forecast Planning Line"."Week Forecast Qty";
                    SetDay::Pn:
                        ReportQty := "Forecast Planning Line".Monday;
                    SetDay::Wt:
                        ReportQty := "Forecast Planning Line".Tuesday;
                    SetDay::Sr:
                        ReportQty := "Forecast Planning Line".Wednesday;
                    SetDay::Cz:
                        ReportQty := "Forecast Planning Line".Thursday;
                    SetDay::Pt:
                        ReportQty := "Forecast Planning Line".Friday;
                    SetDay::Sb:
                        ReportQty := "Forecast Planning Line".Saturday;
                    SetDay::Ni:
                        ReportQty := "Forecast Planning Line".Sunday;
                END;


                IF ItemRec.GET("Forecast Planning Line"."Item No.") THEN BEGIN
                    ItemAlergens := ItemRec.Description;
                    ItemPack := ItemRec."AMC Pack Unit of Measure";
                END;

                LastManufOrder := '';

                IF FormalReport = FALSE THEN
                    IF ReportQty <> 0 THEN BEGIN
                        IF ItemRec.GET("Forecast Planning Line"."Item No.") THEN BEGIN
                            IF ItemRec."AMC Forecast No Print Item" = TRUE THEN
                                ForecastRemarksText := STRSUBSTNO('(N) %1', "Forecast Planning Line"."Forecast Remarks")
                            ELSE
                                ForecastRemarksText := STRSUBSTNO('%1', "Forecast Planning Line"."Forecast Remarks");

                            ProdOrder.RESET();
                            ProdOrder.SETCURRENTKEY(Status, "Due Date");
                            ProdOrder.SETRANGE(Status, ProdOrder.Status::Finished);
                            ProdOrder.SETRANGE("Source No.", ItemRec."No.");
                            IF ProdOrder.FINDLAST() THEN
                                LastManufOrder := STRSUBSTNO(Text_009,
                                                           ProdOrder."No.",
                                                           FORMAT(ProdOrder."Due Date", 0, '<day,2>-<month,2>-<year4>'));
                        END;
                        PeriodTotal := PeriodTotal + ReportQty;
                        Lp := Lp + 1;
                    END;

                IF FormalReport = TRUE THEN
                    IF ReportQty <> 0 THEN
                        IF ItemRec.GET("Forecast Planning Line"."Item No.") THEN
                            IF ItemRec."AMC Forecast No Print Item" = FALSE THEN BEGIN
                                PeriodTotal := PeriodTotal + ReportQty;
                                Lp := Lp + 1;
                            END;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(options)
                {
                    Caption = 'Options';

                    field(SetForecastCode; SetForecastCode)
                    {
                        ApplicationArea = All;
                        Caption = 'Production Forecast Name';
                        Editable = false;
                    }
                    field(SetYear; SetYear)
                    {
                        ApplicationArea = All;
                        Caption = 'Year';

                        trigger OnValidate()
                        begin
                            UpdateForecast();
                        end;
                    }
                    field(SetDateFrom; SetDateFrom)
                    {
                        ApplicationArea = All;
                        Caption = 'Date from';
                        Editable = false;
                    }
                    field(SetDateTo; SetDateTo)
                    {
                        ApplicationArea = All;
                        Caption = 'Date to';
                        Editable = false;
                    }

                    field(SetWeekNo; SetWeekNo)
                    {
                        ApplicationArea = All;
                        Caption = 'Week';

                        trigger OnValidate()
                        begin
                            UpdateForecast();
                        end;
                    }
                    field(FormalReport; FormalReport)
                    {
                        ApplicationArea = All;
                        Caption = 'Print Formal Document';
                    }
                    field(SetDay; SetDay)
                    {
                        ApplicationArea = All;
                        Caption = 'Day of the Week';

                        trigger OnValidate()
                        begin
                            UpdateForecast();
                        end;
                    }
                }
            }
        }

        trigger OnOpenPage()
        begin
            SalesSetup.GET();
            SalesSetup.TESTFIELD("AMC Production Forecast Code");
            SetForecastCode := SalesSetup."AMC Production Forecast Code";

            IF SetYear = 0 THEN
                SetYear := DATE2DWY(WORKDATE(), 3);
            IF SetWeekNo = 0 THEN
                SetWeekNo := DATE2DWY(WORKDATE(), 2);

            FormalReport := FALSE;

            SetDateFrom := DWY2DATE(1, SetWeekNo, SetYear);
            SetDateTo := DWY2DATE(7, SetWeekNo, SetYear);
        end;
    }

    procedure SetInitDate(Year_Set: Integer; WeekNo_Set: Integer; Day_Set: Integer)
    begin
        SetYear := Year_Set;
        SetWeekNo := WeekNo_Set;
        SetDay := Day_Set;
    end;

    local procedure UpdateForecast()
    begin
        IF SetYear < 100 THEN
            SetYear := 2000 + SetYear;

        SetDateFrom := DWY2DATE(1, SetWeekNo, SetYear);
        SetDateTo := DWY2DATE(7, SetWeekNo, SetYear);
    end;

    trigger OnInitReport()
    begin
        FormalReport := TRUE;
    end;

    var
        ForecastPlanningHeader: Record "AMC Forecast Planning";
        SalesSetup: Record "Sales & Receivables Setup";
        CompanyInfo: Record "Company Information";
        ItemRec: Record Item;
        ProdOrder: Record "Production Order";
        DocumentTitle: Text[200];
        SetForecastCode: Code[20];
        SetYear: Integer;
        SetWeekNo: Integer;
        SetDay: Option " ",Pn,Wt,Sr,Cz,Pt,Sb,Ni;
        SetDateFrom: Date;
        SetDateTo: Date;
        ReportQty: Decimal;
        ReportDay: Text[100];
        ReportDate: Date;
        ExprDate: Text[30];
        DocumentNo: Text[100];
        DayNo: Integer;
        Lp: Integer;
        ItemPack: Code[20];
        ItemAlergens: Text[200];
        PeriodTotal: Decimal;
        Daytext: Text[50];
        ReportDateTime: Text[100];
        FormalReport: Boolean;
        ForecastRemarksText: Text[200];
        LastManufOrder: Text[50];
        Text_001: Label 'Plan Produkcji';
        Text_002: Label 'Strona %1';
        Text_004: Label '%1, dnia %2';
        Text_005: Label 'Nie znaleziono Prognozy Produkcji %1 / %2';
        Text_006: Label 'Wybierz Dzieñ Tygodnia';
        Text_007: Label '%1 => %2';
        Text_008: Label '%1 // %2';
        Text_009: Label 'Zl.Pr:%1 | %2';
}
