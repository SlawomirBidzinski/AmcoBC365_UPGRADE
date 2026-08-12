table 50049 "AMC Item Calculation"
{
    Caption = 'Item Calculation';
    DrillDownPageId = "AMC Item Calculation List";
    LookupPageId = "AMC Item Calculation List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Calculation No"; Code[20])
        {
            Caption = 'Nr Wyceny';
        }
        field(2; "Item Budget Instance"; Code[20])
        {
            Caption = 'Item Budget Instance';
            TableRelation = "AMC Item Budget Instance";
        }
        field(3; "Source Type"; Option)
        {
            Caption = 'Calculate Type';
            OptionCaption = ' ,Item,BOM';
            OptionMembers = " ",Item,BOM;
        }
        field(4; "Source Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = IF ("Source Type" = CONST(Item)) Item."No."
            WHERE("AMC Item Type" = FILTER(Wyroby | Półprodukt))
            ELSE IF ("Source Type" = CONST(BOM)) "Production BOM Header"."No."
            WHERE("AMC BOM Type" = CONST(RiD));
        }
        field(5; "Code Description"; Text[100])
        {
            Caption = 'Code Description';
        }
        field(6; "Calculation Type"; Option)
        {
            Caption = 'Calculation Type';
            OptionCaption = ' ,based on costs,based on price list';
            OptionMembers = " ","wg kosztów","wg cennika";
        }
        field(7; "Calculation Date"; Date)
        {
            Caption = 'Data Dokumentu';
        }
        field(8; "No. Series"; Code[20])
        {
            Caption = 'Nr Serii';
        }
        field(24; "Calculation Entry"; Integer)
        {
            Caption = 'Nr wyceny';
        }
        field(50; "Calculatin Init"; Boolean)
        {
            Caption = 'Inicjowanie Zapytania';
        }
        field(51; "Init Date Time"; DateTime)
        {
            Caption = 'Data zapytania wyceny';
        }
        field(52; "Init UserID"; Code[20])
        {
            Caption = 'Użytkownik zapytania';
            TableRelation = User;
        }
        field(53; "Calculation Status"; Option)
        {
            Caption = 'Status wyceny';
            OptionCaption = 'New,Ordered,In Process,Finished,Canceled';
            OptionMembers = New,Ordered,"In Process",Finished,Canceled;
        }
        field(54; "Calculation UserID"; Code[20])
        {
            Caption = 'Użytkownik Zatwierdzający';
        }
        field(55; "Calculatio Date Time"; DateTime)
        {
            Caption = 'Data Zatwierdzenia';
        }
        field(56; "Calculation Close"; Boolean)
        {
            Caption = 'Zatwierdzenie Wyceny';
        }
        field(60; "Maksimum BOM Level"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Max("AMC Item Calculation Line"."BOM Level"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Maksymalny poziom BOM';
            Editable = false;
        }
        field(71; "Generowanie Zbiorcze"; Boolean)
        {
            Caption = 'Generowanie Zbiorcze';
        }
        field(72; "Rozwinięcie BOMów"; Boolean)
        {
            Caption = 'Rozwinięcie BOMów';
        }
        field(73; "Brak Ceny dla Zapasów"; Boolean)
        {
            Caption = 'Brak Ceny dla Zapasu';
        }
        field(74; "Zablokowany Cennik Zapasu"; Boolean)
        {
            Caption = 'Zablok. Cennik dla Zapasu';
        }
        field(101; "Currency USD Rate"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kurs Wymiany USD';
            DecimalPlaces = 4 : 4;
        }
        field(102; "Currency EUR Rate"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kurs Wymiany EUR';
            DecimalPlaces = 4 : 4;
        }
        field(103; "Currency GBP Rate"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kurs Wymiany GBP';
            DecimalPlaces = 4 : 4;
        }
        field(104; "Currency CHF Rate"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kurs Wymiany CHF';
            DecimalPlaces = 4 : 4;
        }
        field(201; "Includes IFF Flavor"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist("AMC Item Calculation Line" WHERE("Calculation No" = FIELD("Calculation No"),
                                                               "Component IFF Flaver" = CONST(true)));
            Caption = 'Zawiera Aromat IFF';
        }
        field(202; "Value of IFF Flavor"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = Sum("AMC Item Calculation Line"."Component IFF Flaver Qty"
            WHERE("Calculation No" = FIELD("Calculation No")));
            Caption = 'Zawartość Aromatu IFF';
            DecimalPlaces = 5 : 5;
        }
        field(203; "Total Calc. Qty Items"; Decimal)
        {
            CalcFormula = Sum("AMC Item Calculation Line".Quantity
            WHERE("Calculation No" = FIELD("Calculation No"),
                                                                      "Weight Item" = CONST(true)));
            Caption = 'Razem Ilość Zapasów';
            DecimalPlaces = 5 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(204; "Total Cal. Value"; Decimal)
        {
            CalcFormula = Sum("AMC Item Calculation Line"."Total Component Amount"
            WHERE("Calculation No" = FIELD("Calculation No"), "Sub BOM" = CONST(false)));
            Caption = 'Razem Wartość Kalkulacji';
            DecimalPlaces = 5 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(205; "Total Actual Value"; Decimal)
        {
            CalcFormula = Sum("AMC Item Calculation Line"."Total Actual Amount" WHERE("Calculation No" = FIELD("Calculation No"),
                                                                                   "Sub BOM" = const(false)));
            Caption = 'Razem Wartość Bieżąca';
            DecimalPlaces = 5 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(206; "Qty of Components"; Integer)
        {
            CalcFormula = Count("AMC Item Calculation Line" WHERE("Calculation No" = FIELD("Calculation No"),
                                                               "Sub BOM" = const(false),
                                                               "Component Type" = FILTER(Surowce | Towary)));
            Caption = 'Ilość Komponentów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(250; "Last Calculation Time"; DateTime)
        {
            Caption = 'Data ostat. kalkulacji';
            Editable = false;
        }
        field(251; "Last Calculation UserID"; Code[20])
        {
            Caption = 'Użytkownik ostat. kalkulacji';
            Editable = false;
        }
        field(300; "Calculation Notes"; Text[250])
        {
            Caption = 'Uwagi do Wyceny';
        }
        field(301; "Notes Exist"; Boolean)
        {
            CalcFormula = Exist("AMC Item Calculation" WHERE("Calculation No" = FIELD("Calculation No"),
                                                          "Calculation Notes" = FILTER(<> '')));
            Caption = 'Uwagi';
            FieldClass = FlowField;
        }
        field(302; "Notes Additn."; Text[250])
        {
            Caption = 'Uwagi Dodatkowe';
        }
        field(303; "Init Notes"; Text[250])
        {
            Caption = 'Uwagi Zlecającego';
        }
        field(310; "Include Packages"; Boolean)
        {
            CalcFormula = Exist("AMC Item Calculation Line" WHERE("Calculation No" = FIELD("Calculation No"),
                                                               "Component Type" = CONST(Opakowania),
                                                               "BOM Level" = CONST(0)));
            Caption = 'Zawiera Opakowania';
            FieldClass = FlowField;
        }
        field(311; "Init Source"; Option)
        {
            Caption = 'Źródło Utworzenia';
            OptionCaption = 'Standard,Optimalisation,Group Comp Update';
            OptionMembers = Standard,Optimalisation,"Group Comp Update";
        }
        field(312; "Optimalisation Code"; Code[20])
        {
            Caption = 'Kod Zgł. Optymalizacji';
            TableRelation = "AMC Optimisation Header";
        }
        field(1000; "Item Code FlowFilter"; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(1001; "Item Filter Quantity"; Integer)
        {
            CalcFormula = Count(Item WHERE("No." = FIELD("Item Code FlowFilter")));
            FieldClass = FlowField;
        }
        field(1002; "Item Blocked"; Boolean)
        {
            CalcFormula = Lookup(Item.Blocked WHERE("No." = FIELD("Source Code")));
            Caption = 'Zapas Zablokowany';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Calculation No")
        {
            Clustered = true;
        }
        key(Key2; "Source Type", "Source Code", "Calculation Date")
        {
        }
    }
}
