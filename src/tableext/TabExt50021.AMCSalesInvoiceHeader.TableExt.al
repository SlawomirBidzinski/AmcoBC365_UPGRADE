tableextension 50021 "AMC Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {
        field(50001; "AMC EDI Customer"; Boolean)
        {
            Caption = 'EDI Customer';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Sent by EDI"; Boolean)
        {
            Caption = 'Sent by EDI';
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
            DecimalPlaces = 4 : 4;
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
        field(50020; "AMC Create by IdUser"; Code[50])
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
        field(50026; "AMC Prepayment"; Boolean)
        {
            Caption = 'Faktura Zaliczkowa';
            DataClassification = CustomerContent;
        }
        field(50030; "AMC Discount Line Invoice"; Boolean)
        {
            Caption = 'Rabat Linia Faktury';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Delivery Date"; Date)
        {
            Caption = 'Data Realizacji';
            DataClassification = CustomerContent;
        }
        field(50032; "AMC VAT Invoice Status Regist."; Boolean)
        {
            Caption = 'Status Faktury Rozliczenia VAT';
            DataClassification = CustomerContent;
        }
        field(50042; "AMC Delivery Conditions [hrs]"; Decimal)
        {
            Caption = 'Warunki dostawy [godz.]';
            DataClassification = CustomerContent;
            DecimalPlaces = 1 : 1;
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
        field(50061; "AMC EDI Order Status"; Enum "AMC EDI Order Status")
        {
            Caption = 'Status zamówienia EDI';
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
            DataClassification = CustomerContent;
        }
        field(50107; "AMC Invoice Postponed VAT"; Boolean)
        {
            CalcFormula = lookup("VAT Entry"."ITI Postponed VAT" where("Document No." = field("No.")));
            Caption = 'Przełożony VAT Faktury';
            Editable = false;
            FieldClass = FlowField;
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
            CalcFormula = count("Transaction Specification" where("AMC Documenty Type" = const("Sales Invoice"),
                                                                   "AMC Transaction Type" = const("E-mail"),
                                                                   "AMC Document No" = field("No.")));
            Caption = 'Ilość wysłanych maili';
            Editable = false;
            FieldClass = FlowField;
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
            DecimalPlaces = 4 : 4;
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
            DataClassification = CustomerContent;
        }
        field(50125; "AMC Authorise Date"; DateTime)
        {
            Caption = 'Data Autoryzacji';
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
        field(50150; "AMC Correction Invoice No."; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Cr.Memo Header"."No." WHERE("ITI Corr. Invoice No." = FIELD("No.")));
            Caption = 'Nr Faktury Korygującej';
            Editable = false;
        }
        field(50151; "AMC Customer Balance"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("Bill-to Customer No.")));
            Caption = 'Saldo Nabywcy';
            FieldClass = FlowField;
        }
        field(50160; "AMC Item Weight Total"; Decimal)
        {
            CalcFormula = sum("Sales Invoice Line".Quantity where("Document No." = field("No."),
                                                                   Type = const(Item),
                                                                   "Unit of Measure Code" = filter('KG')));
            Caption = 'Razem Waga Zapasów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50200; "AMC E-mail Address to Sent"; Text[250])
        {
            Caption = 'E-mail Adres do Wysłania';
            DataClassification = CustomerContent;
        }
        field(50301; "AMC User ID Send Sign"; Code[20])
        {
            Caption = 'Użytkownik Oznaczenie Wysyłki';
            DataClassification = CustomerContent;
        }
        field(50303; "AMC Invoice Sent"; Boolean)
        {
            Caption = 'Faktura Wysłana';
            DataClassification = CustomerContent;
        }
    }

}