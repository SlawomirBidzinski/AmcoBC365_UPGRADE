tableextension 50063 "AMC Purchases & Payables Setup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50001; "AMC Location Code"; Code[10])
        {
            Caption = 'Location Code';
            DataClassification = CustomerContent;
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(50003; "AMC Purch Planning Flexibility"; Option)
        {
            Caption = 'Planning Flexibility';
            DataClassification = CustomerContent;
            Description = 'AL.29Mar13';
            OptionCaption = 'Unlimited,None';
            OptionMembers = Unlimited,"None";
        }
        field(50004; "AMC PW Receipt Invoiced No."; Code[10])
        {
            Caption = 'Seria num. zaks. PW';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50005; "AMC PW Receipt No."; Code[10])
        {
            Caption = 'Seria num. zam. PW';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50006; "AMC PW Business Posting Group"; Code[10])
        {
            Caption = 'Gł. Gosp Grupa Księg. PW';
            DataClassification = CustomerContent;
            TableRelation = "Gen. Business Posting Group";
        }
        field(50007; "AMC PW QC Posting Status"; Boolean)
        {
            Caption = 'Ustaw status jakości - PW';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC PW QC Status"; Code[20])
        {
            Caption = 'Status Jakości PW';
            DataClassification = CustomerContent;
            TableRelation = "AMC QC Status";
        }
        field(50010; "AMC Item Calculation Nos."; Code[10])
        {
            Caption = 'Item Calculation Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50011; "AMC Item Update Request Nos."; Code[10])
        {
            Caption = 'Item Update Request Nos.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(50012; "AMC Default Item Budget Inst."; Code[20])
        {
            Caption = 'Def. Item Request Budget Instance';
            DataClassification = CustomerContent;
            TableRelation = "AMC Item Budget Instance";
        }
        field(50015; "AMC Item Type for KJ"; Enum "AMC ItemTypeForKJ")
        {
            Caption = 'Item Type for KJ';
            DataClassification = CustomerContent;
        }
        field(50016; "AMC Item KJ Quantity [szt]"; Decimal)
        {
            Caption = 'Item KJ Quantity [szt]';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 3;
        }
        field(50017; "AMC Item KJ Weight [kg]"; Decimal)
        {
            Caption = 'Item KJ Weight [kg]';
            DataClassification = CustomerContent;
            DecimalPlaces = 3 : 3;
        }
        field(50018; "AMC Item KJ Location"; Code[20])
        {
            Caption = 'Item KJ Location';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(50019; "AMC Item KJ Source Location"; Code[20])
        {
            Caption = 'Item KJ Source Location';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(50020; "AMC Use Item KJ Registry"; Boolean)
        {
            Caption = 'Use Item KJ Registry';
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Purchase Order Email"; Text[200])
        {
            Caption = 'Purchase Order Email';
            DataClassification = CustomerContent;
        }
    }


}