table 50052 "AMC Optimisation Line"
{
    Caption = 'Optimisation Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Optimisation Code"; Code[20])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Optimisation Line"; Integer)
        {
            Caption = 'Optimisation Line';
        }
        field(3; "BOM Type"; Option)
        {
            Caption = 'Typ BOMu';
            OptionCaption = ' ,Production,RiD';
            OptionMembers = " ",Production,RiD;
        }
        field(13; "BOM RiD Code"; Code[20])
        {
            Caption = 'BOM RiD Code';
            TableRelation = IF ("BOM Type" = CONST(RiD)) "Production BOM Header"."No."
            WHERE("AMC BOM Type" = CONST(RiD))
            ELSE IF ("BOM Type" = CONST(Production)) "Production BOM Header"."No."
            WHERE("AMC BOM Type" = CONST(Production));
        }
        field(14; "BOM RiD Description"; Text[100])
        {
            Caption = 'Nazwa BOMU RiD';
        }
        field(15; "Optimalizacion Typ"; Option)
        {
            Caption = 'Tym Optymalizacji';
            OptionCaption = ' ,Zmiana Komponentów,Nowy Produkt,BOM Pierwotny';
            OptionMembers = " ","Zmiana Komponentów","Nowy Produkt","BOM Pierwotny";
        }
        field(16; "Optimalizacion Description"; Text[200])
        {
            Caption = 'Opis Optymalizacji';
        }
        field(20; "Item Budget Instance"; Code[20])
        {
            Caption = 'Instancja Budżetu';
            TableRelation = "AMC Item Budget Instance";
        }
        field(21; "Calculation No"; Code[20])
        {
            Caption = 'Nr Wyceny';
            TableRelation = "AMC Item Calculation";
        }
        field(22; "Calculation Date"; DateTime)
        {
            CalcFormula = Lookup("AMC Item Calculation"."Last Calculation Time"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Data Kalkulacji Wyceny';
            Editable = false;
            FieldClass = FlowField;
        }
        field(23; "Calculaction Status"; Option)
        {
            CalcFormula = Lookup("AMC Item Calculation"."Calculation Status"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Status Wyceny';
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = 'New,Ordered,In Process,Finished,Canceled';
            OptionMembers = New,Ordered,"In Process",Finished,Canceled;
        }
        field(25; "Calculation UserID"; Code[20])
        {
            CalcFormula = Lookup("AMC Item Calculation"."Calculation UserID"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Użytkownik Zatwierdzający';
            Editable = false;
            FieldClass = FlowField;
        }
        field(26; "Calculation Date Time"; DateTime)
        {
            CalcFormula = Lookup("AMC Item Calculation"."Calculatio Date Time"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Data Zatwierdzenia Wyceny';
            Editable = false;
            FieldClass = FlowField;
        }
        field(27; "Calculation Close"; Boolean)
        {
            CalcFormula = Lookup("AMC Item Calculation"."Calculation Close"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Zatwierdzenie Wyceny';
            Editable = false;
            FieldClass = FlowField;
        }
        field(28; "Total Cal. Value"; Decimal)
        {
            CalcFormula = Sum("AMC Item Calculation Line"."Total Component Amount"
            WHERE("Calculation No" = FIELD("Calculation No"), "Sub BOM" = CONST(false)));
            Caption = 'Razem Wartość Kalkulacji';
            DecimalPlaces = 5 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(29; "Total Actual Value"; Decimal)
        {
            CalcFormula = Sum("AMC Item Calculation Line"."Total Actual Amount"
            WHERE("Calculation No" = FIELD("Calculation No"), "Sub BOM" = CONST(false)));
            Caption = 'Razem Wartość Bieżąca';
            DecimalPlaces = 5 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(30; "Calculation Include Package"; Boolean)
        {
            CalcFormula = Exist("AMC Item Calculation Line" WHERE("Calculation No" = FIELD("Calculation No"),
                                                               "Component Type" = CONST(Opakowania),
                                                               "BOM Level" = CONST(0)));
            Caption = 'Wycena Zawiera Opakowan';
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Component Qty"; Integer)
        {
            CalcFormula = Count("AMC Item Calculation Line" WHERE("Calculation No" = FIELD("Calculation No"),
                                                               "Sub BOM" = CONST(false),
                                                               "Component Type" = FILTER(Surowce | Towary)));
            Caption = 'Ilość komponentów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Registy User ID"; Code[20])
        {
            Caption = 'Użytkownik Rejestrujący';
        }
        field(41; "Registry Time"; DateTime)
        {
            Caption = 'Data Zarejestrowania';
        }
        field(50; "Assign to Calculation"; Boolean)
        {
            Caption = 'Oznacz do Wyceny';
        }
        field(51; "Assign to Confirmation"; Boolean)
        {
            Caption = 'Oznacz do Zatwierdzenia';
        }
        field(100; "R&D BOM to Update"; Boolean)
        {
            Caption = 'BOM R&&D do Aktualizacji Prod';
        }
        field(101; "User ID BOM Pr Update"; Code[20])
        {
            CalcFormula = Lookup("Production BOM Header"."AMC Generate User" WHERE("No." = FIELD("BOM RiD Code"),
                "AMC Optimisation Code" = FIELD("Optimisation Code"), "AMC Generate" = CONST(true)));
            Caption = 'Użytkownik Aktualizujący BOM Prod.';
            FieldClass = FlowField;
            TableRelation = User;
        }
        field(102; "BOM Update Date"; DateTime)
        {
            CalcFormula = Lookup("Production BOM Header"."AMC Generate Time"
            WHERE("No." = FIELD("BOM RiD Code"), "AMC Optimisation Code" = FIELD("Optimisation Code"),
            "AMC Generate" = CONST(true)));
            Caption = 'Data Aktulizacji BOMu Prod.';
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Optimisation Code", "Optimisation Line")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Optimisation Code", "Optimisation Line")
        {
        }
    }
}
