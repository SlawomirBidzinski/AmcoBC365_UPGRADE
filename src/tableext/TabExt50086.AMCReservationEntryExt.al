tableextension 50086 "AMC Reservation EntryExt" extends "Reservation Entry"
{
    fields
    {
        field(50000; "AMC Ext. Lot No."; Code[20])
        {
            Caption = 'Ext. Lot No.'; //TODO 'Zewnętrzny nr partii';
            Description = 'AL.30Dec12';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Production Date"; Date)
        {
            Caption = 'Production Date';
            Description = 'SBi20Mar2014';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Status KJ"; Code[20])
        {
            CalcFormula = lookup("Item Ledger Entry"."AMC QC Status" where ("Item No."=field("Item No."),
                                                                        "Location Code"=field("Location Code"),
                                                                        "Lot No."=field("Lot No."),
                                                                        Positive=const(true),
                                                                        Open=const(true)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Status QC';
        }
        field(50004; "AMC Terminal Scan Qty"; Decimal)
        {
            Caption = 'Terminal Scan Qty';
            DataClassification = CustomerContent;
        }
    }
    
}