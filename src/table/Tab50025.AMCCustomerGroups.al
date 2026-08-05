table 50025 "AMC Customer Group"
{
    Caption = 'Customer Group';
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Customer Group";
    LookupPageId = "AMC Customer Group";
    
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Customer Group Code';
        }
        field(2; "Description"; Text[50])
        {
            Caption = 'Description';
            NotBlank = true;
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