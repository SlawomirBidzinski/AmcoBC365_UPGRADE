page 50035 "AMC Forecast Planning List"
{
    ApplicationArea = All;
    Caption = 'Forecast Planning List';
    PageType = List;
    SourceTable = "AMC Forecast Planning Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AMC Item Forecast Plan. Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Forecast Code"; Rec."Forecast Code")
                {
                    ApplicationArea = All;
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Rok field.', Comment = '%';
                }
                field("Week No."; Rec."Week No.")
                {
                    ToolTip = 'Specifies the value of the Nr Tygodnia field.', Comment = '%';
                }
                field("Week Starting Date"; Rec."Week Starting Date")
                {
                    ToolTip = 'Specifies the value of the Data Rozpoczęcia Tygodnia field.', Comment = '%';
                }
                field("Week Ending Date"; Rec."Week Ending Date")
                {
                    ApplicationArea = All;
                }
                field("Previous Week From Date"; Rec."Previous Week From Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
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
                    //Filter_Pn := Rec.GETFILTER(Monday);
                    //Filter_Wt := Rec.GETFILTER(Tuesday);
                    //Filter_Sr := Rec.GETFILTER(Wednesday);
                    //Filter_Cz := Rec.GETFILTER(Thursday);
                    //Filter_Pt := Rec.GETFILTER(Friday);

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
                    ForecastPlanningList.RUN();
                end;
            }
        }
    }

    var
        ForecastPlanningList: Report "AMC Forecast Planning List";
}
