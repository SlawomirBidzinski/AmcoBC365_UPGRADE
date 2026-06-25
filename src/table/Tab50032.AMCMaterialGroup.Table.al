table 50032 "AMC Material Group"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Material Group"; Option)
        {
            Caption = 'Kod Grupy';
            OptionCaption = 'Podział Kart,Podział Mięsa';
            OptionMembers = "Podział Kart","Podział Mięsa";
        }
        field(2; "Material Code"; Code[10])
        {
            Caption = 'Kod';
        }
        field(3; "Material Name"; Text[50])
        {
            Caption = 'Nazwa';
        }
        field(4; "Ilość Kart Technologicznych"; Integer)
        {
            CalcFormula = count("AMC Karta Technologiczna" where("Kod Grupy Produktu" = field("Material Code"),
                                                              "Wzorzec Karty" = const(false)));
            Caption = 'Ilość Kart Technologicznych';
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Ilość Linii Surowców"; Integer)
        {
            CalcFormula = count("AMC Spec. Karty Technolog." where("Material Code" = field("Material Code")));
            Caption = 'Ilość Linii Surowców';
            Editable = false;
            FieldClass = FlowField;
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

