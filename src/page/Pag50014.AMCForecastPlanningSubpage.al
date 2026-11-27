page 50014 "AMC Forecast Planning Subpage"
{
    ApplicationArea = All;
    Caption = 'AMC Forecast Planning Subpage';
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
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = All;
                }
                field("Week No."; Rec."Week No.")
                {
                    ApplicationArea = All;
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
}
