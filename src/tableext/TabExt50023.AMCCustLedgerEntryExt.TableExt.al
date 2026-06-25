tableextension 50023 "AMC Cust. Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        field(50002; "AMC Bank Transaction No"; Code[20])
        {
            Caption = 'Nr Transakcji Przelewu';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Customer Search Name"; Code[100])
        {
            CalcFormula = lookup(Customer."Search Name" where("No." = field("Customer No.")));
            Caption = 'Customer Search Name';
            FieldClass = FlowField;
        }
        field(50004; "AMC Confirmed paymernt term"; Date)
        {
            Caption = 'Uzgodniona data płatności';
            DataClassification = CustomerContent;
        }
        field(50005; "AMCPayment notes"; Text[150])
        {
            Caption = 'Uwagi dot. płatności';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Receivables Account"; Code[20])
        {
            CalcFormula = lookup("Customer Posting Group"."Receivables Account" where(Code = field("Customer Posting Group")));
            Caption = 'Konto należności';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50007; "AMC Customer Group Code"; Code[20])
        {
            CalcFormula = lookup(Customer."AMC Customer Group Code" where("No." = field("Customer No.")));
            Caption = 'Kod grupy nabywców';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Customer;
        }
        field(50008; "AMC Number of Reminders"; Integer)
        {
            CalcFormula = count("Issued Reminder Line" where("Document No." = field("Document No.")));
            Caption = 'Ilość Monitów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50009; "AMC Factoring Invoice"; Boolean)
        {
            Caption = 'Faktura Factoring';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Factoring Invoice Amount"; Decimal)
        {
            Caption = 'Kwota Faktury Factoring';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Saldo"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Cust. Ledger Entry No." = field("Entry No."),
                                                                                 "Posting Date" = field("Date Filter")));
            Caption = 'Saldo';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "AMC Invoice Payment Date"; Date)
        {
            Caption = 'Data Rozliczenia Faktury';
            DataClassification = CustomerContent;
        }
        field(50022; "AMC Days for payment"; Integer)
        {
            Caption = 'Ilość dni rozliczenia';
            DataClassification = CustomerContent;
        }
        field(50025; "AMC Customer Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Caption = 'Nazwa Nabywcy';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}