tableextension 50060 "AMC Purch. Cr. Memo Line" extends "Purch. Cr. Memo Line"
{
    fields
    {
        field(50000; "AMC Main Unit of Measure"; Code[10])
        {
            CalcFormula = lookup(Item."Base Unit of Measure" where("No."=field("No.")));
            Caption = 'Podstawowa Jedn. Miary';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "AMC Rqst Qty to Recpt"; Decimal)
        {
            BlankZero = true;
            Caption = 'Rqst Qty to Recpt';
            DecimalPlaces = 0:5;
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
            DecimalPlaces = 0:5;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Qty in Base Unit"; Decimal)
        {
            Caption = 'Ilość Jedn Podst';
            DecimalPlaces = 0:5;
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Direct UnitCost (BaseUnit)"; Decimal)
        {
            Caption = 'Bezp. Koszt Jedn. Podst.';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Init Quantity"; Decimal)
        {
            Caption = 'Init Quantity';
            DecimalPlaces = 0:5;
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Rqst QtytoRecpt (BaseUnit)"; Decimal)
        {
            Caption = 'Plan Il. do Przyjęcia (Pods. Jedn)';
            DecimalPlaces = 0:5;
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
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Unit Cost Curr Exch. Rate"; Decimal)
        {
            Caption = 'Kurs Waluty dla Ceny Jedn (Wal)';
            DecimalPlaces = 0:4;
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Item Reserved"; Decimal)
        {
            CalcFormula = sum("Reservation Entry"."Quantity (Base)" where ("Location Code"=field("Location Code"),
                                                                           "Item No."=field("No."),
                                                                           "Source Type"=const(37),
                                                                           "Quantity (Base)"=filter(<0)));
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
    }
    
}