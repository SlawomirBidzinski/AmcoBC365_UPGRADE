table 50032 "AMC Material Group"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Material Group"; Enum "AMC Material Group")
        {
            Caption = 'Kod Grupy';
        }
        field(2; "Material Code"; Code[10])
        {
            Caption = 'Kod';
        }
        field(3; "Material Name"; Text[50])
        {
            Caption = 'Nazwa';
        }
    }

    keys
    {
        key(Key1; "Material Group", "Material Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

