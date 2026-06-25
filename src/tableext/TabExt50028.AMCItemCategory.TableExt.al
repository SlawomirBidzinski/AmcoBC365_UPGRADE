tableextension 50028 "AMC Item Category" extends "Item Category"
{
    fields
    {
        field(50000; "AMC Item Tracking Code"; Code[10])
        {
            Caption = 'Item Tracking Code';
            Description = 'AL.04Dec12';
            TableRelation = "Item Tracking Code";
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Lot Nos."; Code[10])
        {
            Caption = 'Lot Nos.';
            Description = 'AL.04Dec12';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50002; "AMC EAN-13 Barcode Nos."; Code[20])
        {
            Caption = 'EAN-13 Barcode Nos.'; //TODO 'Seria numeracji kodów kreskowych (EAN-13)';
            Description = 'AL.04Dec12';
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Item Label Code"; Code[20])
        {
            Caption = 'Item Label Code'; //TODO 'Kod etykiety zapasu';
            Description = 'AL.13Dec12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Lot Label Code"; Code[20])
        {
            Caption = 'Lot Label Code'; //TODO 'Kod etykiety partii';
            Description = 'AL.13Dec12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Pack Label Code"; Code[20])
        {
            Caption = 'Pack Label Code'; //TODO 'Kod etykiety zbiorczej';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Planning Location"; Code[10])
        {
            Caption = 'Planning Location'; //TODO 'Lokalizacja planowania';
            Description = 'AL.04Mar13';
            TableRelation = Location;
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Reordering Policy"; Option)
        {
            Caption = 'Reordering Policy';
            Description = 'AL.04Mar13';
            OptionCaption = ' ,Fixed Reorder Qty.,Maximum Qty.,Order,Lot-for-Lot';
            OptionMembers = " ","Fixed Reorder Qty.","Maximum Qty.","Order","Lot-for-Lot";
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Replenishment System"; Option)
        {
            Caption = 'Replenishment System';
            Description = 'AL.04Mar13';
            OptionCaption = 'Purchase,Prod. Order, ';
            OptionMembers = Purchase,"Prod. Order"," ";
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Item Label Code Add."; Code[20])
        {
            Caption = 'Item Label Code Add.'; //TODO 'Kod etykiety zapasu dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Lot Label Code Add."; Code[20])
        {
            Caption = 'Lot Label Code Add.'; //TODO 'Kod etykiety partii dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Pack Label Code Add."; Code[20])
        {
            Caption = 'Pack Label Code Add.'; //TODO 'Kod etykiety zbiorczej dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
    }
}
