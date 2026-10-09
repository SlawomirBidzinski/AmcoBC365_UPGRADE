tableextension 50054 "AMC Purchase HeaderExt" extends "Purchase Header"
{
    fields
    {
        field(50004; "AMC Currency Exchange Date"; Date)
        {
            Caption = 'Data Kursu Wymiany';
            DataClassification = CustomerContent;

            trigger OnLookup()
            begin
                CLEAR(CurrExchRates);
                if "Currency Code" <> '' then begin
                    CurrExchRate.RESET();
                    CurrExchRate.SETRANGE("Currency Code", "Currency Code");
                    if CurrExchRate.FINDLAST() then begin
                        CurrExchRates.SETTABLEVIEW(CurrExchRate);
                        CurrExchRates.SETRECORD(CurrExchRate);
                        CurrExchRates.LOOKUPMODE(true);
                        if CurrExchRates.RUNMODAL() = ACTION::LookupOK then begin
                            CurrExchRates.GETRECORD(CurrExchRate);
                            VALIDATE("AMC Currency Exchange Date", CurrExchRate."Starting Date");
                        end;
                    end;
                end;
            end;

            trigger OnValidate()
            begin
                if "AMC Currency Exchange Date" <> xRec."AMC Currency Exchange Date" then
                    if CONFIRM(Text_002, false, "Currency Code") then begin
                        UpdateCurrFactor();
                        IF "Currency Factor" <> 0 then
                            "AMC Exchange Rate" := ROUND(1 / "Currency Factor", 0.0001)
                        else
                            "AMC Exchange Rate" := 0;
                    end
                    else
                        ERROR('Zaniechano zmiany daty kursu');
            end;
        }
        field(50005; "AMC Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Średni';
            DataClassification = CustomerContent;
            DecimalPlaces = 4 : 4;

            trigger OnValidate()
            begin
                if "AMC Exchange Rate" <> xRec."AMC Exchange Rate" then
                    "AMC Currency Exchange Date" := 0D;

                if "AMC Exchange Rate" <> 0 then
                    "Currency Factor" := 1 / "AMC Exchange Rate"
                else
                    "Currency Factor" := 1;
            end;
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
        field(50031; "AMC Purchase Order Status"; Enum "AMC Purchase Order Status")
        {
            Caption = 'Status Zamówienia';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TESTFIELD(Status, Status::Open);
                UpdatePurchLines(FIELDCAPTION("AMC Purchase Order Status"), false);
            end;
        }
        field(50033; "AMC Purchase Planning Year"; Integer)
        {
            Caption = 'Forecast Planning Year';
            DataClassification = CustomerContent;
        }
        field(50034; "AMC Purchase Planning Week"; Integer)
        {
            Caption = 'Forecast Planning Week';
            DataClassification = CustomerContent;
        }
        field(50035; "AMC Planning Creation User Id"; Code[20])
        {
            Caption = 'Planning Creation User Id';
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Planning Creation Date"; Date)
        {
            Caption = 'Planning Creation Date';
            DataClassification = CustomerContent;
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
        field(50051; "AMC Export Date"; Date)
        {
            Caption = 'Data Exportu';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC Export Time"; Time)
        {
            Caption = 'Godz. Exportu';
            DataClassification = CustomerContent;
        }
        field(50053; "AMC Last Order Status Send"; Enum "AMC Last Order Status Send")
        {
            Caption = 'Ost. Wysł. Status Zamówienia';
            DataClassification = CustomerContent;
        }
        field(50054; "AMC Closed Status Sent"; Boolean)
        {
            Caption = 'Wysłany Status Zamk. Zam.';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Tworca faktury"; Text[30])
        {
            Caption = 'Invoice creator';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Vendor Search Name"; Code[100])
        {
            CalcFormula = lookup(Vendor."Search Name" where("Search Name" = field("Buy-from Vendor No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50102; "AMC Agreement Date"; Date)
        {
            Caption = 'Agreement Date';
            DataClassification = CustomerContent;
        }
        field(50103; "AMC Receipt No."; Code[20])
        {
            CalcFormula = lookup("Warehouse Receipt Line"."No." where("Source Document" = const("Purchase Order"),
                                                                     "Source No." = field("No.")));
            Caption = 'Receipt No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50104; "AMC Posted Receipt No."; Code[20])
        {
            CalcFormula = lookup("Posted Whse. Receipt Line"."No." where("Source No." = field("No.")));
            Caption = 'Posted Receipt No.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50105; "AMC Posted Receipt Date"; Date)
        {
            CalcFormula = lookup("Posted Whse. Receipt Line"."Posting Date" where("Source No." = field("No.")));
            Caption = 'Data Przyjęcia Magazynowego';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50109; "AMC Drop Shipment"; Boolean)
        {
            Caption = 'Dostawa Bezpośrednia';
            DataClassification = CustomerContent;
        }
        field(50203; "AMC Contract Date"; Date)
        {
            Caption = 'Contract Date';
            DataClassification = CustomerContent;
        }
        modify("ITI Nos. Template Code")
        {
            trigger OnAfterValidate()
            var
                PurchDocNosTemplate: Record "ITI Purch. Doc. Nos. Template";
            begin
                if PurchDocNosTemplate.Get("ITI Nos. Template Code") then
                    Rec.Validate("AMC PW Transaction", PurchDocNosTemplate."AMC PW Transaction");
            end;
        }
    }
    trigger OnInsert()
    var

    begin
        rec."AMC Create by IdUser" := UserId;
        rec."AMC Creation Date" := WORKDATE;
    end;


    procedure AMCAssistEditPW(OldPurchHeader: Record "Purchase Header"): Boolean
    var
        PurchSetup: Record "Purchases & Payables Setup";
        NoSeriesMgt: Codeunit "No. Series";
    begin
        PurchSetup.Get();
        PurchSetup.TestField("AMC PW Receipt No.");
        PurchSetup.TestField("AMC PW Receipt Invoiced No.");
        if NoSeriesMgt.LookupRelatedNoSeries(PurchSetup."AMC PW Receipt No.", OldPurchHeader."No. Series", "No. Series") then begin
            "No." := NoSeriesMgt.GetNextNo("No. Series");
            exit(true);
        end;
    end;

    procedure AMCInitInsertPW()
    var
        NoSeries: Codeunit "No. Series";
    begin
        PurchSetup.Get();
        if "No." = '' then begin
            PurchSetup.TestField("AMC PW Receipt No.");
            "No. Series" := PurchSetup."AMC PW Receipt No.";
            if NoSeries.AreRelated(PurchSetup."AMC PW Receipt No.", xRec."No. Series") then
                "No. Series" := xRec."No. Series";

            "No." := NoSeries.GetNextNo("No. Series", "Posting Date");
        end;

        InitRecord();
        "Posting No. Series" := PurchSetup."AMC PW Receipt Invoiced No.";
    end;

    internal procedure AMCLookupBuyFromContactPW()
    var
        Contact: Record Contact;
    begin
        if "Buy-from Vendor No." = '' then
            exit;

        Contact.FilterGroup(2);
        AMCLookupContact("Buy-from Vendor No.", "Buy-from Contact No.", Contact);
        if PAGE.RunModal(0, Contact) = ACTION::LookupOK then
            Validate("Buy-from Contact No.", Contact."No.");
        Contact.FilterGroup(0);
    end;

    local procedure AMCLookupContact(VendorNo: Code[20]; ContactNo: Code[20]; var Contact: Record Contact)
    var
        ContactBusinessRelation: Record "Contact Business Relation";
    begin
        if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Vendor, VendorNo) then
            Contact.SetRange("Company No.", ContactBusinessRelation."Contact No.")
        else
            Contact.SetRange("Company No.", '');
        if ContactNo <> '' then
            if Contact.Get(ContactNo) then;
    end;

    trigger OnAfterInsert()
    begin
        AMCInitInsertPW();
    end;

    procedure UpdateCurrFactor()
    var
        CurrExchRate: Record "Currency Exchange Rate";
        UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
        CurrencyDate: Date;
    begin
        if "Currency Code" <> '' then begin
            if Rec."AMC Currency Exchange Date" <> 0D then
                CurrencyDate := Rec."AMC Currency Exchange Date"
            else
                CurrencyDate := WorkDate();

            if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
                "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");
                if ("Currency Code" <> xRec."Currency Code") and (xRec."No." <> '') then
                    RecreatePurchLines(FieldCaption("Currency Code"));
            end else
                UpdateCurrencyExchangeRates.ShowMissingExchangeRatesNotification("Currency Code");
        end else begin
            "Currency Factor" := 0;
            if "Currency Code" <> xRec."Currency Code" then
                RecreatePurchLines(FieldCaption("Currency Code"));
        end;
    end;

    procedure ValidateITINosTemplateCode(DocType: Enum "Sales Document Type")
    var
        PurchDocNosTemplate: Record "ITI Purch. Doc. Nos. Template";
    begin
        if Rec."ITI Nos. Template Code" = '' then
            exit;

        PurchDocNosTemplate.Reset();
        PurchDocNosTemplate.SetRange("Document Type", DocType);
        PurchDocNosTemplate.SetRange(Code, Rec."ITI Nos. Template Code");
        PurchDocNosTemplate.FindFirst();
    end;

    procedure LookupITINosTemplateCode(DocType: Enum "Purchase Document Type")
    var
        PurchDocNosTemplate: Record "ITI Purch. Doc. Nos. Template";
        PurchDocNosTmpList: Page "ITI Purch. Doc. Nos. Tmp. List";
    begin
        PurchDocNosTemplate.Reset();
        PurchDocNosTemplate.SetRange("Document Type", DocType);

        Clear(PurchDocNosTmpList);
        PurchDocNosTmpList.LookupMode := true;
        PurchDocNosTmpList.SetRecord(PurchDocNosTemplate);
        PurchDocNosTmpList.SetTableView(PurchDocNosTemplate);
        if PurchDocNosTmpList.RunModal() = Action::LookupOK then begin
            PurchDocNosTmpList.GetRecord(PurchDocNosTemplate);
            Rec.Validate("ITI Nos. Template Code", PurchDocNosTemplate.Code);
        end;
    end;

    var
        CurrExchRate: Record "Currency Exchange Rate";
        CurrExchRates: Page "Currency Exchange Rates";
        Text_002: Label 'Zmieniono Datę Kursu Waluty %1, czy zakualizować kurs?';
        Text_003: Label 'Czy zaktualizować rabat wiersza we wszystkich liniach?';

}