tableextension 50020 "AMC Customer" extends Customer
{
    fields
    {
        field(50001; "AMC MOS Customer Code"; Code[10])
        {
            Caption = 'Kod Nabywcy MOS';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC ILN"; Code[30])
        {
            Caption = 'ILN';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC EDI Customer"; Boolean)
        {
            Caption = 'EDI Customer';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC ILN Buyer"; Code[30])
        {
            Caption = 'ILN Buyer';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Invoice per Pieces"; Boolean)
        {
            Caption = 'Invoice per Pieces';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC EDI Transaction Type"; Enum "AMC EDI Transaction Type")
        {
            Caption = 'Typ Transakcji EDI';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC EDI Code By Buyer"; Code[20])
        {
            Caption = 'EDI Kod Sprzed. wg Kupującego';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Customer Industry Key"; Code[10])
        {
            Caption = 'Customer Industry Key';
            TableRelation = "AMC Customer Industrial Key";
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Period Discount [%]"; Decimal)
        {
            Caption = 'Wielkość Rabatu Okresowego';
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Discount Agreement"; Date)
        {
            Caption = 'Umowa rabatu okresowego z dnia';
            DataClassification = CustomerContent;
        }
        field(50022; "AMC Period Discount Type"; Option)
        {
            Caption = 'Typ rabatu okresowego';
            OptionCaption = ' ,Month,Quarter,Half year,Year';
            OptionMembers = " ",Month,Quarter,"Half year",Year;
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Qty of Discount Corr. Inv"; Integer)
        {
            CalcFormula = count("Sales Cr.Memo Header" where("AMC Discount Correction Inv." = const(true),
                                                             "Bill-to Customer No." = field("No.")));
            Caption = 'Ilość Faktur Koryguj. Zbiorcz.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50024; "AMC Corr.Invoice No"; Code[20])
        {
            CalcFormula = lookup("Sales Cr.Memo Header"."No." where("AMC Discount Correction Inv." = const(true),
                                                                  "Bill-to Customer No." = field("No.")));
            Caption = 'Nr Faktury Korygującej';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "AMC Discount Line Invoice"; Boolean)
        {
            Caption = 'Rabat Linia Faktury';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Set Payment Customer"; Boolean)
        {
            Caption = 'Płatność przez Innego Płatnika';
            DataClassification = CustomerContent;
        }
        field(50032; "AMC Payment Customer Code"; Code[20])
        {
            Caption = 'Payment Customer Code';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(50033; "AMC Payment Customer Name"; Text[100])
        {
            CalcFormula = lookup(Customer.Name where("No." = field("AMC Payment Customer Code")));
            Caption = 'Nazwa Płatnika Faktury';
            FieldClass = FlowField;
        }
        field(50050; "AMC Bill-To No. of Invoices RW"; Integer)
        {
            CalcFormula = count("Sales Invoice Header" where("Bill-to Customer No." = field("No."),
                                                             "AMC RW Transaction" = const(true)));
            Caption = 'Bill-To No. of Invoices';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50051; "AMC No. of Invoices RW"; Integer)
        {
            CalcFormula = count("Sales Invoice Header" where("Sell-to Customer No." = field("No."),
                                                             "AMC RW Transaction" = const(true)));
            Caption = 'Liczba zaks. faktur faktury RW';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50055; "AMC Customer Segment Key"; Code[20])
        {
            Caption = 'Customer Segment Key';
            TableRelation = "AMC Segment Key";
            DataClassification = CustomerContent;
        }
        field(50060; "AMC Set to Export"; Boolean)
        {
            Caption = 'Set to Export';
            DataClassification = CustomerContent;
        }
        field(50061; "AMC Export Date"; Date)
        {
            Caption = 'Data Exportu';
            DataClassification = CustomerContent;
        }
        field(50062; "AMC Export Time"; Time)
        {
            Caption = 'Godz. Exportu';
            DataClassification = CustomerContent;
        }
        field(50063; "AMC Frutarom Customer"; Boolean)
        {
            Caption = 'Nabywca Frutarom';
            DataClassification = CustomerContent;
        }
        field(50064; "AMC Full Exp Date"; Boolean)
        {
            Caption = 'Atest - Full Exp Date';
            DataClassification = CustomerContent;
        }
        field(50065; "AMC Customer Type"; Enum "AMC Customer Type")
        {
            Caption = 'Customer Type';
            DataClassification = CustomerContent;
        }
        field(50070; "AMC RODO Customer"; Boolean)
        {
            Caption = 'Nabywca RODO';
            DataClassification = CustomerContent;
        }
        field(50071; "AMC RODO Infor. Date"; Date)
        {
            Caption = 'Data Oznacz. RODO';
            DataClassification = CustomerContent;
        }
        field(50072; "AMC RODO Infor. Time"; Time)
        {
            Caption = 'Godz. Oznacz. RODO';
            DataClassification = CustomerContent;
        }
        field(50073; "AMC RODO Infor. Send Time"; DateTime)
        {
            Caption = 'Wysłanie inform. RODO';
            DataClassification = CustomerContent;
        }
        field(50074; "AMC RODO Email Send"; Text[100])
        {
            Caption = 'Email powiadomienia RODO';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Customer Group Code"; Code[20])
        {
            Caption = 'Kod grupy nabywców';
            TableRelation = "AMC Customer Group";
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Customer Group name"; Text[50])
        {
            CalcFormula = Lookup("AMC Customer Group".Description WHERE(Code = FIELD("AMC Customer Group Code")));
            Caption = 'Nazwa grupy nabywców';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50110; "AMC Customer RF"; Boolean)
        {
            Caption = 'Rozliczanie RF';
            DataClassification = CustomerContent;
        }
        field(50111; "AMC Customer RF Limit"; Decimal)
        {
            Caption = 'Limit RF nabywcy';
            DataClassification = CustomerContent;
        }
        field(50112; "AMC Customer RF Limit Used"; Decimal)
        {
            CalcFormula = sum("Cust. Ledger Entry"."AMC Factoring Invoice Amount" where("Customer No." = field("No."),
                                                                                     Open = const(true)));
            Caption = 'Wykorzystany limit RF';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50113; "AMC Set Off Customer Limit"; Boolean)
        {
            Caption = 'Wyłącz kontrolę limitu';
            DataClassification = CustomerContent;
        }
        field(50114; "AMC Last Limit Change UserId"; Code[20])
        {
            Caption = 'Zmiana limitu - Użytkownik';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50115; "AMC Last Limit Change Date"; DateTime)
        {
            Caption = 'Zmiana limitu - Data';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50120; "AMC Minimum Limit"; Decimal)
        {
            Caption = 'Minimum Limit';
            DataClassification = CustomerContent;
        }
        field(50121; "AMC Maksimum Limit"; Decimal)
        {
            Caption = 'Maksimum Limit';
            DataClassification = CustomerContent;
        }
        field(50122; "AMC Calculate Limit Date"; Date)
        {
            Caption = 'Data Kalkulacji Limitu';
            DataClassification = CustomerContent;
        }
        field(50123; "AMC Minimum Limit Date"; Date)
        {
            Caption = 'Data Minimalnego Limitu';
            DataClassification = CustomerContent;
        }
        field(50124; "AMC Maximum Limit Date"; Date)
        {
            Caption = 'Data Maksymalnego Limitu';
            DataClassification = CustomerContent;
        }
        field(50125; "AMC Set Limit Date From"; Date)
        {
            Caption = 'Kalkulacja Limitu od Daty';
            DataClassification = CustomerContent;
        }
        field(50126; "AMC Avarage Payment Days"; Decimal)
        {
            Caption = 'Średnia ilość dni płatności';
            DataClassification = CustomerContent;
        }
        field(50200; "AMC Debt Collection Notes"; Text[200])
        {
            Caption = 'Uwagi dot.windyk.';
            DataClassification = CustomerContent;
        }
        field(50201; "AMC Vendor per NIP Qty"; Integer)
        {
            CalcFormula = count(Vendor where("VAT Registration No." = field("VAT Registration No.")));
            Caption = 'Ilość Dostawców wg NIP';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50202; "AMC Sales All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Cust. Ledger Entry"."Sales (LCY)" where("Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                       "Posting Date" = field("Date Filter"),
                                                                       "Currency Code" = field("Currency Filter")));
            Caption = 'Sales (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50203; "AMC Invoice All (LCY)"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(Invoice),
                                                                                "Entry Type" = const("Initial Entry"),
                                                                                "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                "Posting Date" = field("Date Filter"),
                                                                                "Currency Code" = field("Currency Filter")));
            Caption = 'Kwota Faktur za Okres (PLN)';
            FieldClass = FlowField;
        }
        field(50204; "AMC Payments All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Initial Document Type" = const(Payment),
                                                                                 "Entry Type" = const("Initial Entry"),
                                                                                 "Initial Entry Global Dim. 1" = field("Global Dimension 1 Filter"),
                                                                                 "Initial Entry Global Dim. 2" = field("Global Dimension 2 Filter"),
                                                                                 "Posting Date" = field("Date Filter"),
                                                                                 "Currency Code" = field("Currency Filter")));
            Caption = 'Payments (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50205; "AMC Sales Item"; Decimal)
        {
            CalcFormula = sum("Value Entry"."Sales Amount (Actual)" where("Posting Date" = field("Date Filter"),
                                                                          "Source Type" = const(Customer),
                                                                          "Source No." = field("No."),
                                                                           "Item Ledger Entry Type" = const(Sale)));
            Caption = 'Sprzedaż Zapasów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50206; "AMC Sales Item All"; Decimal)
        {
            CalcFormula = sum("Value Entry"."Sales Amount (Actual)" where("Posting Date" = field("Date Filter"),
                                                                          "Source Type" = const(Customer),
                                                                           "Item Ledger Entry Type" = const(Sale)));
            Caption = 'Sprzedaż Zapasów za Okres';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50207; "AMC Item COGS"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Cost Amount (Actual)" where("Posting Date" = field("Date Filter"),
                                                                          "Source Type" = const(Customer),
                                                                          "Source No." = field("No."),
                                                                           "Item Ledger Entry Type" = const(Sale)));
            Caption = 'KWS Zapasów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50208; "AMC Item COGS All"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Cost Amount (Actual)" where("Posting Date" = field("Date Filter"),
                                                                          "Source Type" = const(Customer),
                                                                           "Item Ledger Entry Type" = const(Sale)));
            Caption = 'KWS Zapasów za Okres';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50209; "AMC Sales Resource"; Decimal)
        {
            CalcFormula = - sum("Res. Ledger Entry"."Total Price" where("Posting Date" = field("Date Filter"),
                                                                       "Source Type" = const(Customer),
                                                                       "Source No." = field("No."),
                                                                       "Entry Type" = const(Sale)));
            Caption = 'Sprzedaż Usług';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50210; "AMC Sales Resource All"; Decimal)
        {
            CalcFormula = - sum("Res. Ledger Entry"."Total Price" where("Posting Date" = field("Date Filter"),
                                                                       "Source Type" = const(Customer),
                                                                       "Entry Type" = const(Sale)));
            Caption = 'Sprzedaż Usług za Okres';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50211; "AMC Prepayment Balance"; Decimal)
        {
            CalcFormula = - sum("G/L Entry".Amount where("G/L Account No." = const('844-002'),
                                                        "Source Type" = const(Customer),
                                                        "Source No." = field("No.")));
            Caption = 'Saldo Przedpłaty';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50212; "AMC Bank No."; Code[20])
        {
            Caption = 'Bank No.';
            TableRelation = "Bank Account";
            DataClassification = CustomerContent;
        }
        field(50213; "AMC Bank Name"; Text[100])
        {
            CalcFormula = lookup("Bank Account".Name where("No." = field("AMC Bank No.")));
            Caption = 'Nazwa banku';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50214; "AMC Invoice e-mail Address"; Text[100])
        {
            Caption = 'Adres e-mail dla Faktur';
            DataClassification = CustomerContent;
        }
        field(50215; "AMC Electronic Form Inv. Agr."; Boolean)
        {
            Caption = 'Zgoda na Faktury Elektroniczne';
            DataClassification = CustomerContent;
        }
        field(50216; "AMC Qty E-mail Sent"; Integer)
        {
            Caption = 'Ilość wysłanych e-mail';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50221; "AMC Show Open FlowFilter"; Boolean)
        {
            Caption = 'Pokazuj Otwarte FlowFilter';
            FieldClass = FlowFilter;
        }
        field(50230; "AMC Emergency Name 1"; Text[100])
        {
            Caption = 'Imię Nazwisko 1 - Pilny Kontakt';
            DataClassification = CustomerContent;
        }
        field(50231; "AMC Emergency Phone 1"; Text[30])
        {
            Caption = 'Telefon 1 - Pilny Kontakt';
            DataClassification = CustomerContent;
        }
        field(50232; "AMC Emergency  Email 1"; Text[100])
        {
            Caption = 'Email 1 - Pilny Kontakt';
            DataClassification = CustomerContent;
        }
        field(50235; "AMC Emergency Name 2"; Text[100])
        {
            Caption = 'Imię Nazwisko 2 - Pilny Kontakt';
            DataClassification = CustomerContent;
        }
        field(50236; "AMC Emergency Phone 2"; Text[30])
        {
            Caption = 'Telefon 2 - Pilny Kontakt';
            DataClassification = CustomerContent;
        }
        field(50237; "AMC Emergency Email 2"; Text[100])
        {
            Caption = 'Email 2 - Pilny Kontakt';
            DataClassification = CustomerContent;
        }
        field(50240; "AMC Adres E-mail Windykacji"; Text[100])
        {
            Caption = 'Adres E-mail Windykacji';
            DataClassification = CustomerContent;
        }
        field(50241; "AMC Imię i Nazwisko Windykacja"; Text[100])
        {
            Caption = 'Imię i Nazwisko Windykacja';
            DataClassification = CustomerContent;
        }
        field(50242; "AMC Telefon Windykacja"; Text[30])
        {
            Caption = 'Telefon Windykacja';
            DataClassification = CustomerContent;
        }
        field(50250; "AMC Sales Act. Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM';
            FieldClass = FlowField;
        }
        field(50251; "AMC Sales Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-1M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-1M';
            FieldClass = FlowField;
        }
        field(50252; "AMC Date Filter CM"; Date)
        {
            Caption = 'Filtr Daty BM';
            FieldClass = FlowFilter;
        }
        field(50253; "AMC Date Filter CM-1M"; Date)
        {
            Caption = 'Filtr Daty BM-1M';
            FieldClass = FlowFilter;
        }
        field(50254; "AMC Date Filter CM-2M"; Date)
        {
            Caption = 'Filtr Daty BM-2M';
            FieldClass = FlowFilter;
        }
        field(50255; "AMC Sales 2Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-2M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-2M';
            FieldClass = FlowField;
        }
        field(50256; "AMC Date Filter CM-3M"; Date)
        {
            Caption = 'Filtr Daty BM-3M';
            FieldClass = FlowFilter;
        }
        field(50257; "AMC Date Filter CM-4M"; Date)
        {
            Caption = 'Filtr Daty BM-4M';
            FieldClass = FlowFilter;
        }
        field(50260; "AMC Sales 5M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter 5M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż 5M';
            FieldClass = FlowField;
        }
        field(50261; "AMC Date Filter 5M"; Date)
        {
            Caption = 'Filtr Daty 5M';
            FieldClass = FlowFilter;
        }
        field(50262; "AMC Item Filter"; Code[20])
        {
            Caption = 'Filtr Zapasu';
            FieldClass = FlowFilter;
            TableRelation = Item;
        }
        field(50263; "AMC Total Sales CM"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Posting Date" = field("AMC Date Filter CM"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Razem Sprzedaż BM';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50264; "AMC Total Sales CM-1M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Posting Date" = field("AMC Date Filter CM-1M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Razem Sprzedaż BM-1M';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50265; "AMC Total Sales CM-2M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Posting Date" = field("AMC Date Filter CM-2M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Razem Sprzedaż BM-2M';
            FieldClass = FlowField;
        }
        field(50266; "AMC Total Sales 3M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Posting Date" = field("AMC Date Filter 5M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Razem Sprzedaż 3M';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50267; "AMC Total Sales CM-3M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Posting Date" = field("AMC Date Filter CM-3M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Razem Sprzedaż BM-3M';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50268; "AMC Total Sales CM-4M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Posting Date" = field("AMC Date Filter CM-4M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Razem Sprzedaż BM-4M';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50269; "AMC Sales 3Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-3M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-3M';
            FieldClass = FlowField;
        }
        field(50270; "AMC Sales 4Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-4M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-4M';
            FieldClass = FlowField;
        }
        field(50271; "AMC Saldo"; Decimal)
        {
            CalcFormula = sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("No."),
                                                                                "Posting Date" = field("Date Filter")));
            Caption = 'Saldo';
            FieldClass = FlowField;
        }
        field(50272; "AMC Print Discount on Invoice"; Boolean)
        {
            Caption = 'Print Discount on Invoice';
            DataClassification = CustomerContent;
        }
        field(50273; "AMC Additional Invoice Not"; Boolean)
        {
            Caption = 'Dodatkowa Nota Faktury';
            DataClassification = CustomerContent;
        }
        field(50300; "AMC Date Filter CM-5M"; Date)
        {
            Caption = 'Filtr Daty BM-5M';
            FieldClass = FlowFilter;
        }
        field(50301; "AMC Date Filter CM-6M"; Date)
        {
            Caption = 'Filtr Daty BM-6M';
            FieldClass = FlowFilter;
        }
        field(50302; "AMC Date Filter CM-7M"; Date)
        {
            Caption = 'Filtr Daty BM-7M';
            FieldClass = FlowFilter;
        }
        field(50303; "AMC Date Filter CM-8M"; Date)
        {
            Caption = 'Filtr Daty BM-8M';
            FieldClass = FlowFilter;
        }
        field(50304; "AMC Date Filter CM-9M"; Date)
        {
            Caption = 'Filtr Daty BM-9M';
            FieldClass = FlowFilter;
        }
        field(50305; "AMC Date Filter CM-10M"; Date)
        {
            Caption = 'Filtr Daty BM-10M';
            FieldClass = FlowFilter;
        }
        field(50306; "AMC Date Filter CM-11M"; Date)
        {
            Caption = 'Filtr Daty BM-11M';
            FieldClass = FlowFilter;
        }
        field(50307; "AMC Date Filter CM-12M"; Date)
        {
            Caption = 'Filtr Daty BM-12M';
            FieldClass = FlowFilter;
        }
        field(50308; "AMC Date Filter 12M"; Date)
        {
            Caption = 'Filtr Daty 12M';
            FieldClass = FlowFilter;
        }
        field(50309; "AMC Sales 12M"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter 12M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż 12M';
            FieldClass = FlowField;
        }
        field(50330; "AMC Sales 5Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-5M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-5M';
            FieldClass = FlowField;
        }
        field(50331; "AMC Sales 6Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-6M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-6M';
            FieldClass = FlowField;
        }
        field(50332; "AMC Sales 7Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-7M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-7M';
            FieldClass = FlowField;
        }
        field(50333; "AMC Sales 8Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-8M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-8M';
            FieldClass = FlowField;
        }
        field(50334; "AMC Sales 9Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-9M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-9M';
            FieldClass = FlowField;
        }
        field(50335; "AMC Sales 10Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-10M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-10M';
            FieldClass = FlowField;
        }
        field(50336; "AMC Sales 11Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-11M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-11M';
            FieldClass = FlowField;
        }
        field(50337; "AMC Sales 12Prv Month"; Decimal)
        {
            CalcFormula = - sum("Value Entry"."Valued Quantity" where("Item No." = field("AMC Item Filter"),
                                                                     "Source Type" = const(Customer),
                                                                     "Source No." = field("No."),
                                                                     "Posting Date" = field("AMC Date Filter CM-12M"),
                                                                     "Document Type" = filter("Sales Shipment" | "Sales Return Receipt"),
                                                                      Adjustment = const(false)));
            Caption = 'Sprzedaż BM-12M';
            FieldClass = FlowField;
        }
    }

}