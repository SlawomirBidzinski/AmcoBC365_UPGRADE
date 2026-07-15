page 50035 "AMC Forecast Planning List"
{
    ApplicationArea = All;
    Caption = 'Forecast Planning List';
    PageType = List;
    SourceTable = "AMC Forecast Planning";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AMC Item Forecast Planning";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Rok field.', Comment = '%';
                }
                field("Week No."; Rec."Week No.")
                {
                    ToolTip = 'Specifies the value of the Nr Tygodnia field.', Comment = '%';
                }
                field("Week From Day"; Rec."Week From Day")
                {
                    ToolTip = 'Specifies the value of the Data Rozpoczęcia Tygodnia field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Kod Zapasu field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Nazwa Zapasu field.', Comment = '%';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Podst. jednostka miary field.', Comment = '%';
                }
                field("Week Forecast Qty"; Rec."Week Forecast Qty")
                {
                    ToolTip = 'Specifies the value of the Ilość Prognozy Tygodniowa field.', Comment = '%';
                }
                field(Monday; Rec.Monday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Pn field.', Comment = '%';
                }
                field(Tuesday; Rec.Tuesday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Wt field.', Comment = '%';
                }
                field(Wednesday; Rec.Wednesday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Śr field.', Comment = '%';
                }
                field(Thursday; Rec.Thursday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Cz field.', Comment = '%';
                }
                field(Friday; Rec.Friday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Pt field.', Comment = '%';
                }
                field(Saturday; Rec.Saturday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Sb field.', Comment = '%';
                }
                field(Sunday; Rec.Sunday)
                {
                    ToolTip = 'Specifies the value of the Prognoza Ni field.', Comment = '%';
                }
                field("Pack Unit of Measure"; Rec."Pack Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Jednostka miary opakowania field.', Comment = '%';
                }
                field("Production Lot"; Rec."Production Lot")
                {
                    ToolTip = 'Specifies the value of the Szarża produkcji field.', Comment = '%';
                }
                field("Product Safety Stock"; Rec."Product Safety Stock")
                {
                    ToolTip = 'Specifies the value of the Stan bezpieczny wyrobu field.', Comment = '%';
                }
                field("Forecast Remarks"; Rec."Forecast Remarks")
                {
                    ToolTip = 'Specifies the value of the Forecast Remarks field.', Comment = '%';
                }
                field(Alergeny; Rec.Alergeny)
                {
                    ToolTip = 'Specifies the value of the Alergeny field.', Comment = '%';
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
                    Filter_Pn := Rec.GETFILTER(Monday);
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
                    ForecastPlanningList.RUN();
                end;
            }
        }
    }

    var
        ForecastPlanningList: Report "AMC Forecast Planning List";
}
