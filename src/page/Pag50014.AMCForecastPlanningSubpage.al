page 50014 "AMC Forecast Planning Subpage"
{
    ApplicationArea = All;
    Caption = 'Forecast Planning Lines';
    PageType = ListPart;
    SourceTable = "AMC Forecast Planning Line";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Forecast Code"; Rec."Forecast Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Week No."; Rec."Week No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Kod Zapasu field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Nazwa Zapasu field.', Comment = '%';
                }
                field("Production BOM"; Rec."Production BOM")
                {
                    ToolTip = 'Specifies the value of the BOM Produkcyjny field.', Comment = '%';
                }
                field("No Print Forecat Item"; Rec."No Print Forecat Item")
                {
                    ToolTip = 'Specifies the value of the Nie Drukuj na Prognozie field.', Comment = '%';
                }
                field(Inventory; Rec.Inventory)
                {
                    ToolTip = 'Specifies the value of the Zapasy field.', Comment = '%';
                }
                field("Inventory <> M.KJ"; Rec."Inventory <> M.KJ")
                {
                    ToolTip = 'Specifies the value of the Inventory <> K.J. field.', Comment = '%';
                }
                field("Inventory / Location"; Rec."Inventory / Location")
                {
                    ToolTip = 'Specifies the value of the Zapasy / Magazyn field.', Comment = '%';
                }
                field("Max Stock Item"; Rec."Max Stock Item")
                {
                    ToolTip = 'Specifies the value of the Max Stock Item field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Kod Lokalizacji field.', Comment = '%';
                }
                field("Pack Unit of Measure"; Rec."Pack Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Jednostka miary opakowania field.', Comment = '%';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ToolTip = 'Specifies the value of the Podst. jednostka miary field.', Comment = '%';
                }
                field("Forecast Remarks"; Rec."Forecast Remarks")
                {
                    ToolTip = 'Specifies the value of the Forecast Remarks field.', Comment = '%';
                }
                field("Reorder Point"; Rec."Reorder Point")
                {
                    ToolTip = 'Specifies the value of the Poziom Ponownego Zamówienia field.', Comment = '%';
                }
                field("Reorder Policy"; Rec."Reorder Policy")
                {
                    ToolTip = 'Specifies the value of the Zasady Ponownego Zamówienia field.', Comment = '%';
                }
                field("Reorder Quantity"; Rec."Reorder Quantity")
                {
                    ToolTip = 'Specifies the value of the Ilość Ponownego zamówienia field.', Comment = '%';
                }
                field("Production Lot"; Rec."Production Lot")
                {
                    ToolTip = 'Specifies the value of the Szarża produkcji field.', Comment = '%';
                }
                field("Production Order Forecast Qty"; Rec."Production Order Forecast Qty")
                {
                    ToolTip = 'Specifies the value of the Planowana Il. Zl. Prod field.', Comment = '%';
                }
                field("Production Order Release Qty."; Rec."Production Order Release Qty.")
                {
                    ToolTip = 'Specifies the value of the Zatwierdzona Il. Zl. Prod field.', Comment = '%';
                }
                field("Product Safety Stock"; Rec."Product Safety Stock")
                {
                    ToolTip = 'Specifies the value of the Stan bezpieczny wyrobu field.', Comment = '%';
                }
                field(Alergeny; Rec.Alergeny)
                {
                    ToolTip = 'Specifies the value of the Alergeny field.', Comment = '%';
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
                field("Prev. Forecast Qty"; Rec."Prev. Forecast Qty")
                {
                    ToolTip = 'Specifies the value of the Ilość Poprzedniej Prognozy field.', Comment = '%';
                }
                field("Week Forecast Qty"; Rec."Week Forecast Qty")
                {
                    ToolTip = 'Specifies the value of the Ilość Prognozy Tygodniowa field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';

                trigger OnAction()
                var
                    ForecastPlanningList: Report "AMC Forecast Planning List";
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
}
