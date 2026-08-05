table 50039 "AMC Materials Group"
{
    Caption = 'Materials Group';
    DataClassification = CustomerContent;
    DataCaptionFields = "Group Code", "Group Name";
    DrillDownPageId = "AMC Item Material Group";
    LookupPageId = "AMC Item Material Group";


    fields
    {
        field(1; "Item Type"; Enum "AMC Material Item Type")
        {
            Caption = 'Typ Zapasu';
        }
        field(2; "Group Code"; Code[10])
        {
            Caption = 'Kod Grupy';
        }
        field(3; "Group Name"; Text[100])
        {
            Caption = 'Nazwa Grupy';
        }
        field(4; "New Item Serial No"; Code[20])
        {
            Caption = 'Kod Serii Zapasów';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(Key1; "Item Type", "Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Item Type", "Group Code", "Group Name")
        { }
    }
}
