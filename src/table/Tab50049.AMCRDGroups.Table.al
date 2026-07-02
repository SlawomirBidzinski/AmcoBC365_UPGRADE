table 50049 "AMC R&D Groups"
{
    Caption = 'R&D Groups';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User ID"; Code[100])
        {
            Caption = 'User ID';
        }
        field(2; "R&D Group Code"; Code[20])
        {
            Caption = 'Kod Grupy R&&D';
        }
        field(3; "R&D Group name"; Text[50])
        {
            Caption = 'Nazwa Grupy R&&D';
        }
    }

    keys
    {
        key(Key1; "User ID", "R&D Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

