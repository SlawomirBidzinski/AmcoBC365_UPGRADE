table 50055 "AMC PDF Document"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Nr Zapisu';
        }
        field(2; "Document Type"; Option)
        {
            Caption = 'Typ Dokumentu';
            OptionCaption = 'Order,Posted Invoice,Credit Memo,Quote';
            OptionMembers = "Order","Posted Invoice","Credit Memo",Quote;
        }
        field(3; "Document No"; Code[20])
        {
            Caption = 'Nr Dokumentu';
            TableRelation = if ("Document Type"=const(Order)) "Sales Header"."No." where ("Document Type"=const(Order))
                            else if ("Document Type"=const("Posted Invoice")) "Sales Invoice Header"."No.";
        }
        field(4; "PDF Document Type"; Option)
        {
            Caption = 'Typ Dokumentu PDF';
            OptionCaption = 'Proforma Invoice,Sales Invoice,Correction Invoice,Warehause Shipment,Atest,Query';
            OptionMembers = "Faktura Proforma","Sales Invoice","Correction Invoice","Warehause Shipment",Atest,"Query";
        }
        field(5; "PDF Document No"; Code[20])
        {
            Caption = 'Nr Dokumentu PDF';
            TableRelation = if ("PDF Document Type"=const("Faktura Proforma")) "Sales Header"."No." where ("Document Type"=const(Order))
                            else if ("PDF Document Type"=const("Sales Invoice")) "Sales Invoice Header"."No."
                            else if ("PDF Document Type"=const("Correction Invoice")) "Sales Cr.Memo Header"."No."
                            else if ("PDF Document Type"=const("Warehause Shipment")) "Posted Whse. Shipment Header"."No."
                            else if ("PDF Document Type"=const(Atest)) "Posted Whse. Shipment Header"."No.";
        }
        field(6; "PDF File Link"; Text[200])
        {
            Caption = 'Plik dokumentu PDF';
        }
        field(7; "Customer Code"; Code[20])
        {
            Caption = 'Nr Nabywcy';
            TableRelation = Customer;
        }
        field(8; "Customer Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No."=field("Customer Code")));
            Caption = 'Nazwa Nabywcy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "User ID"; Code[20])
        {
            Caption = 'ID Użytkownika';
        }
        field(10; "Generation Date"; DateTime)
        {
            Caption = 'Data Generowania PDF';
        }
        field(11; "Sign to Send"; Boolean)
        {
            Caption = 'Oznacz do wysłania';
        }
        field(12; "E-mail Address Sent"; Text[250])
        {
            Caption = 'E-mail Adres Wysłania';
        }
        field(13; "Date of Last Send"; DateTime)
        {
            Caption = 'Data ostatniej wysyłki';
        }
        field(14; "Document Duplicate"; Boolean)
        {
            Caption = 'Document Duplicate';
        }
        field(15; "Duplicate Date"; Date)
        {
            Caption = 'Duplicate Date';
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

