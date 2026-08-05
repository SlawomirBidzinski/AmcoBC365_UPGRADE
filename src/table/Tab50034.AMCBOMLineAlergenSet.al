table 50034 "AMC BOM Line Alergen Set"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Production BOM Line"; Code[20])
        {
            Caption = 'Kod Linii BOM';
            TableRelation = "Production BOM Line";
        }
        field(2; "ID Code"; Integer)
        {
            Caption = 'Kod Alergenu';
            TableRelation = "AMC Alergen";
        }
        field(3; Descripton; Text[50])
        {
            Caption = 'Nazwa';
        }
        field(4; "Alergen Set"; Boolean)
        {
            Caption = 'Ustawienie';
        }
    }

    keys
    {
        key(Key1; "Production BOM Line")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

