table 50033 "AMC Karta Technologiczna"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Nr Karty Technologicznej"; Code[20])
        {
        }
        field(2; "Nazwa Produktu"; Text[50])
        {
        }
        field(3; "Kod Kontaktu"; Code[20])
        {
            TableRelation = Contact;
        }
        field(4; "Nazwa Kontaktu"; Text[50])
        {
        }
        field(5; "Kod Kontrahenta"; Code[20])
        {
            TableRelation = Customer;
        }
        field(6; "Nazwa Kontrahenta"; Text[50])
        {
        }
        field(7; "Nazwa Szukana Kontaktu"; Text[50])
        {
        }
        field(8; "Data Utworzenia"; Date)
        {
        }
        field(9; "ID Utworzenia"; Code[20])
        {
        }
        field(10; "Kod Sprzedawcy"; Code[20])
        {
            TableRelation = "Salesperson/Purchaser";
        }
        field(11; "Zlecenie Projektowe"; Code[20])
        {
            Editable = true;
            TableRelation = "AMC Zlecenie projektowe";
        }
        field(12; "No. Series"; Code[20])
        {
        }
        field(13; "Territory Code"; Code[10])
        {
            Caption = 'Kod Regionu';
            TableRelation = Territory;
        }
        field(15; "Kod Grupy Produktu"; Code[10])
        {
            TableRelation = "AMC Material Group"."Material Code" where("Material Group" = const("Podział Kart"));
        }
        field(16; "Nazwa Grupy Produktu"; Text[50])
        {
        }
        field(20; "Data Dokumentu"; Date)
        {
        }
        field(30; "Wzorzec Karty"; Boolean)
        {
        }
        field(50; Status; Enum "AMC Technology Card")
        {
        }
        field(60; "Utworzono z Karty Technolog."; Code[20])
        {
        }
        field(100; Remarks; Text[200])
        {
            Caption = 'Remarks';
        }
        field(101; "Ilość prod. przed obróbk. term"; Decimal)
        {
        }
        field(102; "Ilość gotowego produktu"; Decimal)
        {
        }
        field(103; "Straty na maszynach [%]"; Decimal)
        {
        }
        field(104; "Straty na masz. wartość"; Decimal)
        {
        }
        field(105; "Ubytki termiczne [%]"; Decimal)
        {
        }
        field(106; "Ubytki termiczne wartość"; Decimal)
        {
        }
        field(107; "Wartość kalkulacyjna"; Decimal)
        {
        }
        field(108; "Cena got. prod. [kg]"; Decimal)
        {
        }
        field(109; "Koszt prod."; Decimal)
        {
        }
        field(110; Zysk; Decimal)
        {
        }
        field(111; "Cena + koszty prod + zysk [kg]"; Decimal)
        {
        }
        field(140; "Nastrzyk / Wlewka [%]"; Decimal)
        {
        }
        field(141; "Wydajność końcowa [%]"; Decimal)
        {
        }
        field(142; "Suma strat [%]"; Decimal)
        {
        }
        field(143; "Procent Prod [%]"; Decimal)
        {
        }
        field(144; "Cena 1kg + koszty prod."; Decimal)
        {
        }
        field(145; "Zysk [%]"; Decimal)
        {
        }
        field(160; "Drukuj Koszt Produk."; Boolean)
        {
        }
        field(165; "Drukuj Zysk. Produk."; Boolean)
        {
        }
        field(200; "Opis procesu"; Text[100])
        {
        }
        field(201; "Propozycja smaków I"; Text[100])
        {
        }
        field(202; "Propozycja smaków II"; Text[100])
        {
        }
        field(203; "Propozycja smaków III"; Text[100])
        {
        }
        field(300; "Card Printed"; Boolean)
        {
        }
        field(400; "Kopiuj do Regionu"; Code[10])
        {
            TableRelation = Territory;
        }
        field(401; "Karta Szablonowa"; Boolean)
        {
        }
        field(1001; "Razem Surowiec Ilość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Il. do Prod. [kg]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                       "Typ Specyfikacji" = const("Surowiec Podstawowy"),
                                                                                       "Jedn. Miary" = const(kg)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1002; "Razem Surowiec Wartość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość [PLN]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                   "Typ Specyfikacji" = const("Surowiec Podstawowy")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1003; "Razem Przyprawy Ilość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog.".Proporcje where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                             "Typ Specyfikacji" = const(Przyprawy),
                                                                             "Jedn. Miary" = filter(kg | l)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1004; "Razem Przyprawy Wartość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość [PLN]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                   "Typ Specyfikacji" = const(Przyprawy)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1005; "Razem Przyprawy Solanki"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość Solanki" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                     "Typ Specyfikacji" = const(Przyprawy)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1006; "Razem Mat.Pomocn. Ilość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Il. do Prod. [kg]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                       "Typ Specyfikacji" = const("Materiały Pomocnicze"),
                                                                                       "Jedn. Miary" = filter(kg | l)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1007; "Wartość Całkowita"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość [PLN]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(1008; "Razem Wartość Proporcji"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość Proporcji [PLN]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                             "Typ Specyfikacji" = const(Przyprawy)));
            FieldClass = FlowField;
        }
        field(1009; "Razem Mat.Pomoc. Wartość"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Wartość [PLN]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                   "Typ Specyfikacji" = const("Materiały Pomocnicze")));
            FieldClass = FlowField;
        }
        field(1010; "Razem Przyprawy do Prod"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog."."Il. do Prod. [kg]" where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                                       "Typ Specyfikacji" = const(Przyprawy),
                                                                                       "Jedn. Miary" = filter(kg | l)));
            FieldClass = FlowField;
        }
        field(1020; "Razem Próby"; Decimal)
        {
            CalcFormula = sum("AMC Spec. Karty Technolog.".Próba where("Karta Technologiczna Nr" = field("Nr Karty Technologicznej"),
                                                                         "Jedn. Miary" = filter(kg | l)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(2001; "Plik Karty Techn. PDF"; Text[100])
        {
        }
        field(2002; "Plik Receptury PDF"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Nr Karty Technologicznej")
        {
            Clustered = true;
        }
        key(Key2; "Nazwa Produktu")
        {
        }
        key(Key3; "Kod Sprzedawcy", "Nazwa Produktu")
        {
        }
        key(Key4; "Nazwa Szukana Kontaktu", "Nr Karty Technologicznej")
        {
        }
    }

    fieldgroups
    {
    }
}

