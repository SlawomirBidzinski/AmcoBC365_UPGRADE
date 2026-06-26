tableextension 50048 "AMC Posted Whse Shipm. Head." extends "Posted Whse. Shipment Header"
{
    fields
    {
        field(50001; "AMC Customer Code"; Code[20])
        {
            Caption = 'Kod nabywcy';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Customer Name"; Text[50])
        {
            Caption = 'Nazwa Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Customer Address"; Text[50])
        {
            Caption = 'Adres Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Customer post code"; Code[20])
        {
            Caption = 'Kod Pocztowy Nabywcy';
            TableRelation = "Post Code";
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Customer City"; Text[30])
        {
            Caption = 'Miasto Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC AMC Ship-to Code"; Code[20])
        {
            Caption = 'Kod Adresu Dostawy';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Ship-to Adress"; Text[50])
        {
            Caption = 'Adres Dostawy';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Ship-to City"; Text[50])
        {
            Caption = 'Miejscowość Dostawy';
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Ship-to Post Code"; Code[20])
        {
            Caption = 'Kod Pocztowy Dostawy';
            TableRelation = "Post Code";
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Ship-to Name"; Text[50])
        {
            Caption = 'Nazwa Odbiorcy Dostawy';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Ship-to Contact"; Text[50])
        {
            Caption = 'Ship-to Contact';
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Ship-to Phone"; Text[30])
        {
            Caption = 'Ship-to Phone';
            DataClassification = CustomerContent;
        }
        field(50013; "AMC Remarks"; Text[170])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Pallet Quantity"; Integer)
        {
            Caption = 'Ilość palet';
            DataClassification = CustomerContent;
        }
        field(50015; "AMC Pallet Item Code"; Code[20])
        {
            Caption = 'Kod Zapasu palety';
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(50016; "AMC Your Ref. No."; Text[30])
        {
            Caption = 'Nr zewn. klienta';
            Editable = false;
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
        field(50022; "AMC RW Transaction"; Boolean)
        {
            Caption = 'Rozliczenie RW';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Shipment Type"; Enum "AMC Shipment Type")
        {
            Caption = 'Typ Wydania';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Search Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD("AMC Customer Code")));
            Editable = false;
            Caption = 'Search Name';
        }
        field(50101; "AMC Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = CustomerContent;
        }
    }
}