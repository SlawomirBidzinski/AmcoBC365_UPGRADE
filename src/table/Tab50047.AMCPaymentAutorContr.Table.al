table 50047 "AMC Payment Autor. Contr."
{
    DataClassification = CustomerContent;   
    Caption = 'Misc. Article Information';

    fields
    {
        field(1; "Document Type"; Enum "Sales Document Type")
        {
            Caption = 'Employee No.';
        }
        field(2; "Document No."; Code[20])
        {
            Caption = 'Misc. Article Code';
            NotBlank = true;
        }
        field(21; "Bill to Customer Code"; Code[20])
        {
            Caption = 'Line No.';
            TableRelation = Customer;
        }
        field(22; "Bill to Customer Name"; Text[50])
        {
            Caption = 'Description';
        }
        field(23; "Payment Control Date"; DateTime)
        {
            Caption = 'From Date';
        }
        field(24; "Customer Payment Balance"; Decimal)
        {
            Caption = 'To Date';
        }
        field(25; "Customer Balance Overterm"; Decimal)
        {
            Caption = 'In Use';
        }
        field(26; "Qty of Days past Due"; Integer)
        {
            Caption = 'Comment';
        }
        field(100; "Invoice Authorisation Amount"; Decimal)
        {
            Caption = 'Kwota Transakcji';
        }
        field(101; "Balance Limit"; Decimal)
        {
            Caption = 'Serial No.';
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
