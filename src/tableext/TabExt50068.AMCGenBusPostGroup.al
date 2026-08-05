tableextension 50068 "AMC Gen. Bus. Post. Group" extends "Gen. Business Posting Group"
{
    fields
    {
        field(50001; "AMC Shortcut Dim. 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Shortcut Dim. 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
            DataClassification = CustomerContent;
        }
        field(50003; "AMC RW"; Boolean)
        {
            Caption = 'RW';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Foreign Transaction"; Boolean)
        {
            Caption = 'Foreign Transaction';
            DataClassification = CustomerContent;
        }
    }
}
