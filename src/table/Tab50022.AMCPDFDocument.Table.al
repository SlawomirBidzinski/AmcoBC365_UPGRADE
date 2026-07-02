table 50022 "AMC PDF Document"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC PDF Documents";
    LookupPageId = "AMC PDF Documents";
    Caption = 'PDF Document';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Document Type"; Enum "AMC PDF Document Type")
        {
            Caption = 'Document Type';
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            TableRelation = if ("Document Type" = const(Order)) "Sales Header"."No." where("Document Type" = const(Order))
            else if ("Document Type" = const("Posted Invoice")) "Sales Invoice Header"."No.";
        }
        field(4; "PDF Document Type"; Enum "AMC PDF Doc. Type")
        {
            Caption = 'PDF Document Type';
        }
        field(5; "PDF Document No."; Code[20])
        {
            Caption = 'PDF Document No.';
            TableRelation = if ("PDF Document Type" = const("Proforma Invoice")) "Sales Header"."No." where("Document Type" = const(Order))
            else if ("PDF Document Type" = const("Sales Invoice")) "Sales Invoice Header"."No."
            else if ("PDF Document Type" = const("Correction Invoice")) "Sales Cr.Memo Header"."No."
            else if ("PDF Document Type" = const("Warehause Shipment")) "Posted Whse. Shipment Header"."No."
            else if ("PDF Document Type" = const(Atest)) "Posted Whse. Shipment Header"."No.";
        }
        field(6; "PDF File Link"; Text[200])
        {
            Caption = 'PDF File Link';
        }
        field(7; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
        }
        field(8; "Customer Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Caption = 'Customer Name';
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "User Name"; Code[50])
        {
            Caption = 'User Name';
            TableRelation = User;
        }
        field(10; "Generation Date"; DateTime)
        {
            Caption = 'Generation Date';
        }
        field(11; "Sign to Send"; Boolean)
        {
            Caption = 'Sign to Send';
        }
        field(12; "E-mail Address Sent"; Text[250])
        {
            Caption = 'E-mail Address Sent';
        }
        field(13; "Date of Last Send"; DateTime)
        {
            Caption = 'Date of Last Send';
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
        key(Key1; "Document Type", "Document No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

