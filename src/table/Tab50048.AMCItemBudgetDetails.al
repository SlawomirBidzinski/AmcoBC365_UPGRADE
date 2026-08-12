table 50048 "AMC Item Budget Details"
{
    Caption = 'Item Budget Details';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item Budget Instance"; Code[20])
        {
            Caption = 'Item Budget Instance';
            TableRelation = "AMC Item Budget Instance";
        }
        field(2; "Due Date"; Date)
        {
            CalcFormula = Lookup("AMC Item Budget Instance"."Date From" WHERE
            ("Item Budget Instance" = FIELD("Item Budget Instance")));
            Caption = 'Data Obowiązywania';
            Editable = false;
            FieldClass = FlowField;
        }
        field(3; "Item Code"; Code[20])
        {
            Caption = 'Item Code';
            TableRelation = Item;
        }
        field(4; "Item Description"; Text[100])
        {
            Caption = 'Nazwa Zapasu';
            Editable = false;
        }
        field(5; "Unit of Measure Code"; Code[20])
        {
            Caption = 'Kod Jedn. Miary';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item Code"));
        }
        field(6; "Vendor Code"; Code[10])
        {
            Caption = 'Kod Dostawcy';
            TableRelation = Vendor;
        }
        field(7; "Vendor Name"; Text[100])
        {
            Caption = 'Nazwa Dostawcy';
            Editable = false;
        }
        field(8; "Item Type"; Option)
        {
            Caption = 'Typ Zapasu';
            OptionCaption = ' ,Surowce,Wyroby,Towary,Półprodukt,Próba,Opakowania,Tymcz. R&D';
            OptionMembers = " ",Surowce,Wyroby,Towary,"Półprodukt","Próba",Opakowania,"Tymcz. R&D";
        }
        field(50; "Last Direct Cost"; Decimal)
        {
            Caption = 'Ostatni Koszt Bezpośredni';
        }
        field(51; "Item Cost"; Decimal)
        {
            Caption = 'Koszt Jednostkowy';
        }
        field(52; "Last Purchase Date"; Date)
        {
            Caption = 'Data Ostaniego Zakupu';
        }
        field(53; "Last Purchase Vendor"; Code[20])
        {
            Caption = 'Kod Dostawcy Ostat. Zakupu';
            TableRelation = Vendor;
        }
        field(100; "Vendor Qty"; Integer)
        {
            Caption = 'Ilość Dostawców';
        }
        field(101; "Currency Code"; Code[20])
        {
            Caption = 'Kod Waluty';
            TableRelation = Currency;
        }
        field(102; "Unit Cost"; Decimal)
        {
            Caption = 'Kosz Jednostkowy';
            DecimalPlaces = 5 : 5;
        }
        field(103; "Minimum Order Qty"; Decimal)
        {
            Caption = 'Min. Ilość Zamówienia';
        }
        field(104; "Currency Exchange Rate"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kurs Przeliczenia Waluty';
            DecimalPlaces = 4 : 4;
        }
        field(105; "Unit Cost LCY"; Decimal)
        {
            Caption = 'Koszt Jedn. PLN';
            DecimalPlaces = 5 : 5;
        }
        field(106; "Add. Cost"; Decimal)
        {
            Caption = 'Koszt Dodatkowy';
            DecimalPlaces = 5 : 5;
        }
        field(107; "Item Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Location Code" = FILTER('M.SUR'),
                                                                  "Item No." = FIELD("Item Code")));
            Caption = 'Ilość Zapasów M_SUR, M_OP';
            Editable = false;
        }
        field(108; "Item Comp. Qty"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Production BOM Line" WHERE(Type = CONST(Item),
                                                             "AMC BOM Type" = CONST(Production),
                                                             "No." = FIELD("Item Code")));
            Caption = 'Ilość Komp. w BOMach Prod.';
            Editable = false;
        }
        field(109; "IFF Aromat"; Boolean)
        {
            Caption = 'Aromat IFF';
        }
        field(110; Fabryka; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AMC Producent" WHERE("No." = FIELD("Item Code")));
            Caption = 'Fabryka';
            Editable = false;
        }
        field(111; Brand; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."AMC Fabryka" WHERE("No." = FIELD("Item Code")));
            Caption = 'Brand';
            Editable = false;
        }
        field(112; "Exist on Calc"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = Exist("AMC Item Calculation Line"
            WHERE("Item Budget Instance" = FIELD("Item Budget Instance"),
                    "Component Code" = FIELD("Item Code")));
            Caption = 'Istnieje w Kalk.';
        }
        field(113; "Block in Autom. Calc"; Boolean)
        {
            Caption = 'Blokuj w Automat. Kalkulacji';
        }
        field(150; "Item Price Verified"; Boolean)
        {
            Caption = 'Cena zweryfikowana';
        }
        field(151; "Verification Date"; DateTime)
        {
            Caption = 'Data Weryfikacji';
        }
        field(152; "UserId Verification"; Code[20])
        {
            Caption = 'Osoba Weryfikująca';
            TableRelation = User;
        }
    }

    keys
    {
        key(Key1; "Item Budget Instance", "Item Code", "Unit of Measure Code", "Minimum Order Qty")
        {
            Clustered = true;
        }
        key(Key2; "Item Budget Instance", "Item Description", "Item Code")
        {
        }
    }
}
