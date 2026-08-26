tableextension 50040 "AMC Sales Cr. Memo Line" extends "Sales Cr.Memo Line"
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
        field(50007; "AMC Unit Price Source"; enum "AMC Unit Price Source")
        {
            Caption = 'Źródło Cennika';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość w opakowaniu';
            DecimalPlaces = 0 : 3;
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
            Caption = 'Razem Ilość do Wydania';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50018; "AMC Rqst Qty to Ship (Base)"; Decimal)
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
        field(50026; "AMC EDI Order Line No"; Code[10])
        {
            Caption = 'Nr Linii Zamówienia EDI';
            DataClassification = CustomerContent;
        }
        field(50041; "AMC Qty of Pieces"; Decimal)
        {
            Caption = 'Ilość Szt';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50042; "AMC Piece Unit Price"; Decimal)
        {
            Caption = 'Cena Jedn. Szt';
            DecimalPlaces = 2 : 5;
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
            Caption = 'Rabat Faktury';
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
        field(50107; "AMC Corr. Line Type"; Enum "AMC Corr. Line Type")
        {
            Caption = 'Typ Linii korekty';
            DataClassification = CustomerContent;
        }
    }

}