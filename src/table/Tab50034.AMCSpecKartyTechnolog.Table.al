table 50034 "AMC Spec. Karty Technolog."
{
    Caption = 'Specyfikacja Karty Technologicznej';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Karta Technologiczna Nr"; Code[20])
        {
            Caption = '"Karta Technologiczna Nr"';
        }
        field(2; "Typ Specyfikacji"; Enum "AMC Specification Type")
        {
            Caption = '"Typ Specyfikacji"';
        }
        field(3; "Line No"; Integer)
        {
            Caption = 'Nr Linii';
        }
        field(4; "Item Type"; Option)
        {
            Caption = 'Typ Zapasu';
            OptionCaption = ' ,Item,Nonstock Item';
            OptionMembers = " ",Item,"Nonstock Item";
        }
        field(5; "Material Type"; Option)
        {
            Caption = 'Typ Surowca';
            OptionCaption = 'Surowiec Mięsny,Inny';
            OptionMembers = "Surowiec Mięsny",Inny;
        }
        field(6; "Material Code"; Code[10])
        {
            Caption = 'Kod Surowca';
            TableRelation = if ("Material Type" = const("Surowiec Mięsny")) "AMC Material Group"."Material Code" where ("Material Group" = const("Podział Mięsa"));
        }
        field(8; "Nr Zapasu"; Code[20])
        {
            Caption = 'Kod Zapasu';
            TableRelation = if ("Item Type" = const(Item)) Item
                            else if ("Item Type" = const("Nonstock Item")) "Nonstock Item";
        }
        field(10; Nazwa; Text[50])
        {
            Caption = 'Nazwa';
        }
        field(11; "Uszczegółowienie"; Text[50])
        {
            Caption = 'Uszczegółowienie';
        }
        field(16; "Il. do Prod. [kg]"; Decimal)
        {
            Caption = 'Il. do Prod.';
            DecimalPlaces = 2 : 3;
        }
        field(17; "Jedn. Miary"; Option)
        {
            Caption = '"Jedn. Miary"';
            OptionCaption = 'kg,szt,l,m';
            OptionMembers = kg,szt,l,m;
        }
        field(18; "Cena [zł/kg]"; Decimal)
        {
            Caption = 'Cena [zł/kg]';
        }
        field(20; Rozdrobnienie; Text[30])
        {
            Caption = 'Rozdrobnienie';
        }
        field(21; Opis; Text[100])
        {
            Caption = 'Opis';
        }
        field(22; "Próba"; Decimal)
        {
            Caption = 'Próba';
        }
        field(23; Proporcje; Decimal)
        {
            Caption = 'Proporcje';
        }
        field(25; "Dozowanie [g/kg masy]"; Decimal)
        {
            Caption = 'Dozowanie [g/kg masy]';
            DecimalPlaces = 2 : 5;
        }
        field(30; "Wartość [PLN]"; Decimal)
        {
            Caption = 'Wartość [PLN]';
        }
        field(31; "Wartość Solanki"; Decimal)
        {
            Caption = 'Wartość Solanki';
        }
        field(32; "Wartość Proporcji [PLN]"; Decimal)
        {
            Caption = 'Wartość Proporcji [PLN]';
        }
        field(50; Lp; Text[5])
        {
            Caption = 'Lp';
        }
        field(1001; "Razem Surowiec Ilość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Il. do Prod. [kg]" where("Karta Technologiczna Nr" = field("Karta Technologiczna Nr"),
                                                                                       "Typ Specyfikacji" = const("Surowiec Podstawowy"),
                                                                                       "Jedn. Miary" = filter(kg|l)));
            Caption = 'Razem Surowiec Ilość';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1002;"Razem Surowiec Wartość";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość [PLN]" where ("Karta Technologiczna Nr" = field("Karta Technologiczna Nr"),
                                                                                   "Typ Specyfikacji" = const("Surowiec Podstawowy")));
            Caption = 'Razem Surowiec Wartość';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1003;"Razem Przyprawy Ilość";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog.".Proporcje where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                             "Typ Specyfikacji"=const(Przyprawy),
                                                                             "Jedn. Miary"=filter(kg|l)));
            Caption = 'Razem Przyprawy Ilość';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1004;"Razem Przyprawy Wartość";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość Proporcji [PLN]" where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                                             "Typ Specyfikacji"=const(Przyprawy)));
            Caption = 'Razem Przyprawy Wartość';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1005; "Razem Przyprawy Solanki"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość Solanki" where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                                     "Typ Specyfikacji"=const(Przyprawy)));
            Caption = 'Razem Przyprawy Solanki';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1006;"Razem Mat.Pomocn. Ilość";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Il. do Prod. [kg]" where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                                       "Typ Specyfikacji"=const("Materiały Pomocnicze"),
                                                                                       "Jedn. Miary"=filter(kg|l)));
            Caption = 'Razem Mat.Pomocn. Ilość';
            Editable = false;
            FieldClass = FlowField;
        }
        field(1007;"Razem Mat.Pomoc. Wartość";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość [PLN]" where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                                   "Typ Specyfikacji"=const("Materiały Pomocnicze")));
            Caption = 'Razem Mat.Pomoc. Wartość';
            FieldClass = FlowField;
        }
        field(1008;"Razem Przyprawy Ilość Prod";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Il. do Prod. [kg]" where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                                       "Typ Specyfikacji"=const(Przyprawy),
                                                                                       "Jedn. Miary"=filter(kg|l)));
            Caption = 'Razem Przyprawy Ilość Prod';
            FieldClass = FlowField;
        }
        field(1009;"Razem Surowiec Próby";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog.".Próba where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                         "Typ Specyfikacji"=const("Surowiec Podstawowy"),
                                                                         "Jedn. Miary"=filter(kg|l)));
            Caption = 'Razem Surowiec Próby';
            FieldClass = FlowField;
        }
        field(1010;"Razem Przyprawy Próby";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog.".Próba where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                         "Typ Specyfikacji"=const(Przyprawy),
                                                                         "Jedn. Miary"=filter(kg|l)));
            Caption = 'Razem Przyprawy Próby';
            FieldClass = FlowField;
        }
        field(1011;"Razem Mat.Pomoc. Próby";Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog.".Próba where ("Karta Technologiczna Nr"=field("Karta Technologiczna Nr"),
                                                                         "Typ Specyfikacji"=const("Materiały Pomocnicze"),
                                                                         "Jedn. Miary"=filter(kg|l)));
            Caption = 'Razem Mat.Pomoc. Próby';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Karta Technologiczna Nr","Typ Specyfikacji","Line No")
        {
            Clustered = true;
            SumIndexFields = "Il. do Prod. [kg]","Wartość [PLN]","Wartość Solanki",Proporcje,"Próba";
        }
        key(Key2;"Karta Technologiczna Nr","Typ Specyfikacji","Jedn. Miary")
        {
            SumIndexFields = "Il. do Prod. [kg]","Wartość [PLN]","Wartość Solanki","Wartość Proporcji [PLN]",Proporcje,"Próba";
        }
    }

    fieldgroups
    {
    }
}

