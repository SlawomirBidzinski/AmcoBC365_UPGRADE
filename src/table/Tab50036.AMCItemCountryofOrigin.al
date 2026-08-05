table 50036 "AMC Item Country of Origin"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item Code"; Code[20])
        {
            Caption = 'Item Code';
            TableRelation = Item;
        }
        field(2; "Country of Origin Code"; Code[10])
        {
            Caption = 'Country of Origin Code';
            TableRelation = "Country/Region";
        }
        field(3; "Country Name"; Text[50])
        {
            CalcFormula = lookup("Country/Region".Name where (Code=field("Country of Origin Code")));
            Caption = 'Country Name';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Item Code","Country of Origin Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

