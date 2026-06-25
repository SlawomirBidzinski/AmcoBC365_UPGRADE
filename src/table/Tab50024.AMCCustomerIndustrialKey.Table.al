table 50024 "AMC Customer Industrial Key"
{
    Caption = 'Customer Industrial Key';
    DataClassification = CustomerContent;
    LookupPageId = "AMC Customer Industrial Keys";
    DrillDownPageId = "AMC Customer Industrial Keys";

    fields
    {
        field(1; "Code"; Code[10])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; L2; Text[50])
        {
            Caption = 'Description';
        }
        field(3; L3; Text[50])
        {
            Caption = 'L3';
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