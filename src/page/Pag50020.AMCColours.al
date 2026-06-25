page 50020 "AMC Colours"
{
    ApplicationArea = All;
    Caption = 'Colours';
    PageType = List;
    SourceTable = "AMC Colour";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(Picture; Rec.Picture)
                {
                    ToolTip = 'Specifies the value of the Picture field.', Comment = '%';
                }
            }
        }
    }
}
