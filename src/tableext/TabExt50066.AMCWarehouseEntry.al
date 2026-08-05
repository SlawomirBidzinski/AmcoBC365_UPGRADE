tableextension 50066 "AMC Warehouse Entry" extends "Warehouse Employee"
{
    fields
    {
        field(50005; "AMC Gen. Bus. Posting Group"; Code[20])
        {
            Caption = 'Gen. Bus. Posting Group';
            TableRelation = "Gen. Business Posting Group".Code WHERE("AMC RW" = FILTER(true));
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." =CONST(1));
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." =CONST(2));
            DataClassification = CustomerContent;
        }
    }

}