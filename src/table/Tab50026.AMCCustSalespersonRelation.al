table 50026 "AMC Cust. Salesperson Relation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer Code"; Code[20])
        {
            Caption = 'Kod Nabywcy';
            TableRelation = Customer;
        }
        field(2; "Salesperson Code"; Code[10])
        {
            Caption = 'Kod Sprzedawcy';
            TableRelation = "Salesperson/Purchaser";
        }
        field(3; "Salesperson Name"; Text[50])
        {
            CalcFormula = Lookup("Salesperson/Purchaser".Name WHERE (Code=FIELD("Salesperson Code")));
            Caption = 'Nazwa Sprzedawcy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Default Salesperson"; Boolean)
        {
            Caption = 'Default Salesperson';

            trigger OnValidate()
            var
                DefaultQty: Integer;
            begin
                IF "Default Salesperson" THEN BEGIN
                    DefaultQty := 0;
                    CustomerSalespersonRelation.RESET();
                    CustomerSalespersonRelation.SETRANGE("Customer Code", "Customer Code");
                    CustomerSalespersonRelation.SETRANGE("Default Salesperson", TRUE);
                    DefaultQty := CustomerSalespersonRelation.Count;
                    IF DefaultQty > 0 THEN
                        ERROR(Text_001, "Customer Code");
                END;
            end;
        }
        field(5; Notes; Text[100])
        {
            Caption = 'Uwagi';
        }
    }

    keys
    {
        key(Key1;"Customer Code","Salesperson Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        CustomerSalespersonRelation: Record "AMC Cust. Salesperson Relation";
        Text_001: Label 'Nie można przypisać więcej domyślnych sprzedawców do Nabywcy %1', Comment = '%1 = Customer No';
}

