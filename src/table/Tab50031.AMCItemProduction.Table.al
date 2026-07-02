table 50031 "AMC Item Production"
{
    DataClassification = CustomerContent;
    LookupPageId = "AMC Production List";
    DrillDownPageId = "AMC Production List";

    fields
    {
        field(1; "Entry Type"; Enum "AMC Production Entry Type")
        {
            Caption = 'Typ Zapisu';
        }
        field(2; Producent; Code[20])
        {
            Caption = 'Producent';
        }
        field(3; Fabryka; Code[20])
        {
            Caption = 'Brand';
        }
        field(4; "Nazwa Producenta"; Text[50])
        {
            Caption = 'Nazwa Producenta';
        }
        field(5; "Nazwa Fabryki"; Text[50])
        {
            Caption = 'Nazwa Brandu';
        }
        field(6; "Currency Code"; Code[20])
        {
            Caption = 'Kod Waluty';
            TableRelation = Currency;
        }
        field(7; "Country Code"; Code[10])
        {
            Caption = 'Kod Kraju';
            TableRelation = "Country/Region";
        }
        field(8; "Producent Count"; Integer)
        {
            CalcFormula = count(Item where ("AMC Producent"=field(Producent)));
            Caption = 'Liczba Zapasów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(101; "Fill zero sign in Item Code"; Boolean)
        {
            Caption = 'Wypełniaj zerami kod Zapasu';
        }
        field(102; "Item Code Leght"; Integer)
        {
            BlankZero = true;
            Caption = 'Długość kodu zapasu';
        }
    }

    keys
    {
        key(Key1;"Entry Type",Producent,Fabryka)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

