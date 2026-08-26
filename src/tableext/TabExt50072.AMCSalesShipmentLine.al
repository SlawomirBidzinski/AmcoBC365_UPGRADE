tableextension 50072 "AMC Sales Shipment Line" extends "Sales Shipment Line"
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
            CalcFormula = Sum("Sales Line"."AMC Rqst Qty to Ship" WHERE("Sell-to Customer No." = FIELD("Sell-to Customer No."),
                                                                     "No." = FIELD("No.")));
            Caption = 'Razem Ilość do Wydania';
            Editable = false;
            FieldClass = FlowField;
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
            CalcFormula = Sum("Warehouse Shipment Line".Quantity WHERE("No." = FIELD("AMC Shipment Doc Nr"),
                                                                        "Source No." = FIELD("Document No."),
                                                                        "Source Line No." = FIELD("Line No.")));
            Caption = 'Ilość na Wydaniu';
            FieldClass = FlowField;
        }
        field(50021; "AMC Item Qty Warehouse"; Decimal)
        {
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("No."),
                                                                  "Location Code" = FIELD("Location Code")));
            Caption = 'Ilość Zapasu Magazyn';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50022; "AMC Item Qty Sales Order"; Decimal)
        {
            CalcFormula = Sum("Sales Line"."Outstanding Qty. (Base)" WHERE("No." = FIELD("No."),
                                                                            Type = FIELD(Type),
                                                                            "Location Code" = FIELD("Location Code"),
                                                                            "Document Type" = CONST(Order)));
            Caption = 'Ilość Zapasu Zam. Sprzedaży';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50023; "AMC Item Qty Purchase Order"; Decimal)
        {
            CalcFormula = Sum("Purchase Line"."Outstanding Qty. (Base)" WHERE(Type = FIELD(Type),
                                                                               "No." = FIELD("No."),
                                                                               "Location Code" = FIELD("Location Code"),
                                                                               "Document Type" = CONST(Order)));
            Caption = 'Ilość Zapasu Zam Zakupu';
            Editable = false;
            FieldClass = FlowField;
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
        field(50054; "AMC Order Cancelled"; Boolean)
        {
            Caption = 'Zamówienie Anulowanie';
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
        field(50100; "AMC EDI Line Remarks"; Text[100])
        {
            Caption = 'Uwagi Linii EDI';
            DataClassification = CustomerContent;
        }
        field(51036; "AMC Warehause Shipment No."; Code[20])
        {
            Caption = 'Warehause Shipment No.';
            DataClassification = CustomerContent;
        }
        field(51037; "AMC Customer Search Name"; Code[100])
        {
            CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD("Bill-to Customer No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Customer Search Name';
        }
    }

}