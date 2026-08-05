tableextension 50055 "AMC Purch. Rcpt. HeaderExt" extends "Purch. Rcpt. Header"
{
    fields
    {
        field(50004; "AMC Currancy Exchange Date"; Date)
        {
            Caption = 'Data Kursu Wymiany';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Średni';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Vendor Invoice Date"; Date)
        {
            Caption = 'Vendor Invoice Date';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Vendor Service Date"; Date)
        {
            Caption = 'Vendor Service Date';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Create by IdUser"; Code[50])
        {
            Caption = 'Utworzone przez';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50021; "AMC Creation Date"; Date)
        {
            Caption = 'Data Utworzenia';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50022; "AMC Purchase Notes"; Text[50])
        {
            Caption = 'Purchase Notes';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Place of Transport"; Text[30])
        {
            Caption = 'Miejsce Załadunku/Rozładunku';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Item Reserved"; Decimal)
        {
            CalcFormula = sum("Reservation Entry"."Quantity (Base)" where("Location Code" = field("Location Code"),
                                                                           "Item No." = field("No."),
                                                                           "Source Type" = const(37),
                                                                           "Quantity (Base)" = filter(< 0)));
            Caption = 'Ilość Zapasu Zarezerwowana';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "AMC Last Receipt No"; Code[20])
        {
            Caption = 'Nr Przyjęcia Zakupu';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50040; "AMC PW Transaction"; Boolean)
        {
            Caption = 'Rozliczenie PW';
            DataClassification = CustomerContent;
        }
        field(50050; "AMC Approved Date"; Date)
        {
            Caption = 'Data Potwierdzenia';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Tworca faktury"; Text[30])
        {
            Caption = 'Invoice creator';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Vendor Serach Name"; Code[100])
        {
            CalcFormula = lookup(Vendor."Search Name" where("Search Name" = field("Buy-from Vendor No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50109; "AMC Drop Shipment"; Boolean)
        {
            Caption = 'Dostawa Bezpośrednia';
            DataClassification = CustomerContent;
        }
    }

}