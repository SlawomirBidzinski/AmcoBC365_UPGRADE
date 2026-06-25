page 50039 "AMC Item Material Group"
{
    ApplicationArea = All;
    Caption = 'Item Material Group';
    PageType = List;
    SourceTable = "AMC Materials Group";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item Type"; Rec."Item Type")
                {
                    ToolTip = 'Specifies the value of the Typ Zapasu field.', Comment = '%';
                }
                field("Group Code"; Rec."Group Code")
                {
                    ToolTip = 'Specifies the value of the Kod Grupy field.', Comment = '%';
                }
                field("Group Name"; Rec."Group Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Grupy field.', Comment = '%';
                }
                field("New Item Serial No"; Rec."New Item Serial No")
                {
                    ToolTip = 'Specifies the value of the Kod Serii Zapasów field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ItemSubgroups)
            {
                Caption = 'Item Subgroups';
                ApplicationArea = All;
                RunObject = page "AMC Item Material SubGroups";
                RunPageLink = "Item Type" = field("Item Type"), "Material Group" = field("Group Code");

            }
        }
    }
}
