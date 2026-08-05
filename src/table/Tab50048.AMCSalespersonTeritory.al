table 50048 "AMC Salesperson Territory"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Salesperson Code"; Code[20])
        {
            Caption = 'Kod Sprzedawcy';
            TableRelation = "Salesperson/Purchaser";
        }
        field(2; "Territory Code"; Code[20])
        {
            Caption = 'Kod Regionu';
            TableRelation = Territory;
        }
        field(3; "Salesperson Name"; Text[100])
        {
            CalcFormula = lookup("Salesperson/Purchaser".Name where (Code = field("Salesperson Code")));
            Caption = 'Nazwa Sprzedawcy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Territory Name"; Text[100])
        {
            CalcFormula = lookup(Territory.Name where (Code=field("Territory Code")));
            Caption = 'Nazwa Regionu';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Salesperson Code","Territory Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    
    trigger OnInsert()
    begin
        IF "Salesperson Code" = '' THEN
            ERROR(Text_001);
    end;

    var
        Text_001: Label 'Przypisz najpierw kod sprzedawcy';
}

