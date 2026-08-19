tableextension 50061 "AMC Purchase Line Archive" extends "Purchase Line Archive"
{
    fields
    {
        field(50000; "AMC Main Unit of Measure"; Code[10])
        {
            CalcFormula = lookup(Item."Base Unit of Measure" where("No." = field("No.")));
            Caption = 'Podstawowa Jedn. Miary';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "AMC Rqst Qty to Recpt"; Decimal)
        {
            BlankZero = true;
            Caption = 'Rqst Qty to Recpt';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Receipt Doc No"; Code[20])
        {
            Caption = 'Nr Przyjęcia Magazynowego';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Receipt Qty"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość na Przyjęciu';
            DecimalPlaces = 0 : 5;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Qty in Base Unit"; Decimal)
        {
            Caption = 'Ilość Jedn Podst';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Direct UnitCost (BaseUnit)"; Decimal)
        {
            Caption = 'Bezp. Koszt Jedn. Podst.';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Init Quantity"; Decimal)
        {
            Caption = 'Init Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Rqst QtytoRecpt (BaseUnit)"; Decimal)
        {
            Caption = 'Plan Il. do Przyjęcia (Pods. Jedn)';
            DecimalPlaces = 0 : 5;
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
        field(50012; "AMC Unit Cost (Curr)"; Decimal)
        {
            Caption = 'Cena Jedn. (Wal)';
            DataClassification = CustomerContent;
        }
        field(50013; "AMC Unit Cost Curr Code"; Code[20])
        {
            Caption = 'Kod Waluty Ceny';
            DataClassification = CustomerContent;
            TableRelation = Currency;
        }
        field(50014; "AMC Unit Cost Curr Exch. Rate"; Decimal)
        {
            Caption = 'Kurs Waluty dla Ceny Jedn (Wal)';
            DecimalPlaces = 0 : 4;
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Item Reserved"; Decimal)
        {
            CalcFormula = sum("Reservation Entry"."Quantity (Base)" where("Location Code" = field("Location Code"),
                                                                           "Item No." = field("No."),
                                                                           "Source Type" = const(37),
                                                                           "Quantity (Base)" = filter(< 0)));
            Caption = 'Ilość Zapasu Zarezerwowana';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "AMC Last Receipt No"; Code[20])
        {
            Caption = 'Nr Przyjęcia Zakupu';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50026; "AMC Purchase Order Qty"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."AMC Qty in Base Unit" where("Blanket Order No." = field("Document No."),
                                                                        Type = filter(Item),
                                                                        "No." = field("No.")));
            Caption = 'Purchase Order Qty';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50027; "AMC Lot No"; Code[50])
        {
            CalcFormula = lookup("Reservation Entry"."Lot No." where("Item No." = field("No."),
                                                                      "Location Code" = field("Location Code"),
                                                                      "Source Type" = const(39),
                                                                      "Source Subtype" = const(1),
                                                                      "Source ID" = field("Document No."),
                                                                      "Source Ref. No." = field("Line No.")));
            Caption = 'Nr Partii';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50028; "AMC Blank Order Qty."; Decimal)
        {
            Caption = 'Ilość Zam. Zb.';
            DataClassification = CustomerContent;
        }
        field(50029; "AMC Blank Order Rcped. Qty"; Decimal)
        {
            Caption = 'Ilość Przyjęta Zam. Zb';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Purchase Order Status"; Enum "AMC Purchase Order Status")
        {
            Caption = 'Status Zamówienia';
            DataClassification = CustomerContent;

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
        field(50035; "AMC Quantity Ordered"; Decimal)
        {
            Caption = 'Quantity Ordered';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Value Ordered"; Decimal)
        {
            Caption = 'Value Ordered';
            DataClassification = CustomerContent;
        }
    }

}