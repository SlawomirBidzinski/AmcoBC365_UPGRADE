table 50022 "AMC Alergen"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Id Code"; Integer)
        {
            Caption = 'Identyfikator';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Nazwa';
        }
        field(3; "E Code"; Code[20])
        {
            Caption = 'E Kod';
        }
    }

    keys
    {
        key(Key1; "Id Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

