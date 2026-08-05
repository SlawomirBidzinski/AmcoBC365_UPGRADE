table 50029 "AMC Label"
{
    Caption = 'Label';
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Labels";
    LookupPageId = "AMC Labels";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(3; "Label File Path"; Text[250])
        {
            Caption = 'Label File Path';
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

