table 50020 "AMC Colour"
{
    Caption = 'Colour';
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Colours";
    LookupPageId = "AMC Colours";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[30])
        {
            Caption = 'Description';
        }
        field(3; Picture; BLOB)
        {
            Caption = 'Picture';
        }
    }

    keys
    {
        key(Key1; Code)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

