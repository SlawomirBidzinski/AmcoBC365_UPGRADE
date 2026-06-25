table 50044 "AMC Item Budget Instance"
{
    Caption = 'Item Budget Instance';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Item Budget Instance"; Code[20])
        {
            Caption = 'Item Budget Instance';
        }
        field(2; "Item Budget Name"; Text[100])
        {
            Caption = 'Nazwa Instancji Zapasu';
        }
        field(3; "Date From"; Date)
        {
            Caption = 'Date From';
        }
        field(4; Notice; Text[200])
        {
            Caption = 'Uwagi';
        }
        field(5; "Default Instance"; Boolean)
        {
            Caption = 'Domyślna Instacja Budżetowa';
        }
        field(21; "Curency Rate EUR"; Decimal)
        {
            BlankZero = true;
            Caption = 'Curency Rate EUR';
            DecimalPlaces = 4 : 4;
        }
        field(22; "Curency Rate USD"; Decimal)
        {
            BlankZero = true;
            Caption = 'Curency Rate USD';
            DecimalPlaces = 4 : 4;
        }
        field(23; "Curency Rate GBP"; Decimal)
        {
            BlankZero = true;
            Caption = 'Curency Rate GBP';
            DecimalPlaces = 4 : 4;
        }
        field(24; "Curency Rate CHF"; Decimal)
        {
            BlankZero = true;
            Caption = 'Curency Rate CHF';
            DecimalPlaces = 4 : 4;
        }
        field(25; "Typ Wyceny"; Option)
        {
            Caption = 'Calculation Type';
            OptionCaption = ' ,based on costs,based on price list';
            OptionMembers = " ","wg kosztów","wg. cennika";
        }
        field(26; "Sprzedaż Data Od"; Date)
        {
        }
        field(27; "Sprzedaż Data Do"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Item Budget Instance")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

