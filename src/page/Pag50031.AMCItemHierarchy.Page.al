page 50031 "AMC Hierarchies"
{
    ApplicationArea = All;
    Caption = 'Item Hierarchies';
    PageType = ListPart;
    SourceTable = "AMC Item Hierarchy";
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Hierachy key"; Rec."Hierachy key")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Description - Level 1"; Rec."Description - Level 1")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Description - Level 2"; Rec."Description - Level 2")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Description - Level 3"; Rec."Description - Level 3")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Description - Level 4"; Rec."Description - Level 4")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Description - Level 5"; Rec."Description - Level 5")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("Hierarcy Notes"; Rec."Hierarcy Notes")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
        }
    }
}