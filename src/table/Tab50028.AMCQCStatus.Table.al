table 50028 "AMC QC Status"
{
    Caption = 'Status KJ';
    DataClassification = CustomerContent;
    LookupPageId = "AMC QC Statuses";
    DrillDownPageId = "AMC QC Statuses";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Kod';
        }
        field(2; Description; Text[40])
        {
            Caption = 'Opis';
        }
        field(3; Sales; Boolean)
        {
            Caption = 'Sprzedaż';
        }
        field(4; Consumption; Boolean)
        {
            Caption = 'Zużycie prod.';
        }
        field(5; Transfer; Boolean)
        {
            Caption = 'Przesunięcie';
        }
        field(6; "Colour ID"; Integer)
        {
            Caption = 'Numer koloru';
        }
        field(7; Bold; Boolean)
        {
            Caption = 'Pogrubienie';
        }
        field(8; "Colour Code"; Code[10])
        {
            Caption = 'Kod koloru';
        }
        field(9; "Lot Blocking"; Boolean)
        {
            Caption = 'Blokada całej partii';
            Description = 'AL.21Nov12';
        }
        field(10; "Set For PW Test Item"; Boolean)
        {
            Caption = 'Domyślne - Przyjęcie Próbek';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

