page 50034 "AMC Ext. Dimensions"
{
    ApplicationArea = All;
    Caption = 'Ext. Dimensions';
    PageType = ListPart;
    SourceTable = "AMC Item Dimension";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Dimension Code"; Rec."Dimension Code")
                {
                    ToolTip = 'Specifies the value of the Dimension Code field.';
                }
                field("Dimension Text 1"; Rec."Dimension Text 1")
                {
                    ToolTip = 'Specifies the value of the Dimension Text 1 field.';
                }
                field("Dimension Text 2"; Rec."Dimension Text 2")
                {
                    ToolTip = 'Specifies the value of the Dimension Text 2 field.';
                }
                field("Dimension Text 3"; Rec."Dimension Text 3")
                {
                    ToolTip = 'Specifies the value of the Dimension Text 3 field.';
                }
                field("Dimension Value Code"; Rec."Dimension Value Code")
                {
                    ToolTip = 'Specifies the value of the Dimension Value Code field.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.';
                }
            }
        }
    }
}
