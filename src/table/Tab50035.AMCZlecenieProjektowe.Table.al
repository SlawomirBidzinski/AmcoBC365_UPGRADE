table 50035 "AMC Zlecenie Projektowe"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Kod zlecenia"; Code[20])
        {
            Caption = 'Kod zlecenia';
        }
        field(2; "Temat pracy"; Text[100])
        {
            Caption = 'Temat pracy';
        }
        field(3; Sprzedawca; Code[20])
        {
            Caption = 'Sprzedawca';
            TableRelation = "Salesperson/Purchaser";
        }
        field(4; Kontrahent; Code[20])
        {
            Caption = 'Kontrahent';
            TableRelation = Customer;
        }
        field(5; "Nazwa Kontrahenta"; Text[50])
        {
            Caption = 'Nazwa Kontrahenta';
        }
        field(6; "Nazwa Szukana Kontrahenta"; Code[50])
        {
            Caption = 'Nazwa Szukana Kontrahenta';
        }
        field(7; "Kod Kontaktu"; Code[20])
        {
            Caption = 'Kod Kontaktu';
            TableRelation = Contact;
        }
        field(8; "Nazwa Kontaktu"; Text[50])
        {
            Caption = 'Nazwa Kontaktu';
        }
        field(9; "Telefon Kontaktowy"; Text[10])
        {
            Caption = 'Telefon Kontaktowy';
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Wstępny,W trakcie,Zawieszony,Zakończony';
            OptionMembers = "Wstępny","W trakcie",Zawieszony,"Zakończony";
        }
        field(11; Faza; Option)
        {
            Caption = 'Faza';
            OptionCaption = ' ,Zerowa,Przygotowanie Próby,Próba Gotowa,Próby u Klienta,Pierwsza Sprzedaż';
            OptionMembers = " ",Zerowa,"Przygotowanie Próby","Próba Gotowa","Próby u Klienta","Pierwsza Sprzedaż";
        }
        field(12;"Ocena Końcowa";Option)
        {
            Caption = 'Ocena Końcowa';
            OptionCaption = ' ,Sukces,Porażka';
            OptionMembers = " ",Sukces,"Porażka";
        }
        field(13; "Indeks Produktu"; Code[20])
        {
            Caption = 'Indeks Produktu';
            TableRelation = Item;
        }
        field(14; "Nazwa Produktu"; Text[50])
        {
            Caption = 'Nazwa Produktu';
        }
        field(15; "Kod Jedn. Produktu"; Code[20])
        {
            Caption = 'Kod Jedn. Produktu';
        }
        field(16; "Uwagi Sprzedawcy"; Text[100])
        {
            Caption = 'Uwagi Sprzedawcy';
        }
        field(17; "Nazwa Sprzedawcy"; Text[50])
        {
            CalcFormula = lookup("Salesperson/Purchaser".Name where (Code=field(Sprzedawca)));
            Caption = 'Nazwa Sprzedawcy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Kod Karty Technologicznej"; Code[20])
        {
            Caption = 'Kod Karty Technologicznej';
            TableRelation = "AMC Karta Technologiczna";
        }
        field(21;"Wzorzec Wyrób";Boolean)
        {
            Caption = 'Wzorzec Wyrób';
        }
        field(22; "Wzorzec Mieszanka"; Boolean)
        {
            Caption = 'Wzorzec Mieszanka';
        }
        field(30; "Nazwa Indeksu Produktu"; Text[100])
        {
            CalcFormula = lookup(Item.Description where ("No." = field("Indeks Produktu")));
            Caption = 'Nazwa Indeksu Produktu';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Nazwa Karty Technologicznej"; Text[50])
        {
            CalcFormula = lookup("AMC Karta Technologiczna"."Nazwa Produktu" where ("Nr Karty Technologicznej" = field("Nazwa Karty Technologicznej")));
            Caption = 'Nazwa Karty Technologicznej';
            Editable = false;
            FieldClass = FlowField;
        }
        field(41; "Kod Developer"; Code[20])
        {
            Caption = 'Kod Dewelopera';
            TableRelation = Manufacturer;
        }
        field(42; "Nazwa Dewelopera"; Text[50])
        {
            CalcFormula = lookup(Manufacturer.Name where (Code = field("Kod Developer")));
            Caption = 'Nazwa Dewelopera';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "Sugerowana Cena"; Decimal)
        {
            Caption = 'Sugerowana Cena';
        }
        field(51;"Sugerowane Dozowanie [g/100kg]";Decimal)
        {
            Caption = 'Sugerowane Dozowanie [g/100kg]';
        }
        field(52;"Przew. Wielkość Sprzedaży";Decimal)
        {
            Caption = 'Przewidywana Wielkość Sprzedaży [per/mies]';
        }
        field(53; "Termin Realizacji"; Date)
        {
            Caption = 'Termin Realizacji';
        }
        field(54; "Ogran. T(E621)"; Boolean)
        {
            Caption = 'Ogran. T(E621)';
        }
        field(55; "Ogran. A (Alergen)"; Boolean)
        {
            Caption = 'Ogran. A (Alergen)';
        }
        field(56; "Ogran. F(Fosforan)"; Boolean)
        {
            Caption = 'Ogran. F(Fosforan)';
        }
        field(57;"Ogran. E '0'";Boolean)
        {
            Caption = 'Ogran. E ''0''';
        }
        field(58; "Ogran. Inne"; Text[100])
        {
            Caption = 'Ogran. Inne';
        }
        field(59; "Dodatkowe Informacje"; Text[200])
        {
            Caption = 'Dodatkowe Informacje';
        }
        field(60; "Akceptacja Dz. Handl."; Boolean)
        {
            Caption = 'Akceptacja Dz. Handlowy';
        }
        field(62; "Akceptacja ID Dz. Handl."; Code[20])
        {
            Caption = 'ID Dz. Handlo';
        }
        field(63; "Akceptacja Data Dz. Handl."; DateTime)
        {
            Caption = 'Data Akceptacji Dz. Handl.';
        }
        field(65; "Akceptacja Dz. R&D."; Boolean)
        {
            Caption = 'Akceptacja Dz. R&D.';
        }
        field(66; "Akceptacja ID Dz. R&D"; Code[20])
        {
            Caption = 'Akceptacja ID Dz. R&D';
        }
        field(67; "Akceptacja Data Dz.R&D"; DateTime)
        {
            Caption = 'Akceptacja Data Dz.R&D';
        }
        field(68; "Uzasadnienie Dz. Handl."; Text[30])
        {
            Caption = 'Uzasadnienie Dz. Handl.';
        }
        field(69; "Uzasadnienie Dz. R&D"; Text[30])
        {
            Caption = 'Uzasadnienie Dz. R&D';
        }
    }

    keys
    {
        key(Key1;"Kod zlecenia")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

