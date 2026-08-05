tableextension 50065 "AMC Warehouse Shipment Line" extends "Warehouse Shipment Line"
{
    fields
    {
        field(50001; "AMC Item Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("Item Ledger Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                  "Location Code" = FIELD("Location Code")));
            Caption = 'Ilość na Magazynie';
            Editable = false;
        }
        field(50002; "AMC Item Unit of Measure"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Item."Base Unit of Measure" WHERE("No." = FIELD("Item No.")));
            Editable = false;
            Caption = 'Item Unit of Measure';
        }
        field(50036; "AMC Shipment Type"; Enum "AMC Shipment Type WareShptLine")
        {
            Caption = 'Shipment Type';
            DataClassification = CustomerContent;
        }
        field(50037; "AMC Document Line ID"; Integer)
        {
            Caption = 'Identyfikator wiersza';
            Description = 'AL11Oct12';
            DataClassification = CustomerContent;
        }
    }
}