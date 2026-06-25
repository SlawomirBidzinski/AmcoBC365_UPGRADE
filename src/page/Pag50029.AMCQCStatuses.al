page 50029 "AMC QC Statuses"
{
    ApplicationArea = All;
    Caption = 'AMC QC Statuses';
    PageType = List;
    SourceTable = "AMC QC Status";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Kod field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Opis field.', Comment = '%';
                }
                field(Sales; Rec.Sales)
                {
                    ToolTip = 'Specifies the value of the Sprzedaż field.', Comment = '%';
                }
                field(Consumption; Rec.Consumption)
                {
                    ToolTip = 'Specifies the value of the Zużycie prod. field.', Comment = '%';
                }
                field(Transfer; Rec.Transfer)
                {
                    ToolTip = 'Specifies the value of the Przesunięcie field.', Comment = '%';
                }
                field("Colour ID"; Rec."Colour ID")
                {
                    ToolTip = 'Specifies the value of the Numer koloru field.', Comment = '%';
                }
                field(Bold; Rec.Bold)
                {
                    ToolTip = 'Specifies the value of the Pogrubienie field.', Comment = '%';
                }
                field("Colour Code"; Rec."Colour Code")
                {
                    ToolTip = 'Specifies the value of the Kod koloru field.', Comment = '%';
                }
                field("Lot Blocking"; Rec."Lot Blocking")
                {
                    ToolTip = 'Specifies the value of the Blokada całej partii field.', Comment = '%';
                }
                field("Set For PW Test Item"; Rec."Set For PW Test Item")
                {
                    ToolTip = 'Specifies the value of the Domyślne - Przyjęcie Próbek field.', Comment = '%';
                }
            }
        }
    }
}
