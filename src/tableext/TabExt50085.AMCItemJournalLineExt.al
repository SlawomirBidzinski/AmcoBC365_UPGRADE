tableextension 50085 "AMC Item Journal Line Ext." extends "Item Journal Line"
{
    fields
    {
        field(50000; "AMC Ext. Lot No."; Code[20])
        {
            Caption = 'Zewnętrzny nr partii';
            Description = 'AL.30Dec12';
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Cons. Item Tracking Lines"; Integer)
        {
            CalcFormula = Count("Reservation Entry" WHERE("Source Type" = CONST(5407),
                                                           "Source Subtype" = CONST(3),
                                                           "Source ID" = FIELD("AMC Prod. Order No."),
                                                           "Source Prod. Order Line" = FIELD("AMC Prod. Order Line No."),
                                                           "Source Ref. No." = FIELD("Prod. Order Comp. Line No.")));
            Caption = 'Wiesze śledzenia zużycia';
            Description = 'AL.07Jan13';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "AMC Actual Lot No."; Code[20])
        {
            Caption = 'Nr partii';
            Description = 'AL.16Jan13';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Pack Unit of Measure"; Code[10])
        {
            Caption = 'Jednostka miary opakowania';
            Description = 'AL.28Jan12';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość w opakowaniu';
            DecimalPlaces = 0 : 3;
            Description = 'AL.28Jan12';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Corr. Line Gen.Bus,Post.Gr"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Business Posting Group".Code WHERE("AMC RW" = FILTER(true));
        }
        field(50006; "AMC Corr. Line Dim 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            DataClassification = CustomerContent;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
        }
        field(50007; "AMC Production Date"; Date)
        {
            Caption = 'Production Date';
            Description = 'SBi20Mar2014';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Set Quality Status"; Code[20])
        {
            Caption = 'Przypisz Status Jakości';
            TableRelation = "AMC QC Status";
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Item Test PW"; Boolean)
        {
            Caption = 'Przyjęcie PW Próbek';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Transfer Line"; Boolean)
        {
            Caption = 'Transfer Line';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Test Item Insert"; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Wiersz wprowadzenia próbki';
        }
        field(50012; "AMC Prod. Order No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Prod. Order No.';
        }
        field(50013; "AMC Prod. Order Line No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'AMC Prod. Order Line No.';
        }
        field(50050; "AMC Production Line Qty Remain"; Decimal)
        {
            CalcFormula = Lookup("Prod. Order Component"."Remaining Quantity" WHERE(Status = CONST(Released),
                                                                    "Prod. Order No." = FIELD("AMC Prod. Order No."),
                                                                    "Line No." = FIELD("Prod. Order Comp. Line No.")));
            Caption = 'Production Line Qty Remain';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50051; "AMC Cons. Item Tracking Codes"; Code[50])
        {
            CalcFormula = Lookup("Reservation Entry"."Lot No." WHERE("Source Type" = CONST(5407),
                                                                      "Source Subtype" = CONST(3),
                                                                      "Source ID" = FIELD("AMC Prod. Order No."),
                                                                      "Source Prod. Order Line" = FIELD("AMC Prod. Order Line No."),
                                                                      "Source Ref. No." = FIELD("Prod. Order Comp. Line No.")));
            Caption = 'Kod Nr Partii';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50052; "AMC Cons. Item Tracking Qty"; Decimal)
        {
            CalcFormula = - Sum("Reservation Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                   "Location Code" = FIELD("Location Code"),
                                                                   "Source ID" = FIELD("Journal Template Name"),
                                                                   "Source Batch Name" = FIELD("Journal Batch Name"),
                                                                   "Source Ref. No." = FIELD("Line No.")));
            Caption = 'Il.wg.\Wierszy\Śledz.';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
