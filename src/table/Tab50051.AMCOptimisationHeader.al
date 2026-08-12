table 50051 "AMC Optimisation Header"
{
    Caption = 'Optimisation Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Optimisation Code"; Code[20])
        {
            Caption = 'Table Name';
        }
        field(2; "Item Code"; Code[20])
        {
            Caption = 'Kod Zapasu';
            TableRelation = Item;
        }
        field(3; "Item Description"; Text[100])
        {
            Caption = 'Nazwa Zapasu';
        }
        field(4; "Production BOM Code"; Code[20])
        {
            Caption = 'Kod BOMu Produkcyjnego';
            TableRelation = "Production BOM Header"."No." WHERE("AMC BOM Type" = CONST(Production));
        }
        field(5; "Production BOM Description"; Text[100])
        {
            Caption = 'Opis BOMu Produkcyjnego';
        }
        field(6; "Source RiD BOM Code"; Code[20])
        {
            Caption = 'Żródłowy Kod BOMu RiD';
            TableRelation = "Production BOM Header"."No." WHERE("AMC BOM Type" = CONST(RiD));
        }
        field(7; "Optimalisation Date"; Date)
        {
            Caption = 'Data Optymalizacji';
        }
        field(8; "No. Series"; Code[10])
        {
            Caption = 'Nr Serii';
        }
        field(9; "Item Code of Measure"; Code[20])
        {
            Caption = 'Kod Jedn. Miary Zapasu';
        }
        field(10; "Optimalisation Description"; Text[200])
        {
            Caption = 'Opis Optymalizacji';
        }
        field(11; "Optimalisation Realisation Des"; Text[200])
        {
            Caption = 'Opis Realizacji Optymalizacji';
        }
        field(12; "Item Blocked"; Boolean)
        {
            CalcFormula = Lookup(Item.Blocked WHERE("No." = FIELD("Item Code")));
            Caption = 'Zapas Zablokowany';
            Editable = false;
            FieldClass = FlowField;
        }
        field(20; "Register User ID"; Code[20])
        {
            Caption = 'Kod Użytkownika Rejestr.';
        }
        field(21; "Registry Date"; DateTime)
        {
            Caption = 'Data Zarejestr. Zgłoszenia';
        }
        field(22; "Registry Status"; Option)
        {
            Caption = 'Status Zgłoszenia';
            OptionCaption = ' ,New,Calculation Request,In Process,Realised in R&D,Closed,Finished,Canceled';
            OptionMembers = " ",New,"Calculation Request","In Process",Realised,"Finished in R&D",Closed,Canceled;
        }
        field(23; "Cancel Date"; DateTime)
        {
            Caption = 'Data Anulowania';
        }
        field(24; "Cancel User ID"; Code[20])
        {
            Caption = 'Użytkownik Anulowania';
        }
        field(25; "Close Date"; DateTime)
        {
            Caption = 'Data ZamknięciA';
        }
        field(26; "Close User ID"; Code[20])
        {
            Caption = 'Użytkownik Zamknięcia';
        }
        field(30; "Optimalisatin Author."; Boolean)
        {
            Caption = 'Autoryzacja Optymalizacji';
        }
        field(31; "Authorisation ID Code"; Code[20])
        {
            Caption = 'Użytkownik Autoryzujacy';
        }
        field(32; "Autorisation Date"; DateTime)
        {
            Caption = 'Data Authoryzacji';
        }
        field(40; "Planned Realisation Date"; Date)
        {
            Caption = 'Planowana Data Aktualizacji BOMu Prod.';
        }
        field(41; "Realisation Date"; Date)
        {
            Caption = 'Uzgodniona Data Aktualizacj BOMu Prod.';
        }
        field(42; "Updating Date"; DateTime)
        {
            CalcFormula = Lookup("Production BOM Header"."AMC Generate Time"
            WHERE("AMC BOM Type" = FILTER(RiD),
                "AMC Generate" = CONST(true),
                "AMC Optimisation Code" = FIELD("Optimisation Code")));
            Caption = 'Data Aktualizacji BOMu Prod.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; "Last Item Prod. Unit Cost"; Decimal)
        {
            Caption = 'Ostatni Koszt Jedn. Prod.';
            DecimalPlaces = 5 : 5;
        }
        field(52; "Last Item Prod. Date"; Date)
        {
            Caption = 'Ostatnia Data Produkcji';
        }
        field(60; "Item Budget Instance"; Code[20])
        {
            Caption = 'Instancja Budżetu Wyceny';
            TableRelation = "AMC Item Budget Instance";
        }
        field(61; "Last Item Calculation Cost"; Decimal)
        {
            Caption = 'Ostatnia Wycena Kalkulacyjna';
            DecimalPlaces = 5 : 5;
        }
        field(62; "Last Item Calculation Actual"; Decimal)
        {
            Caption = 'Ostatnia Wartość Bieżąca';
            DecimalPlaces = 5 : 5;
        }
        field(63; "Last Item Calculation Date"; DateTime)
        {
            Caption = 'Ostatnia Data Kalkulacji';
        }
        field(64; "Last Item Calculation No"; Code[20])
        {
            Caption = 'Nr Ostatniej Wyceny';
            TableRelation = "AMC Item Calculation";
        }
        field(80; "KJ Authorisation"; Boolean)
        {
            Caption = 'Autoryzacja KJ';
        }
        field(81; "KJ Author. UserID"; Code[20])
        {
            Caption = 'Kod Autoryzacji KJ';
        }
        field(82; "KJ Author. Date"; DateTime)
        {
            Caption = 'Data Autoryzacji KJ';
        }
        field(83; "KJ Author. Notes"; Text[150])
        {
            Caption = 'Uwagi Autoryzacji KJ';
        }
        field(84; "KJ Autor. Reject"; Boolean)
        {
            Caption = 'Odrzucenie Autoryzacji KJ';
        }
        field(90; "Purch. Authorisation"; Boolean)
        {
            Caption = 'Autoryzacja Zaopatrzenie';
        }
        field(91; "Purch. Author. UserID"; Code[20])
        {
            Caption = 'Kod Autoryzacji Zaopatrz.';
        }
        field(92; "Purch. Author. Date"; DateTime)
        {
            Caption = 'Data Autoryzacji Zaopatrz.';
        }
        field(93; "Purch. Author. Notes"; Text[150])
        {
            Caption = 'Uwagi Autoryzacja Zaopatrzenie';
        }
        field(94; "Purch. Autor. Reject"; Boolean)
        {
            Caption = 'Odrzucenie Autoryzacji Zaopatrzenie';
        }
    }

    keys
    {
        key(Key1; "Optimisation Code")
        {
            Clustered = true;
        }
    }
}
