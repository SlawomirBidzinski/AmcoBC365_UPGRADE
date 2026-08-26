tableextension 50073 "AMC Sales Invoice Line" extends "Sales Invoice Line"
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
            DecimalPlaces = 2 : 5;
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
        field(50030; "AMC Consolidate Item Code"; Enum "AMC Consolidate Item Code")
        {
            Caption = 'Kod Zapasu Konsolidacji';
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
            DecimalPlaces = 4 : 4;
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
        field(50400; "AMC Search Name"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Customer."Search Name" WHERE("No." = FIELD("Sell-to Customer No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;

        }
    }
}