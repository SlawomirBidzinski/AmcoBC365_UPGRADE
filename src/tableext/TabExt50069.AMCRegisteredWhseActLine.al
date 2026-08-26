tableextension 50069 "AMC Registered Whse. Act. Line" extends "Registered Whse. Activity Line"
{
    fields
    {
        field(50008; "AMC Item for KJ"; Boolean)
        {
            Caption = 'Item for KJ';
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Item Qty for KJ"; Decimal)
        {
            Caption = 'Item Qty for KJ';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Item Location for KJ"; Code[20])
        {
            Caption = 'Item Location for KJ';
            TableRelation = Location;
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Item KJ Qty registered"; Decimal)
        {
            BlankZero = true;
            Caption = 'Item KJ Qty registered';
            DecimalPlaces = 0 : 3;
            Editable = false;
            DataClassification = CustomerContent;
        }
    }
    
}