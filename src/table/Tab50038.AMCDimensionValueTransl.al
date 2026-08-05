table 50038 "AMC Dimension Value Transl."
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Dimension Code"; Code[20])
        {
            Caption = 'Dimension Code';
            NotBlank = true;
            TableRelation = if (Type = const (DimValTranslation)) Dimension.Code
            else
            if (Type = const (ExtDimVal)) "AMC Dimension Value Transl."."Dimension Code" where (Type = const (ExtDim),
                                                                                                                  "Language ID"=const(0))
                                                                                                                  else if (Type=const(ExtDimValTranslation)) "AMC Dimension Value Transl."."Dimension Code" where (Type = const(ExtDim),
                                                                                                                                                                                                                   "Language ID" = const(0));
        }
        field(2; "Dimension Value Code"; Code[20])
        {
            Caption = 'Dimension Value Code';
            TableRelation = if (Type = const (DimValTranslation)) "Dimension Value".Code where ("Dimension Code" = field("Dimension Code"))
                            else if (Type=const(ExtDimValTranslation)) "AMC Dimension Value Transl."."Dimension Value Code" where (Type=const(ExtDimVal),
                                                                                                                                   "Language ID"=const(0),
                                                                                                                                   "Dimension Code"=field("Dimension Code"));
        }
        field(3; "Language ID"; Integer)
        {
            Caption = 'Language ID';
            TableRelation = if (Type=filter(DimValTranslation|ExtDimValTranslation)) "Windows Language";
        }
        field(5; "Printer Text 1"; Text[250])
        {
            Caption = 'Printer Text';
        }
        field(6; "Language Name"; Text[80])
        {
            CalcFormula = lookup("Windows Language".Name where ("Language ID" = field("Language ID")));
            Caption = 'Language Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Type; Enum "AMC Dim. Translation Type")
        {
            Caption = 'Type';
        }
        field(8; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(9; "Printer Text 2"; Text[250])
        {
            Caption = 'Tekst dla drukarki 2';
        }
    }

    keys
    {
        key(Key1;Type,"Dimension Code","Dimension Value Code","Language ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

