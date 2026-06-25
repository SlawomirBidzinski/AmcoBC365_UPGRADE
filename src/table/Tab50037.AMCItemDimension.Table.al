table 50037 "AMC Item Dimension"
{
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            NotBlank = true;
            TableRelation = Item;
        }
        field(2; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            NotBlank = true;
            TableRelation = "AMC Dimension Value Transl."."Dimension Code" where (Type = const (ExtDim));
        }
        field(3; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            NotBlank = true;
            TableRelation = "AMC Dimension Value Transl."."Dimension Value Code" where (Type = const (ExtDimVal),
                                                                                        "Dimension Code" = field("Dimension Code"));
        }
        field(4; "Dimension Text 1"; Text[200])
        {
        }
        field(5; "Dimension Text 2"; Text[100])
        {
        }
        field(6; "Dimension Text 3"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Item No.","Dimension Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

