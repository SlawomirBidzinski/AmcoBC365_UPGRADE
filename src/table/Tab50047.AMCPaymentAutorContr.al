table 50047 "AMC Payment Autor. Contr."
{
    DataClassification = CustomerContent;
    Caption = 'Misc. Article Information';

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Sales Document Type';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Document No';
            NotBlank = true;
        }
        field(21; "Bill to Customer Code"; Code[20])
        {
            Caption = 'Line No.';
            TableRelation = Customer;
        }
        field(22; "Bill to Customer Name"; Text[50])
        {
            Caption = 'Bill to Customer Name';
        }
        field(23; "Payment Control Date"; DateTime)
        {
            Caption = 'Payment Control Date';
        }
        field(24; "Customer Payment Balance"; Decimal)
        {
            Caption = 'Customer Payment Balance';
        }
        field(25; "Customer Balance Overterm"; Decimal)
        {
            Caption = 'Customer Balance Overterm';
        }
        field(26; "Qty of Days past Due"; Integer)
        {
            Caption = 'Qty of Days past Due';
        }
        field(100; "Invoice Authorisation Amount"; Decimal)
        {
            Caption = 'Invoice Authorisation Amount';
        }
        field(101; "Balance Limit"; Decimal)
        {
            Caption = 'Balance Limit';
        }
        field(102; "Days Limit"; DateFormula)
        {
            Caption = 'Limit Dni Przetrm.';
        }
        field(103; "Authorisation for Posting"; Boolean)
        {
            Caption = 'Autoryzacja Wystawienia';
        }
        field(104; "Author. Date"; DateTime)
        {
            Caption = 'Data Autoryzacji';
        }
        field(105; "Author UserId"; Code[20])
        {
            Caption = 'Użytkownik Autoryzujący';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }
}
