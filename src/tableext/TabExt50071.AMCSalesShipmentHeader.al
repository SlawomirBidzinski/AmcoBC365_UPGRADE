tableextension 50071 "AMC Sales Shipment Header" extends "Sales Shipment Header"
{
    fields
    {
        field(50001; "AMC EDI Customer"; Boolean)
        {
            Caption = 'EDI Customer';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Notes"; Text[100])
        {
            Caption = 'Uwagi z Oferty';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Średni';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Currancy Exchange Date"; Date)
        {
            Caption = 'Data Kursu Wymiany';
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
        field(50024; "AMC AmcoWeb Order"; Boolean)
        {
            Caption = 'AmcoWeb';
            DataClassification = CustomerContent;
        }
        field(50025; "AMC RW Transaction Type"; Enum "AMC RW Transaction Type")
        {
            Caption = 'Typ Rozliczenia RW';
            DataClassification = CustomerContent;
        }
        field(50044; "AMC Customs Invoice"; Boolean)
        {
            Caption = 'Faktura Celna';
            DataClassification = CustomerContent;
        }
        field(50045; "AMC Reverse Charge Inv"; Boolean)
        {
            Caption = 'Faktura Odrwotne Obciążenie';
            DataClassification = CustomerContent;
        }
        field(50053; "AMC RW Fully Invoiced"; Boolean)
        {
            Caption = 'RW Całkowicie Rozliczone';
            DataClassification = CustomerContent;
        }
        field(50054; "AMC Order Cancelled"; Boolean)
        {
            Caption = 'Zamówienie Anulowanie';
            DataClassification = CustomerContent;
        }
        field(50055; "AMC RW for CRP"; Boolean)
        {
            Caption = 'RW na CRP';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Customer Serach Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD("Sell-to Customer No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
        }
        field(50104; "AMC Check For Low Price"; Boolean)
        {
            Caption = 'Kontrola Ceny Sprzedaży';
            DataClassification = CustomerContent;
        }
        field(50105; "AMC ID Authorise for Low Price"; Code[20])
        {
            Caption = 'Autoryzacja Niskiej Ceny Sprzedży';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50108; "AMC Frutarom Customer"; Boolean)
        {
            Caption = 'Nabywca Frutarom';
            DataClassification = CustomerContent;
        }
        field(50109; "AMC Drop Shipment"; Boolean)
        {
            Caption = 'Dostawa Bezpośrednia';
            DataClassification = CustomerContent;
        }
        field(50120; "AMC Price Currency"; Code[10])
        {
            Caption = 'Waluta Cennika';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(50121; "AMC Price Exch. Rate"; Decimal)
        {
            Caption = 'Kurs Waluty Cennika';
            DataClassification = CustomerContent;
        }
        field(50122; "AMC Price Exch. Date"; Date)
        {
            Caption = 'Data Kursu Waluty Cennika';
            DataClassification = CustomerContent;
        }
        field(50123; "AMC Authorise for Limit"; Boolean)
        {
            Caption = 'Autoryzacja Limitu';
            DataClassification = CustomerContent;
        }
        field(50124; "AMC Authorise UserID"; Code[20])
        {
            Caption = 'Użytkownik Autoryzyjący';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50125; "AMC Authorise Date"; DateTime)
        {
            Caption = 'Data Autoryzacji';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50126; "AMC Authorise Amount"; Decimal)
        {
            BlankZero = true;
            Caption = 'Kwota Autoryzacji Limitu';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50130; "AMC Place of Transport"; Text[20])
        {
            Caption = 'Miejsce Załadunku/Rozładunku';
            DataClassification = CustomerContent;
        }
    }
}