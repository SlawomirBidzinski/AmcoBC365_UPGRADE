table 50027 "AMC Default Bank Account"
{
    Caption = 'Default Bank Account';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Customer Code"; Code[20])
        {
            Caption = 'Kod Nabywcy';
            TableRelation = Customer;
        }
        field(2; "Currency Code"; Code[10])
        {
            Caption = 'Kod Waluty';
            TableRelation = Currency;
        }
        field(3; "Bank Account Code"; Code[20])
        {
            Caption = 'Kod Konta Bankowego';
            TableRelation = "Bank Account";

            trigger OnValidate()
            begin
                IF BankAccunt.GET("Bank Account Code") THEN BEGIN
                    "Bank Account Name" := BankAccunt.Name;
                    IF "Currency Code" <> BankAccunt."Currency Code" THEN
                        ERROR(Text_001);
                END ELSE
                    "Bank Account Name" := '';
            end;
        }
        field(4; "Bank Account Name"; Text[50])
        {
            Caption = 'Nazwa Konta Bankowego';
        }
        field(5; "Bank Account Currency Code"; Code[20])
        {
            CalcFormula = lookup ("Bank Account"."Currency Code" where ("No."=field("Bank Account Code")));
            Caption = 'Kod Waluty Konta Bankowego';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Customer Code", "Currency Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    var
        BankAccunt: Record "Bank Account";
        Text_001: Label 'Kod waluty rachunku nie może być różny od kodu rachunku bankowego';
}

