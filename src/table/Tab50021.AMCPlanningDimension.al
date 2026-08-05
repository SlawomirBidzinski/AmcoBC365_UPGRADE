table 50021 "AMC Planning Dimension"
{
    Caption = 'Planning Dimension';
    DataCaptionFields = "Code", Name;
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Planning Dimensions";
    LookupPageId = "AMC Planning Dimensions";

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Name; Text[30])
        {
            Caption = 'Name';
        }
        field(3; "Default Priority"; Integer)
        {
            BlankZero = true;
            Caption = 'Default Priority';
            MinValue = 0;
        }
        field(4; "Value Prioritisation"; Enum "AMC Value Prioritisation")
        {
            Caption = 'Value Prioritisation';}
        field(5; "Numeric Value"; Boolean)
        {
            Caption = 'Numeric Value';
        }
        field(6; "Fixed Sorting Field"; Enum "AMC Fixed Sorting Field")
        {
            Caption = 'Fixed Sorting Field';
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Default Priority")
        {
        }
    }

    fieldgroups
    {
    }
}

