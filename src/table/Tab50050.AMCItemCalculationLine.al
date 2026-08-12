table 50050 "AMC Item Calculation Line"
{
    Caption = 'Item Calculation Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Calculation No"; Code[20])
        {
            Caption = 'Calculation No';
        }
        field(2; "Calculation Line No"; Integer)
        {
            Caption = 'Calculation Line No';
        }
        field(10; "Item Budget Instance"; Code[20])
        {
            Caption = 'Instancja Budżetu Zapasu';
        }
        field(11; "Source Type"; Option)
        {
            Caption = 'Calculate Type';
            OptionCaption = ' ,Item,BOM';
            OptionMembers = " ",Item,BOM;
        }
        field(12; "Source Code"; Code[20])
        {
            Caption = 'Code';
            TableRelation = IF ("Source Type" = CONST(Item)) Item."No."
            WHERE("AMC Item Type" = FILTER(Wyroby | Półprodukt))
            ELSE IF ("Source Type" = CONST(BOM)) "Production BOM Header"."No."
                            WHERE("AMC BOM Type" = CONST(RiD));
        }
        field(13; "Qty per Source"; Decimal)
        {
            Caption = 'Ilość źródła';
            DecimalPlaces = 5 : 5;
        }
        field(14; "Calculation Type"; Option)
        {
            Caption = 'Calculation Type';
            OptionCaption = ' ,based on costs,based on price list';
            OptionMembers = " ","wg kosztów","wg. cennika";
        }
        field(15; "Sub BOM"; Boolean)
        {
            Caption = 'Składnik BOM';
        }
        field(16; "BOM Level"; Integer)
        {
            Caption = 'Poziom BOMu';
        }
        field(17; "Weight Item"; Boolean)
        {
            Caption = 'Zapas Wagowy';
        }
        field(73; "Brak Ceny dla Zapasów"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist("AMC Item Budget Details"
            WHERE("Item Budget Instance" = FIELD("Item Budget Instance"),
                                                             "Item Code" = FIELD("Component Code"),
                                                             "Unit Cost LCY" = FILTER(= 0)));
            Caption = 'Brak Ceny dla Zapasu';
            Editable = false;
        }
        field(74; "Zablokowany Cennik Zapasu"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Max("AMC Item Budget Details"."Block in Autom. Calc"
            WHERE("Item Budget Instance" = FIELD("Item Budget Instance"),
                "Item Code" = FIELD("Component Code")));
            Caption = 'Zablok. Cennik dla Zapasu';
            Editable = false;
        }
        field(75; "Brak Zapasu w Cenniku"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = - Exist("AMC Item Budget Details"
            WHERE("Item Budget Instance" = FIELD("Item Budget Instance"),
                                                              "Item Code" = FIELD("Component Code")));
        }
        field(201; "Component Code"; Code[20])
        {
            Caption = 'Component Code';
            TableRelation = Item;
        }
        field(202; "Component Name"; Text[100])
        {
            Caption = 'Component Name';
        }
        field(203; "Component Code Of Measure"; Code[20])
        {
            Caption = 'Component Code Of Measure';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Component Code"));
        }
        field(204; "Component BOM Source"; Code[20])
        {
            Caption = 'Component BOM Source';
        }
        field(205; "Component IFF Flaver"; Boolean)
        {
            Caption = 'Komponent Aromat IFF';
        }
        field(206; "Component IFF Flaver Qty"; Decimal)
        {
            Caption = 'Ilość Komp. Aromatu IFF';
            DecimalPlaces = 5 : 5;
        }
        field(207; "Component Type"; Option)
        {
            Caption = 'Typ Zapasu';
            OptionCaption = ' ,Surowce,Wyroby,Towary,Półprodukt,Próba,Opakowania,Tymcz. R&D';
            OptionMembers = " ",Surowce,Wyroby,Towary,"Półprodukt","Próba",Opakowania,"Tymcz. R&D";
        }
        field(250; "Unit Cost"; Decimal)
        {
            Caption = 'Kosz Jedn. zap. PLN';
            DecimalPlaces = 5 : 5;
        }
        field(251; "Last Unit Cost"; Decimal)
        {
            Caption = 'Ostatni Koszt Jedn. PLN';
            DecimalPlaces = 5 : 5;
        }
        field(252; "Budget Unit Price"; Decimal)
        {
            Caption = 'Koszt Budżetowy Walut.';
            DecimalPlaces = 5 : 5;
        }
        field(253; "Budget Unit Addit."; Decimal)
        {
            Caption = 'Dodatkowy Koszt Budż';
            DecimalPlaces = 5 : 5;
        }
        field(254; "Budget Unit Cost Total"; Decimal)
        {
            Caption = 'Razem Koszt Budżetowy';
            DecimalPlaces = 5 : 5;
        }
        field(255; "Budget Unit Cost LCY"; Decimal)
        {
            Caption = 'Razem Koszt Budżetowy PLN';
            DecimalPlaces = 5 : 5;
        }
        field(256; "Budget Unit Addit. LCY"; Decimal)
        {
            Caption = 'Razem Dodtk. Koszt Budżet. PLN';
            DecimalPlaces = 5 : 5;
        }
        field(260; "Type of Income"; Option)
        {
            Caption = 'Typ Przyjęcia';
            OptionCaption = ' ,Purchase,Corr-InPlus';
            OptionMembers = " ",Purchase,"Corr-InPlus";
        }
        field(261; "Vendor Code"; Code[10])
        {
            Caption = 'Kod Dostawcy';
        }
        field(262; "Vendor Name"; Text[200])
        {
            Caption = 'Nazwa Dostawcy';
        }
        field(263; "Income Date"; Date)
        {
            Caption = 'Data Przyjęcia';
        }
        field(300; "Manulal Insert Cost"; Boolean)
        {
            Caption = 'Koszt Modyfikowany';
        }
        field(301; "Calculation Unit Cost"; Decimal)
        {
            Caption = 'Koszt Jedn. Wyceny';
            DecimalPlaces = 5 : 5;
        }
        field(302; "Currency Code"; Code[20])
        {
            Caption = 'Kod Waluty';
            TableRelation = Currency;
        }
        field(303; Quantity; Decimal)
        {
            Caption = 'Ilość';
            DecimalPlaces = 5 : 5;
        }
        field(304; "Component Amout"; Decimal)
        {
            Caption = 'Kwota Komponentu';
            DecimalPlaces = 2 : 5;
        }
        field(305; "Additional Cost"; Decimal)
        {
            Caption = 'Koszty Dodatkowe';
            DecimalPlaces = 5 : 5;
        }
        field(306; "Total Component Amount"; Decimal)
        {
            Caption = 'Razem kwota komponentu';
            DecimalPlaces = 2 : 5;
        }
        field(307; "Total Actual Amount"; Decimal)
        {
            Caption = 'Bieżąca kwota komponentu';
            DecimalPlaces = 5 : 5;
            Editable = false;
        }
        field(401; "Currecny Exchange"; Decimal)
        {
            Caption = 'Kurs wymiany';
            DecimalPlaces = 4 : 4;
        }
        field(402; "Component Cost LCY"; Decimal)
        {
            Caption = 'Kwota Kosztu PLN';
            DecimalPlaces = 5 : 5;
        }
    }

    keys
    {
        key(Key1; "Calculation No", "Calculation Line No")
        {
            Clustered = true;
            SumIndexFields = Quantity, "Total Component Amount", "Total Actual Amount";
        }
        key(Key2; "Component IFF Flaver")
        {
            SumIndexFields = "Component IFF Flaver Qty";
        }
        key(Key3; "Calculation No", "Weight Item", "Component Type", "Sub BOM")
        {
            SumIndexFields = Quantity, "Total Component Amount", "Total Actual Amount";
        }
    }
}
