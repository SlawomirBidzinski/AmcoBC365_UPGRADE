tableextension 50033 "AMC Sales & Receivables Setup" extends "Sales & Receivables Setup"
{
    fields
    {
        field(50000; "AMC Catalog Price Currency"; Code[10])
        {
            Caption = 'Catalog Price Currency';
            Description = 'ZZ16Sep2012';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(50001; "AMC RW Invoiced Correction No."; Code[10])
        {
            Caption = 'Seria num. zaks. RW';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50002; "AMC RW Open Correction No."; Code[10])
        {
            Caption = 'Seria num. zam. RW';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50003; "AMC RW Business Posting Group"; Code[10])
        {
            Caption = 'Gł. Gosp Grupa Księg. RW';
            TableRelation = "Gen. Business Posting Group";
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Service Invoice"; Code[10])
        {
            Caption = 'Seria num. zaks. Faktury Usług.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Service Corr. Invoice"; Code[10])
        {
            Caption = 'Seria num. zaks. Kor. Faktury Usług.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50006; "AMC EDI Archive Path"; Text[250])
        {
            Caption = 'EDI Path';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Set Postponed VAT"; Boolean)
        {
            Caption = 'Ustawiaj Przełożony VAT';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC EDI Source Path"; Text[250])
        {
            Caption = 'EDI Source Path';
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Use EDI File Monitor"; Boolean)
        {
            Caption = 'Uruchom monitor plików EDI';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Consolidate Item Code"; Code[20])
        {
            Caption = 'Kod zapasu konsolidacji';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Consolidate Item Desc."; Text[50])
        {
            Caption = 'Nazwa zapasu konsolidacji';
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Consolidate Item Unit Code"; Code[10])
        {
            Caption = 'Kod jedn. miary zapasu konsoli.';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50013; "AMC Production Forecast Code"; Code[10])
        {
            Caption = 'Kod Prognozy Produkcji';
            TableRelation = "Production Forecast Name";
            DataClassification = CustomerContent;
        }
        field(50014; "AMC RW Item Nos."; Code[20])
        {
            Caption = 'Seria zapasów RW';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50016; "AMC Default Currency Bank Acc."; Boolean)
        {
            Caption = 'Domyślne konto bankowe waluty';
            DataClassification = CustomerContent;
        }
        field(50017; "AMC RW Return Order Corr. No."; Code[10])
        {
            Caption = 'Seria num. zam. zwrotu RW';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50018; "AMC RW Credit Memo Corr. No."; Code[10])
        {
            Caption = 'Seria num. zaks. zwrotu RW';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Consolidate Item Code 2"; Code[20])
        {
            Caption = 'Kod zapasu konsolidacji 2';
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Consolidate Item Desc. 2"; Text[50])
        {
            Caption = 'Nazwa zapasu konsolidacji 2';
            DataClassification = CustomerContent;
        }
        field(50022; "AMC Consolidate Item UnitCode2"; Code[10])
        {
            Caption = 'Kod jedn. miary zapasu konsoli. 2';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }

        field(50030; "AMC Consolidate Item Code 3"; Code[20])
        {
            Caption = 'Kod zapasu konsolidacji 3';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Consolidate Item Desc. 3"; Text[50])
        {
            Caption = 'Nazwa zapasu konsolidacji 3';
            DataClassification = CustomerContent;
        }
        field(50032; "AMC Consolidate Item UnitCode3"; Code[10])
        {
            Caption = 'Kod jedn. miary zapasu konsoli. 3';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50040; "AMC Consolidate Item Code 4"; Code[20])
        {
            Caption = 'Kod zapasu konsolidacji 4';
            DataClassification = CustomerContent;
        }
        field(50041; "AMC Consolidate Item Desc. 4"; Text[50])
        {
            Caption = 'Nazwa zapasu konsolidacji 4';
            DataClassification = CustomerContent;
        }
        field(50042; "AMC Consolidate Item UnitCode4"; Code[10])
        {
            Caption = 'Kod jedn. miary zapasu konsoli. 4';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50043; "AMC Manufacturer DimensionCode"; Code[20])
        {
            Caption = 'Manufacturer Dimension Code';
            TableRelation = Dimension;
            DataClassification = CustomerContent;
        }
        field(50047; "AMC Customs Inv. Corr. Nos"; Code[10])
        {
            Caption = 'Seria num. faktur celnych koryg.';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50048; "AMC Customs Inv. Nos"; Code[10])
        {
            Caption = 'Seria num. faktur celnych';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50049; "AMC Paym. Code Customer Inv."; Code[10])
        {
            Caption = 'Payment Method Code';
            TableRelation = "Payment Method";
            DataClassification = CustomerContent;
        }
        field(50050; "AMC EDI Invoice File"; Text[200])
        {
            Caption = 'Ścieżka Faktur EDI';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC EDI Duplicate Invoice"; Text[200])
        {
            Caption = 'Ścieżka Duplikat .Fakt. EDI';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC EDI Order xml port"; Integer)
        {
            Caption = 'xmlport Zamówienia EDI';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(XMLport));
            DataClassification = CustomerContent;
        }
        field(50053; "AMC AMC EDI Invoice xml port"; Integer)
        {
            Caption = 'xmlport Faktury EDI';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(XMLport));
            DataClassification = CustomerContent;
        }
        field(50054; "AMC EDI Cred Memo xml port"; Integer)
        {
            Caption = 'xmlport Faktury Korekty  EDI';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(XMLport));
            DataClassification = CustomerContent;
        }

        field(50055; "AMC Amco EDI Use"; Boolean)
        {
            Caption = 'Używaj EDI Amco';
            DataClassification = CustomerContent;
        }
        field(50060; "AMC Selgros EDI Use"; Boolean)
        {
            Caption = 'Używaj EDI Selgros';
            DataClassification = CustomerContent;
        }
        field(50061; "AMC Selgros EDI Archive Path"; Text[200])
        {
            Caption = 'EDI Path';
            DataClassification = CustomerContent;
        }
        field(50062; "AMC Selgros EDI Source Path"; Text[200])
        {
            Caption = 'EDI Source Path';
            DataClassification = CustomerContent;
        }
        field(50063; "AMC Selgros EDI Invoice File"; Text[200])
        {
            Caption = 'Selgros Ścieżka Faktur EDI';
            DataClassification = CustomerContent;
        }
        field(50064; "AMC Selgros EDI Dupl. Invoice"; Text[200])
        {
            Caption = 'Selgros Ścieżka Duplikat .Fakt. EDI';
            DataClassification = CustomerContent;
        }

        field(50065; "AMC Selgros EDI Order xml port"; Integer)
        {
            Caption = 'Selgros xmlport Zamówienia EDI';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(XMLport));
            DataClassification = CustomerContent;
        }
        field(50066; "AMC Selgros EDI Inv. xml port"; Integer)
        {
            Caption = 'Selgros xmlport Faktury EDI';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(XMLport));
            DataClassification = CustomerContent;
        }
        field(50067; "AMC Sel. EDI Cr. Memo XMLPort"; Integer)
        {
            Caption = 'Selgros xmlport Faktury Korekty EDI';
            TableRelation = AllObjWithCaption."Object ID" WHERE("Object Type" = CONST(XMLport));
            DataClassification = CustomerContent;
        }

        field(50070; "AMC Invoice PDF Catalog"; Text[205])
        {
            Caption = 'Folder Faktur PDF';
            DataClassification = CustomerContent;
        }
        field(50071; "AMC Invoice Setting Date From"; Date)
        {
            Caption = 'Ustawienie Daty Aktualizacji';
            DataClassification = CustomerContent;
        }
        field(50081; "AMC EIS Export Item"; Boolean)
        {
            Caption = 'EIS Eksport Zapasy';
            DataClassification = CustomerContent;
        }
        field(50082; "AMC EIS Export Customer"; Boolean)
        {
            Caption = 'EIS Eksport Nabywcy';
            DataClassification = CustomerContent;
        }
        field(50083; "AMC EIS Export Salesperson"; Boolean)
        {
            Caption = 'EIS Eksport Sprzedawcy';
            DataClassification = CustomerContent;
        }
        field(50084; "AMC EIS Export Invoices"; Boolean)
        {
            Caption = 'EIS Eksport Faktury';
            DataClassification = CustomerContent;
        }
        field(50085; "AMC EIS Export Vendor"; Boolean)
        {
            Caption = 'EIS Eksport Dostawcy';
            DataClassification = CustomerContent;
        }
        field(50086; "AMC EIS Export Purchase Ord"; Boolean)
        {
            Caption = 'EIS Eksport Zamówienia Zak.';
            DataClassification = CustomerContent;
        }
        field(50087; "AMC EIS Export Inbound Tran"; Boolean)
        {
            Caption = 'EIS Eksport Inbound Tran';
            DataClassification = CustomerContent;
        }
        field(50088; "AMC EIS Export Sales Ord"; Boolean)
        {
            Caption = 'EIS Eksport Zamówienia Sprz.';
            DataClassification = CustomerContent;
        }
        field(50089; "AMC EIS Export Purchase Inv"; Boolean)
        {
            Caption = 'EIS Eksport Faktury Zakupu';
            DataClassification = CustomerContent;
        }
        field(50090; "AMC EIS Export Prod. BOM"; Boolean)
        {
            Caption = 'EIS Eksport BOMów Prod.';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Technolog Card Nos"; Code[10])
        {
            Caption = 'Seria num. karty technologicznej';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Project Card Nos"; Code[10])
        {
            Caption = 'Seria num. zlecenia projektowego';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50102; "AMC Discount Corr. Inv Nos"; Code[10])
        {
            Caption = 'Serria num.faktury koryg.zbiorczej';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50103; "AMC Posted Disc. Corr. Inv Nos"; Code[10])
        {
            Caption = 'Serria num.zaks. faktury koryg.zbiorczej';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50104; "AMC Disc. Corr. ItemChargeCode"; Code[20])
        {
            Caption = 'Kod Kosztu Dodatk. Fakt. Zbiorcz';
            TableRelation = "Item Charge";
            DataClassification = CustomerContent;
        }
        field(50105; "AMC Kod Regionu - Centrala"; Code[20])
        {
            Caption = 'Kod Regionu - Centrala';
            TableRelation = Territory;
            DataClassification = CustomerContent;
        }
        field(50106; "AMC Check Sales Limits"; Boolean)
        {
            Caption = 'Sprawdzaj Limit Sprzedaży';
            DataClassification = CustomerContent;
        }
        field(50110; "AMC Profit Level (%)"; Decimal)
        {
            Caption = 'Próg Rentowności';
            DecimalPlaces = 1 : 2;
            DataClassification = CustomerContent;
        }
        field(50111; "AMC Profit Control"; Boolean)
        {
            Caption = 'Kontrola Rentowności';
            DataClassification = CustomerContent;
        }
        field(50200; "AMC Karta Techn. PDF Catalog"; Text[100])
        {
            Caption = 'Folder Karty Technologicznej PDF';
            DataClassification = CustomerContent;
        }
        field(50201; "AMC Product Card Nos"; Code[20])
        {
            Caption = 'Seria num. karty produktu';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50202; "AMC Frutarom Export Path"; Text[200])
        {
            Caption = 'Folder Eksportu do Frutarom';
            DataClassification = CustomerContent;
        }
        field(50203; "AMC Rebate Account"; Code[20])
        {
            Caption = 'Konto Rezerwy Rabatu';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50204; "AMC Export Rebate Balance"; Boolean)
        {
            Caption = 'Eksport Rezerwy Rabatu';
            DataClassification = CustomerContent;
        }
        field(50205; "AMC Item Rebate Code"; Code[20])
        {
            Caption = 'Kod Transakcji Rabatu';
            DataClassification = CustomerContent;
        }
        field(50206; "AMC EIS Customer Code"; Code[20])
        {
            Caption = 'Kod Nabywcy EIS';
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(50207; "AMC Addit. Manuf. Cost Account"; Code[20])
        {
            Caption = 'Konto KWS Produktów';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50208; "AMC Cost of Purchase Frutarom"; Code[20])
        {
            Caption = 'Konto Kosztów Zakupu Frutarom';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50209; "AMC ExportAdditandPurchaseCost"; Boolean)
        {
            Caption = 'Eksport Kosztów Pośrednich i Zakupu';
            DataClassification = CustomerContent;
        }
        field(50210; "AMC Additional Invoice Notes"; Text[200])
        {
            Caption = 'Dodatkowa Nota Faktury';
            DataClassification = CustomerContent;
        }
        field(50211; "AMC CostAccount of Utilization"; Code[20])
        {
            Caption = 'Konto Koszty Utylizacji';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50212; "AMC CostAccount Matrial Losses"; Code[20])
        {
            Caption = 'Cost Account Matrial Losses';
            TableRelation = "G/L Account";
            DataClassification = CustomerContent;
        }
        field(50307; "AMC Addit. Manuf. Cost Code"; Code[10])
        {
            Caption = 'Kod KWS Produktów';
            DataClassification = CustomerContent;
        }
        field(50308; "AMC CostofPurchaseFrutaromCode"; Code[10])
        {
            Caption = 'Kod Kosztów Zakupu Frutarom';
            DataClassification = CustomerContent;
        }
        field(50311; "AMC Cost of Utilization Code"; Code[10])
        {
            Caption = 'Kod Kosztów Utylizacji';
            DataClassification = CustomerContent;
        }
        field(50312; "AMC Cost Matrial Losses Code"; Code[10])
        {
            Caption = 'Kod Ubytków Operacyjnych';
            DataClassification = CustomerContent;
        }
        field(50313; "AMC Trans.Code for Value Corr."; Code[10])
        {
            Caption = 'Kod Transakcji dla Korekt Kwoty';
            DataClassification = CustomerContent;
        }
        field(50314; "AMC Paymant Days Block"; DateFormula)
        {
            Caption = 'Ilość Dni Przekr. Rozl. Płatności';
            DataClassification = CustomerContent;
        }
        field(50315; "AMC Payment Value Block"; Decimal)
        {
            Caption = 'Kwota Przekr. Płatności';
            DataClassification = CustomerContent;
        }
        field(50316; "AMC Payment Control Set"; Boolean)
        {
            Caption = 'Włączenie Kontr. Przetermin.';
            DataClassification = CustomerContent;
        }
    }

}