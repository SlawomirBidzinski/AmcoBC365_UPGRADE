table 50056 "AMC Forecast Planning Header"
{
    Caption = 'AMC Forecast Planning Header';
    DataClassification = CustomerContent;
    LookupPageId = "AMC Forecast Planning List";
    DrillDownPageId = "AMC Forecast Planning List";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            OptimizeForTextSearch = true;

            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }
        field(2; "Forecast Code"; Code[10])
        {
            Caption = 'Kod Prognozy';
            TableRelation = "Production Forecast Name";

            trigger OnValidate()
            begin
                CheckForecastExists();
            end;
        }
        field(3; Year; Integer)
        {
            Caption = 'Rok';

            trigger OnValidate()
            begin
                CheckForecastExists();
                ValidateDates();
            end;
        }
        field(4; "Week No."; Integer)
        {
            Caption = 'Nr Tygodnia';
            trigger OnValidate()
            begin
                CheckForecastExists();
                ValidateDates();
            end;
        }
        field(5; "Week Starting Date"; Date)
        {
            Caption = 'Week Starting Date';
            Editable = false;
        }
        field(6; "Week Ending Date"; Date)
        {
            Caption = 'Week Ending Date';
            Editable = false;
        }
        field(7; "Previous Week From Date"; Date)
        {
            Caption = 'Data Prognozy Poprz. Tygodnia';
            Editable = false;
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(100; "Total Week Forecast"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line"."Week Forecast Qty" where("Forecast Planning No." = field("No.")));
            Caption = 'Razem Zaplanowano w Tygodniu';

        }
        field(101; "Total Monday"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Monday where("Forecast Planning No." = field("No."),
                                                                Monday = filter(<> 0)));
            Caption = 'Razem Pn';

        }
        field(102; "Total Tuesdey"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Tuesday where("Forecast Planning No." = field("No."),
                                                                 Tuesday = filter(<> 0)));
            Caption = 'Razem Wt';

        }
        field(103; "Total Wednesday"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Wednesday where("Forecast Planning No." = field("No."),
                                                                   Wednesday = filter(<> 0)));
            Caption = 'Razem Śr';

        }
        field(104; "Total Thursday"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Thursday where("Forecast Planning No." = field("No."),
                                                                  Thursday = filter(<> 0)));
            Caption = 'Razem Cz';

        }
        field(105; "Total Friday"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Friday where("Forecast Planning No." = field("No."),
                                                                Friday = filter(<> 0)));
            Caption = 'Razem Pt';

        }
        field(106; "Total Saturday"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Saturday where("Forecast Planning No." = field("No."),
                                                                  Saturday = filter(<> 0)));
            Caption = 'Razem Sb';

        }
        field(107; "Total Sunday"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line".Sunday where("Forecast Planning No." = field("No."),
                                                                Sunday = filter(<> 0)));
            Caption = 'Razem Ni';

        }
        field(111; "Set Monday"; Boolean)
        {
            Caption = 'Potw. Pn';
        }
        field(112; "Set Tuesdy"; Boolean)
        {
            Caption = 'Potw. Wt';
        }
        field(113; "Set Wednesday"; Boolean)
        {
            Caption = 'Potw. Śr';
        }
        field(114; "Set Thursday"; Boolean)
        {
            Caption = 'Potw. Cz';
        }
        field(115; "Set Friday"; Boolean)
        {
            Caption = 'Potw. Pt';
        }
        field(116; "Set Saturday"; Boolean)
        {
            Caption = 'Potw. Sb';
        }
        field(117; "Set Sunday"; Boolean)
        {
            Caption = 'Potw. Ni';
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    local procedure TestNoSeries()
    var
        ForecastPlanningHdr: Record "AMC Forecast Planning Header";
    begin
        if "No." <> xRec."No." then
            if not ForecastPlanningHdr.Get(Rec."No.") then begin
                SalesSetup.Get();
                NoSeries.TestManual(SalesSetup."AMC Prod. Forecast Nos.");
                "No. Series" := '';
            end;
    end;

    local procedure CheckForecastExists()
    var
        ForecastPlanningHdr: Record "AMC Forecast Planning Header";
        RecExistsErrLbl: Label 'Production forecast %1, year %2, week %3 already exists';
    begin
        if ("Forecast Code" = '') or (Year = 0) or ("Week No." = 0) then
            exit;

        ForecastPlanningHdr.Reset();
        ForecastPlanningHdr.SetRange("Forecast Code", "Forecast Code");
        ForecastPlanningHdr.SetRange(Year, Year);
        ForecastPlanningHdr.SetRange("Week No.", "Week No.");
        ForecastPlanningHdr.SetFilter("No.", '<>%1', "No.");
        if not ForecastPlanningHdr.IsEmpty() then
            Error(RecExistsErrLbl, "Forecast Code", Year, "Week No.");
    end;

    local procedure ValidateDates()
    begin
        if (Year = 0) or ("Week No." = 0) then begin
            "Week Starting Date" := 0D;
            "Week Ending Date" := 0D;
            "Previous Week From Date" := 0D;
            exit;
        end;

        "Week Starting Date" := DWY2DATE(1, "Week No.", Year);
        "Week Ending Date" := CalcDate('<CW>', "Week Starting Date");
        "Previous Week From Date" := "Week Starting Date" - 7;
    end;

    procedure AssistEdit(OldForecastPlanningHdr: Record "AMC Forecast Planning Header"): Boolean
    var
        ForecastPlanningHdr: Record "AMC Forecast Planning Header";
    begin
        ForecastPlanningHdr := Rec;
        SalesSetup.Get();
        SalesSetup.TestField("AMC Prod. Forecast Nos.");
        if NoSeries.LookupRelatedNoSeries(SalesSetup."AMC Prod. Forecast Nos.",
                                          OldForecastPlanningHdr."No. Series",
                                          ForecastPlanningHdr."No. Series") then begin
            ForecastPlanningHdr."No." := NoSeries.GetNextNo(ForecastPlanningHdr."No. Series");
            Rec := ForecastPlanningHdr;

            exit(true);
        end;
    end;

    procedure InitForecast()
    begin
        SalesSetup.GET();
        SalesSetup.TESTFIELD("AMC Production Forecast Code");
        if Rec."Forecast Code" = '' then
            Rec."Forecast Code" := SalesSetup."AMC Production Forecast Code";

        if Rec.Year = 0 then
            Rec.Year := Date2DMY(WorkDate(), 3);

        if Rec."Week No." = 0 then
            Rec."Week No." := Date2DWY(WorkDate(), 2);
    end;

    trigger OnInsert()
    var
        ForecastPlanningHdr: Record "AMC Forecast Planning Header";
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("AMC Prod. Forecast Nos.");
            "No. Series" := SalesSetup."AMC Prod. Forecast Nos.";
            if NoSeries.AreRelated("No. Series", xRec."No. Series") then
                "No. Series" := xRec."No. Series";
            "No." := NoSeries.GetNextNo("No. Series");
            ForecastPlanningHdr.ReadIsolation(IsolationLevel::ReadUncommitted);
            ForecastPlanningHdr.SetLoadFields("No.");
            while ForecastPlanningHdr.Get("No.") do
                "No." := NoSeries.GetNextNo("No. Series");
        end;
    end;

    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
}
