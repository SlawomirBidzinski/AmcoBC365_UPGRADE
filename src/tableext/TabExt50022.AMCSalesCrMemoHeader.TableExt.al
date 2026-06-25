tableextension 50022 "AMC Sales Cr.Memo Header" extends "Sales Cr.Memo Header"
{
    fields
    {
        field(50001; "AMC EDI Customer"; Boolean)
        {
            Caption = 'Nabywca EDI';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Notes"; Text[100])
        {
            Caption = 'Uwagi';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Średni';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Invoice per Pieces"; Boolean)
        {
            Caption = 'Faktury w Szt';
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
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50021; "AMC Creation Date"; Date)
        {
            Caption = 'Data Utworzenia';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50022; "AMC RW Transaction"; Boolean)
        {
            Caption = 'Rozliczenie RW';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Invoice Type"; Enum "AMC Invoice Type")
        {
            Caption = 'Typ Faktury';
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
        field(50050; "AMC Query Status"; Enum "AMC Query Status")
        {
            Caption = 'Status Oferty';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Print Quote Discount"; Boolean)
        {
            Caption = 'Drukuj Rabat Oferty';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC Automatic Create"; Boolean)
        {
            Caption = 'Utworzone Automatycznie';
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
        field(50101; "AMC Customer Search Name"; Code[100])
        {
            CalcFormula = lookup(Customer."Search Name" where("No." = field("Sell-to Customer No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
            FieldClass = FlowField;
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
        field(50110; "AMC Invoice PDF File"; Text[100])
        {
            Caption = 'Plik Faktury PDF';
            DataClassification = CustomerContent;
        }
        field(50111; "AMC Electr. Form Invoice Agr"; Boolean)
        {
            Caption = 'Zgoda na Faktury Elektroniczne';
            DataClassification = CustomerContent;
        }
        field(50112; "AMC Last E-mail sent"; Date)
        {
            Caption = 'Ostatnia data wysłania e-mail';
            DataClassification = CustomerContent;
        }
        field(50113; "AMC E-mail Sent Qty"; Integer)
        {
            Caption = 'Ilość wysłanych maili';
            Editable = false;
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
        field(50202; "AMC Discount Correction Inv."; Boolean)
        {
            Caption = 'Zbiorcza Faktura Prowizji';
            DataClassification = CustomerContent;
        }
        field(50203; "AMC Discount Period From"; Date)
        {
            Caption = 'Discount Period From';
            DataClassification = CustomerContent;
        }
        field(50204; "AMC Discount Period To"; Date)
        {
            Caption = 'Discount Period To';
            DataClassification = CustomerContent;
        }
    }
}