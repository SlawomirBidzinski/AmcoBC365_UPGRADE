tableextension 50036 "AMC Sales Line" extends "Sales Line"
{
    fields
    {
        field(50000; "AMC Main Unit of Measure"; Code[10])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."Base Unit of Measure" WHERE("No." = FIELD("No.")));
            Caption = 'Podstawowa Jedn. Miary';
            Editable = false;

        }
        field(50004; "AMC Qty in Base Unit"; Decimal)
        {
            Caption = 'Ilość Jedn Podst';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Unit Price (Base Unit)"; Decimal)
        {
            Caption = 'Cena Jedn. Podst.';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Init Quantity"; Decimal)
        {
            Caption = 'Init Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Unit Price Source"; Enum "AMC Unit Price Source")
        {
            Caption = 'Źródło Cennika';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Pack Unit of Measure"; Code[10])
        {
            Caption = 'Jednostka miary opakowania';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość w opakowaniu';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Unit Price Date From"; Date)
        {
            Caption = 'Data Początkowa Cennika';
            DataClassification = CustomerContent;
        }
        field(50015; "AMC Rqst Qty to Ship"; Decimal)
        {
            Caption = 'Plan Il. do Wydania (Jedn Opak)';
            DataClassification = CustomerContent;
        }
        field(50016; "AMC Estim. Qty on Inv."; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry"."Remaining Quantity" WHERE("Item No." = FIELD("No."),
                                                                              "Location Code" = FIELD("Location Code")));
            Caption = 'Ilość Zapasu na Mag.';

        }
        field(50017; "AMC Total Rqst Qty to Ship"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."AMC Rqst Qty to Ship" WHERE("Sell-to Customer No." = FIELD("Sell-to Customer No."),
                                                                     "No." = FIELD("No.")));
            Caption = 'Razem Ilość do Wydania';
            Editable = false;

        }
        field(50018; "AMC Rqst Qty to Ship(Base)"; Decimal)
        {
            Caption = 'Plan Il. do Wydania (Pods. Jedn)';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50019; "AMC Shipment Doc Nr"; Code[20])
        {
            Caption = 'Nr Wydania Magazynowego';
            TableRelation = "Warehouse Shipment Header";
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Shipment Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Warehouse Shipment Line".Quantity WHERE("No." = FIELD("AMC Shipment Doc Nr"),
                                                                        "Source No." = FIELD("Document No."),
                                                                        "Source Line No." = FIELD("Line No.")));
            Caption = 'Ilość na Wydaniu';
        }
        field(50021; "AMC Item Qty Warehouse"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Location Code" = FIELD("Location Code")));
            Caption = 'Ilość Zapasu Magazyn';
            Editable = false;
        }
        field(50022; "AMC Item Qty Sales Order"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Sales Line"."Outstanding Qty. (Base)" WHERE("No." = FIELD("No."),
                                                                            Type = FIELD(Type),
                                                                            "Location Code" = FIELD("Location Code"),
                                                                            "Document Type" = CONST(Order)));
            Caption = 'Ilość Zapasu Zam. Sprzedaży';
            Editable = false;

        }
        field(50023; "AMC Item Qty Purchase Order"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Purchase Line"."Outstanding Qty. (Base)" WHERE(Type = FIELD(Type),
                                                                               "No." = FIELD("No."),
                                                                               "Location Code" = FIELD("Location Code"),
                                                                               "Document Type" = CONST(Order)));
            Caption = 'Ilość Zapasu Zam Zakupu';
            Editable = false;
        }
        field(50025; "AMC Customer Search Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD("Sell-to Customer No.")));
            Caption = 'Nazwa Kontrahenta';
            Editable = false;
        }
        field(50026; "AMC EDI Order Line No"; Code[10])
        {
            Caption = 'Nr Linii Zamówienia EDI';
            DataClassification = CustomerContent;

        }
        field(50027; "AMC EDI Unit Price"; Decimal)
        {
            Caption = 'Cena Jednostkowa EDI';
            DataClassification = CustomerContent;
        }
        field(50029; "AMC Last Ship No"; Code[20])
        {
            Caption = 'Nr Wydania Sprzedaży';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50030; "AMC Consolidate Item Code"; Enum "AMC Consolidate Item Code")
        {
            Caption = 'Kod Zapasu Konsolidacji';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Logistic min. [kgorder]"; Decimal)
        {
            Caption = 'Minimum logistyczne\[kg na dostaw.]';
            DataClassification = CustomerContent;
        }
        field(50033; "AMC Multiple order [ordmonth]"; Integer)
        {
            Caption = 'Wielokrotność zamówienia\[zam. na mies]';
            DataClassification = CustomerContent;
        }
        field(50041; "AMC Qty of Pieces"; Decimal)
        {
            Caption = 'Ilość Szt';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                IF "AMC Pack Quantity" <> 0 THEN BEGIN
                    VALIDATE(Quantity, "AMC Qty of Pieces" * "AMC Pack Quantity");
                END ELSE BEGIN
                    "AMC Pack Quantity" := 1;
                    VALIDATE(Quantity, "AMC Qty of Pieces" * "AMC Pack Quantity")
                END;
                VALIDATE("Unit Price");
            end;

        }
        field(50042; "AMC Piece Unit Price"; Decimal)
        {
            Caption = 'Cena Jedn. Szt';
            DecimalPlaces = 2 : 5;
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin

                IF "AMC Qty of Pieces" <> 0 THEN
                    VALIDATE("Unit Price", "AMC Piece Unit Price" / "AMC Pack Quantity");
            end;
        }
        field(50043; "AMC Line Notes"; Text[250])
        {
            Caption = 'Uwagi do linii';
            DataClassification = CustomerContent;
        }
        field(50045; "AMC Set Item"; Code[20])
        {
            Caption = 'Wybór Zapasu';
            TableRelation = Item;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(50046; "AMC Qty to Create"; Decimal)
        {
            Caption = 'Ilość do Wygenerowania';
            DataClassification = CustomerContent;
        }
        field(50047; "AMC Lot No to Create"; Code[20])
        {
            Caption = 'Partia do Wygenerowania';
            DataClassification = CustomerContent;
        }
        field(50048; "AMC Qty Created"; Decimal)
        {
            Caption = 'Ilość Wygenerowana';
            DataClassification = CustomerContent;
        }
        field(50049; "AMC Item Exp Date"; Date)
        {
            Caption = 'Data Ważności Próbki';
            DataClassification = CustomerContent;
        }
        field(50050; "AMC MOQ"; Text[30])
        {
            Caption = 'MOQ';
            DataClassification = CustomerContent;
        }
        field(50054; "AMC Order Cancelled"; Boolean)
        {
            Caption = 'Zamówienie Anulowanie';
            DataClassification = CustomerContent;
        }
        field(50056; "AMC Prepayment Invoice No."; Code[20])
        {
            Caption = 'Nr Faktury Przedpłaconej';
            DataClassification = CustomerContent;
        }
        field(50057; "AMC Quote Remarks"; Text[100])
        {
            Caption = 'Uwagi Oferty';
            DataClassification = CustomerContent;
        }
        field(50058; "AMC Corrected Invoice No"; Code[20])
        {
            Caption = 'Nr Korygowanej Faktury';
            DataClassification = CustomerContent;
        }
        field(50059; "AMC Item No"; Code[20])
        {
            Caption = 'Nr Zapasu';
            TableRelation = Item;
            DataClassification = CustomerContent;
        }
        field(50060; "AMC Invoice Line No"; Integer)
        {
            Caption = 'Nr Linii Faktury';
            DataClassification = CustomerContent;
        }
        field(50061; "AMC Invoice Amount"; Decimal)
        {
            Caption = 'Kwota linii faktury';
            DataClassification = CustomerContent;
        }
        field(50062; "AMC Invoice Discount (%)"; Decimal)
        {
            Caption = 'Rabat Faktury (%)';
            DataClassification = CustomerContent;
        }
        field(50063; "AMC No Use Correction"; Boolean)
        {
            Caption = 'Pomiń Rabat Faktury';
            DataClassification = CustomerContent;
        }
        field(50064; "AMC Invoice Due Date"; Date)
        {
            Caption = 'Data Płatności Faktury';
            DataClassification = CustomerContent;
        }
        field(50065; "AMC Invoice Payment"; Date)
        {
            Caption = 'Data Rozliczenia Faktury';
            DataClassification = CustomerContent;
        }
        field(50066; "AMC Actual Remaining Amount"; Decimal)
        {
            Caption = 'Akt. Pozost. Kwota Fakt.';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50071; "AMC Price Currency"; Code[10])
        {
            Caption = 'Waluta Cennika';
            DataClassification = CustomerContent;
        }
        field(50072; "AMC Price Exchage Rate"; Decimal)
        {
            Caption = 'Kurs Waluty Cennika';
            DataClassification = CustomerContent;
        }
        field(50073; "AMC Currency Unit Price"; Decimal)
        {
            Caption = 'Cena Jedn. Waluty';
            DataClassification = CustomerContent;
        }
        field(50080; "AMC RW Status"; Enum "AMC RW Status")
        {
            Caption = 'Status Próbki';
            DataClassification = CustomerContent;
        }
        field(50081; "AMC Smak"; Boolean)
        {
            Caption = 'Smak';
            DataClassification = CustomerContent;
        }
        field(50082; "AMC Funkcjonalna"; Boolean)
        {
            Caption = 'Funkcjonalna';
            DataClassification = CustomerContent;
        }
        field(50083; "AMC Cena"; Boolean)
        {
            Caption = 'Cena';
            DataClassification = CustomerContent;
        }
        field(50084; "AMC Dozowanie"; Boolean)
        {
            Caption = 'Dozowanie';
            DataClassification = CustomerContent;
        }
        field(50085; "AMC Konkurencja"; Boolean)
        {
            Caption = 'Konkurencja';
            DataClassification = CustomerContent;
        }
        field(50086; "AMC Opis Oceny"; Text[250])
        {
            Caption = 'Opis Oceny';
            DataClassification = CustomerContent;
        }
        field(50100; "AMC EDI Line Remarks"; Text[100])
        {
            Caption = 'Uwagi Linii EDI';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Corr. Item No."; Code[20])
        {
            Caption = 'Kod Zapasu korekty';
            DataClassification = CustomerContent;
        }
        field(50102; "AMC Corr. Qty"; Decimal)
        {
            Caption = 'Ilość korygowana';
            DataClassification = CustomerContent;
        }
        field(50103; "AMC Corr. Unit Price"; Decimal)
        {
            Caption = 'Cena Jedn. korekty';
            DataClassification = CustomerContent;
        }
        field(50104; "AMC Corr. UnitPriceincl.Disc."; Decimal)
        {
            Caption = 'Cena Jedn. z rabatem korekty';
            DataClassification = CustomerContent;
        }
        field(50105; "AMC Corr. Amount"; Decimal)
        {
            Caption = 'Kwota netto korekty';
            DataClassification = CustomerContent;
        }
        field(50106; "AMC Corr. Line No."; Integer)
        {
            Caption = 'Nr Linii korekty';
            DataClassification = CustomerContent;
        }
        field(50107; "AMC Corr. Line Type"; Enum "AMC Corr. Line No.")
        {
            Caption = 'Typ Linii korekty';
            DataClassification = CustomerContent;
        }
        field(50201; "AMC Customer Code"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Customer No." WHERE("Document Type" = FIELD("Document Type"),
                                                                              "No." = FIELD("Document No.")));
            Editable = false;
            Caption = 'Customer Code';
        }
        field(50202; "AMC Customer Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Sell-to Customer Name" WHERE("Document Type" = FIELD("Document Type"),
                                                                               "No." = FIELD("Document No.")));
            Caption = 'Customer Name';
        }
        field(50203; "AMC Created By"; Code[50])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."AMC Create by IdUser" WHERE("Document Type" = FIELD("Document Type"),
                                                                          "No." = FIELD("Document No.")));
            Caption = 'Created By';
        }
        field(50204; "AMC Document Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."Document Date" WHERE("Document Type" = FIELD("Document Type"),
                                                                       "No." = FIELD("Document No.")));
            Caption = 'Document Date';
        }
        field(50205; "AMC Delivery Date"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = Lookup("Sales Header"."AMC Delivery Date" WHERE("Document Type" = FIELD("Document Type"),
                                                                       "No." = FIELD("Document No.")));
            Caption = 'Delivery Date';
            Editable = false;
        }
        modify("No.")
        {
            TableRelation = if (Type = const(" ")) "Standard Text"
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(false)) "G/L Account" where("Direct Posting" = const(true), "Account Type" = const(Posting), Blocked = const(false))
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(true)) "G/L Account"
            else
            if (Type = const(Resource)) Resource
            else
            if (Type = const("Fixed Asset")) "Fixed Asset"
            else
            if (Type = const("Charge (Item)")) "Item Charge"
            else
            if (Type = const("Allocation Account")) "Allocation Account"
            else
            if (Type = const(Item)) Item
            where(Blocked = const(false), "Sales Blocked" = const(false), "AMC Sales Item" = const(true),
            "AMC Out Off Item List" = const(false));
        }
        modify(Quantity)
        {
            trigger OnAfterValidate()
            begin
                IF (Rec."AMC Init Quantity" = 0) AND (Rec."AMC Qty in Base Unit" <> 0) THEN
                    Rec."AMC Init Quantity" := Rec."AMC Qty in Base Unit";
            end;
        }
    }
}