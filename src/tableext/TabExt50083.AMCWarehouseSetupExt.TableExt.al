tableextension 50083 "AMC Warehouse SetupExt" extends "Warehouse Setup"
{
    fields
    {
        field(50000; "AMC Add. Whse. Rcpt. No.Series"; Code[10])
        {
            Caption = 'Posted Transfer Rcpt. Nos.';
            DataClassification = CustomerContent;
            Description = 'AL11Oct12';
            TableRelation = "No. Series";
        }
        field(50002; "AMC Sales Shipment No.Series"; Code[10])
        {
            Caption = 'Seria num. zaks. wydań magaz. sprzedaży';
            DataClassification = CustomerContent;
            Description = 'SBi20Mar2014';
            TableRelation = "No. Series";
        }
        field(50003; "AMC Trial Shipment No.Series"; Code[10])
        {
            Caption = 'Seria num. zaks. wydań magaz. próbek';
            DataClassification = CustomerContent;
            Description = 'SBi20Mar2014';
            TableRelation = "No. Series";
        }
        field(50004; "AMC Transfer Shipm. No.Series"; Code[10])
        {
            Caption = 'Seria num. zaks. wydań magaz. przesunięcia';
            DataClassification = CustomerContent;
            Description = 'SBi20Mar2014';
            TableRelation = "No. Series";
        }
        field(50005; "AMC Transfer Receipt No.Series"; Code[10])
        {
            Caption = 'Seria num. zaks. przyjęć magaz. przesunięcia';
            DataClassification = CustomerContent;
            Description = 'SBi20Mar2014';
            TableRelation = "No. Series";
        }
        field(50006; "AMC Purchase Receipt No.Series"; Code[10])
        {
            Caption = 'Seria num. zaks. przyjęć magaz. zakupu';
            DataClassification = CustomerContent;
            Description = 'SBi20Mar2014';
            TableRelation = "No. Series";
        }
        field(50007; "AMC Numbering Type"; Option)
        {
            Caption = 'Typ Numeracji';
            DataClassification = CustomerContent;
            Description = 'SBi20Mar2014';
            OptionCaption = 'Standard,Per Trans. Type';
            OptionMembers = Standard,"Per Trans. Type";
        }
        field(50008; "AMC Internal Transf. No.Series"; Code[10])
        {
            Caption = 'Seria num. przesun. wewn.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50009; "AMC PostedInt.Transf.No.Series"; Code[10])
        {
            Caption = 'Seria num. zaks. przesun. wewn.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
    }
    
}