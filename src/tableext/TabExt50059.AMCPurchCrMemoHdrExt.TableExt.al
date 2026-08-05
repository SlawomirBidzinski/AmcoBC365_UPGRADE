tableextension 50059 "AMC Purch. Cr. Memo Hdr.Ext" extends "Purch. Cr. Memo Hdr."
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
        field(50020; "AMC Create by IdUser"; Code[20])
        {
            Caption = 'Utworzone przez';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Creation Date"; Date)
        {
            Caption = 'Data Utworzenia';
            Editable = false;
            DataClassification = CustomerContent;
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
        field(50100; "AMC Tworca faktury"; Text[30])
        {
            Caption = 'Invoice creator';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Vendor Serach Name"; Code[100])
        {
            CalcFormula = lookup(Vendor."Search Name" where("Search Name"=field("Buy-from Vendor No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    
}