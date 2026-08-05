table 50040 "AMC Material SubGroups"
{
    Caption = 'Material SubGroups';
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Item Material Subgroups";
    LookupPageId = "AMC Item Material Subgroups";

    fields
    {
        field(1; "Item Type"; Enum "AMC Material Item Type")
        {
            Caption = 'Typ Zapasu';
        }
        field(2; "Material Group"; Code[10])
        {
            Caption = 'Kod Grupa Zapasów';
            TableRelation = "AMC Materials Group"."Group Code" where("Item Type" = field("Item Type"));
        }
        field(3; "Material SubGroup"; Code[10])
        {
            Caption = 'Kod Podgrupa Zapasów';
        }
        field(4; "SubGroup Description"; Text[100])
        {
            Caption = 'Nazwa Podgrupy';
        }
    }

    keys
    {
        key(Key1; "Item Type", "Material Group", "Material SubGroup")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Item Type", "Material Group", "Material SubGroup", "SubGroup Description")
        { }
    }
}

