page 50040 "AMC Item Material Subgroups"
{
    ApplicationArea = All;
    Caption = 'Item Material Subgroups';
    PageType = List;
    SourceTable = "AMC Material SubGroups";
    
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
                field("Material Group"; Rec."Material Group")
                {
                    ToolTip = 'Specifies the value of the Kod Grupa Zapasów field.', Comment = '%';
                }
                field("Material SubGroup"; Rec."Material SubGroup")
                {
                    ToolTip = 'Specifies the value of the Kod Podgrupa Zapasów field.', Comment = '%';
                }
                field("SubGroup Description"; Rec."SubGroup Description")
                {
                    ToolTip = 'Specifies the value of the Nazwa Podgrupy field.', Comment = '%';
                }
            }
        }
    }
}
