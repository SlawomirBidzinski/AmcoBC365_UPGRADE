tableextension 50035 "AMC Sales Header" extends "Sales Header"
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
            Caption = 'Uwagi';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Średni';
            DataClassification = CustomerContent;
            DecimalPlaces = 4 : 4;
            trigger OnValidate()
            begin

                IF "AMC Exchange Rate" <> xRec."AMC Exchange Rate" THEN
                    "AMC Currancy Exchange Date" := 0D;

                IF "AMC Exchange Rate" <> 0 THEN
                    "Currency Factor" := 1 / "AMC Exchange Rate"
                ELSE
                    "Currency Factor" := 1;
            end;
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
            trigger OnValidate()
            var
                Text_002: Label 'Zmieniono Datę Kursu Waluty %1, czy zakualizować kurs?';
            begin

                IF "AMC Currancy Exchange Date" <> xRec."AMC Currancy Exchange Date" THEN
                    IF CONFIRM(Text_002, FALSE, "Currency Code") THEN begin
                        UpdateCurrencyFactor;
                        IF "Currency Factor" <> 0 Then begin
                            "AMC Exchange Rate" := ROUND(1 / "Currency Factor", 0.0001);
                        end else begin
                            "AMC Exchange Rate" := 0;
                        end;
                    end ELSE
                        ERROR('Zaniechano zmiany daty kursu');
            end;

            trigger OnLookup()
            var
                CurrExchRate: Record "Currency Exchange Rate";
                CurrExchRates: Page "Currency Exchange Rates";

            begin
                CLEAR(CurrExchRates);
                IF "Currency Code" <> '' THEN BEGIN
                    CurrExchRate.RESET;
                    CurrExchRate.SETRANGE("Currency Code", "Currency Code");
                    IF CurrExchRate.FINDLAST THEN BEGIN
                        CurrExchRates.SETTABLEVIEW(CurrExchRate);
                        CurrExchRates.SETRECORD(CurrExchRate);
                        CurrExchRates.LOOKUPMODE(TRUE);
                        IF CurrExchRates.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            CurrExchRates.GETRECORD(CurrExchRate);
                            VALIDATE("AMC Currancy Exchange Date", CurrExchRate."Starting Date");
                        END;
                    END;
                END;
            end;
        }
        field(50011; "AMC Remarks from Shipment"; Text[170])
        {
            CalcFormula = Lookup("Posted Whse. Shipment Header"."AMC Remarks" WHERE("No." = FIELD("AMC Posted Shipment No")));
            Caption = 'Uwagi do Wydania';
            Editable = false;
            FieldClass = FlowField;
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
        field(50028; "AMC Prepayment Order No."; Code[20])
        {
            Caption = 'Prepayment Order No.';
            DataClassification = CustomerContent;
        }
        field(50030; "AMC Discount Line Invoice"; Boolean)
        {
            Caption = 'Rabat Linia Faktury';
            DataClassification = CustomerContent;
        }
        field(50040; "AMC Delivery Date"; Date)
        {
            Caption = 'Delivery Date';
            DataClassification = CustomerContent;
        }
        field(50041; "AMC Quote other conditions"; Text[100])
        {
            Caption = 'Inne warunki oferty';
            DataClassification = CustomerContent;
        }
        field(50042; "AMC Delivery Conditions [hrs]"; Decimal)
        {
            Caption = 'Warunki dostawy [godz.]';
            DataClassification = CustomerContent;
            DecimalPlaces = 1 : 1;
        }
        field(50043; "AMC Quote Exp. Date"; Date)
        {
            Caption = 'Data ważności oferty';
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
        field(50061; "AMC EDI Order Status"; Enum "AMC EDI Order Status")
        {
            Caption = 'Status zamówienia EDI';
            DataClassification = CustomerContent;
        }
        field(50062; "AMC EDI Imported Orders"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count("Sales Header" WHERE("Document Type" = CONST(Order),
                                                      "AMC EDI Order Status" = FILTER(Imported)));
            Caption = 'Il. zaimport. zam. EDI';
            Editable = false;

        }
        field(50101; "AMC Customer Serach Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD("Sell-to Customer No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
        }
        field(50102; "AMC Shipment No"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Warehouse Shipment Line"."No." WHERE("Source Document" = CONST("Sales Order"),
                                                                      "Source No." = FIELD("No.")));
            Caption = 'Nr Wydania Magaz.';
            Editable = false;
        }
        field(50103; "AMC Posted Shipment No"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Posted Whse. Shipment Line"."No." WHERE("Source No." = FIELD("No.")));
            Caption = 'Nr Zaksięg. Wydania';
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
        field(50106; "AMC Territory Code"; Code[20])
        {
            Caption = 'Kod Regionu';
            TableRelation = Territory;
            DataClassification = CustomerContent;
        }
        field(50107; "AMC Contact Search Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Contact."Search Name" WHERE("No." = FIELD("Sell-to Contact No.")));
            Caption = 'Nazwa Szukana Kontaktu';
            Editable = false;
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

            trigger OnValidate()
            var
                SalesLine: Record "Sales Line";
            begin
                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                SalesLine.SETRANGE(Type, SalesLine.Type::Item);
                IF SalesLine.FINDFIRST THEN
                    REPEAT

                        SalesLine."AMC Price Currency" := "AMC Price Currency";
                        SalesLine."AMC Price Exchage Rate" := "AMC Price Exch. Rate";

                        IF "AMC Price Currency" <> "Currency Code" THEN BEGIN
                            IF SalesLine."AMC Currency Unit Price" <> 0 THEN BEGIN
                                SalesLine.VALIDATE("Unit Price", ROUND(SalesLine."AMC Currency Unit Price" * SalesLine."AMC Price Exchage Rate", 0.01));
                            END;
                        END ELSE BEGIN
                            SalesLine.VALIDATE("Unit Price", SalesLine."AMC Currency Unit Price");
                        END;
                        SalesLine.MODIFY;
                    UNTIL SalesLine.NEXT = 0;
            end;
        }
        field(50122; "AMC Price Exch. Date"; Date)
        {
            Caption = 'Data Kursu Waluty Cennika';
            DataClassification = CustomerContent;

            trigger OnValidate()

            var

                CurrExchRate: Record "Currency Exchange Rate";
                CatalogCurrDate: Date;
                FactExchangeDate: Date;
                CatalogFactor: Decimal;
                ExhangeRate: Decimal;

            begin

                IF "AMC Price Currency" <> '' THEN BEGIN
                    IF "AMC Price Exch. Date" <> 0D THEN
                        CatalogCurrDate := "AMC Price Exch. Date"
                    ELSE
                        CatalogCurrDate := WORKDATE;

                    CatalogFactor := CurrExchRate.ExchangeRateSale(CatalogCurrDate, "AMC Price Currency", FactExchangeDate, ExhangeRate);
                    "AMC Price Exch. Rate" := ROUND(1 / CatalogFactor, 0.0001);
                    "AMC Price Exch. Date" := FactExchangeDate;
                END ELSE BEGIN
                    "AMC Price Exch. Rate" := 0;
                    "AMC Price Exch. Date" := 0D;
                    "AMC Price Currency" := '';
                END;

                SalesLine.RESET;
                SalesLine.SETRANGE("Document Type", "Document Type");
                SalesLine.SETRANGE("Document No.", "No.");
                IF SalesLine.FINDFIRST THEN
                    REPEAT
                        SalesLine."AMC Price Currency" := "AMC Price Currency";
                        IF CatalogFactor <> 0 THEN
                            SalesLine."AMC Price Exchage Rate" := ROUND(1 / CatalogFactor, 0.0001)
                        ELSE
                            SalesLine."AMC Price Exchage Rate" := 0;

                        IF (SalesLine."AMC Currency Unit Price" <> 0) THEN BEGIN
                            IF ("AMC Price Currency" <> "Currency Code") THEN
                                SalesLine.VALIDATE("Unit Price", ROUND(SalesLine."AMC Currency Unit Price" * SalesLine."AMC Price Exchage Rate", 0.01))
                            ELSE
                                SalesLine.VALIDATE("Unit Price", SalesLine."AMC Currency Unit Price");
                        END;

                        SalesLine.MODIFY;
                    UNTIL SalesLine.NEXT = 0;
            end;


            trigger OnLookup()
            var

                CurrExchRate: Record "Currency Exchange Rate";
                CurrExchRates: Page "Currency Exchange Rates";

            begin

                CLEAR(CurrExchRates);
                IF "AMC Price Currency" <> '' THEN BEGIN
                    CurrExchRate.RESET;
                    CurrExchRate.SETRANGE("Currency Code", "AMC Price Currency");
                    IF CurrExchRate.FINDLAST THEN BEGIN
                        CurrExchRates.SETTABLEVIEW(CurrExchRate);
                        CurrExchRates.SETRECORD(CurrExchRate);
                        CurrExchRates.LOOKUPMODE(TRUE);
                        IF CurrExchRates.RUNMODAL = ACTION::LookupOK THEN BEGIN
                            CurrExchRates.GETRECORD(CurrExchRate);
                            VALIDATE("AMC Price Exch. Date", CurrExchRate."Starting Date");
                        END;
                    END;
                END;
            end;




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
        field(50160; "AMC Item Weight Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line".Quantity WHERE("Document Type" = CONST(Order),
                                                           "Document No." = FIELD("No."),
                                                           Type = CONST(Item),
                                                           "Unit of Measure Code" = FILTER('KG')));
            Caption = 'Razem Waga Zapasów';
            Editable = false;
        }
        field(50190; "AMC Order Line Amount"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Line Amount" WHERE("Document Type" = FIELD("Document Type"),
                                                                "Document No." = FIELD("No.")));
            Caption = 'Kwota Zamówienia';
            Editable = false;
        }
        //FIXME
        /*   
           field(50200; "AMC Bank Transfer Template"; Code[20])
           {
               Caption = 'Bank Transfer Template';
               Description = 'ITEBA6/00';
               TableRelation = "Bank Transfer Template";
               DataClassification = CustomerContent;
           }
         */
        field(50201; "AMC Customer Bank Account Code"; Code[20])
        {
            Caption = 'Customer Bank Account Code';
            Description = 'ITEBA6/00';
            TableRelation = "Vendor Bank Account";
            DataClassification = CustomerContent;
        }
        field(50202; "AMC Discount Corr. Invoice"; Boolean)
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
        field(50205; "AMC Last Archive"; Boolean)
        {
            Caption = 'Last Archive';
            DataClassification = CustomerContent;
        }
    }
    trigger OnInsert()
    var

    begin
        rec."AMC Create by IdUser" := UserId;
        rec."AMC Creation Date" := WORKDATE;
    end;

    procedure AMCCalculateCustomerLimit(var ActualCustomerLimit: Decimal; var CustomerBalanceAfterSale: Decimal)
    var
        CustomerRec: Record Customer;
        SetOffLimit: Boolean;
        ActualCustomerBalance: Decimal;
        PLNCurrencyCode: Text;
    begin
        ActualCustomerLimit := 0;
        ActualCustomerBalance := 0;
        CustomerBalanceAfterSale := 0;
        PLNCurrencyCode := 'PLN';

        IF Rec."Bill-to Customer No." <> '' THEN
            IF CustomerRec.GET(Rec."Bill-to Customer No.") THEN BEGIN
                CustomerRec.CALCFIELDS("Balance (LCY)");
                ActualCustomerBalance := CustomerRec."Balance (LCY)";
                ActualCustomerLimit := CustomerRec."Credit Limit (LCY)";

                IF (Rec."Currency Code" = '') OR (Rec."Currency Code" = 'PLN') THEN
                    CustomerBalanceAfterSale := ActualCustomerBalance + AMCCalculateOrderGrossValue()
                ELSE
                    CustomerBalanceAfterSale := ActualCustomerBalance + ROUND(AMCCalculateOrderGrossValue() * Rec."AMC Exchange Rate", 0.01);
            END;
    end;

    procedure AMCCalculateOrderGrossValue(): Decimal
    var
        SalesLineRec: Record "Sales Line";
        OrderGrossAmount: Decimal;
    begin
        CASE Rec.Status OF
            Rec.Status::Open:
                exit(0);

            Rec.Status::Released:
                BEGIN
                    OrderGrossAmount := 0;
                    SalesLineRec.RESET();
                    SalesLineRec.SETRANGE("Document Type", Rec."Document Type");
                    SalesLineRec.SETRANGE("Document No.", Rec."No.");
                    IF SalesLineRec.FindSet() THEN
                        REPEAT
                            OrderGrossAmount := OrderGrossAmount + SalesLineRec."Amount Including VAT";
                        UNTIL SalesLineRec.NEXT() = 0;
                    exit(OrderGrossAmount);
                END;
        END;
        exit(0);
    end;
}