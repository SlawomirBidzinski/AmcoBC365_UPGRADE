page 50021 "AMC Planning Dimensions"
{
    ApplicationArea = All;
    Caption = 'Planning Dimensions';
    PageType = List;
    SourceTable = "AMC Planning Dimension";
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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Default Priority"; Rec."Default Priority")
                {
                    ToolTip = 'Specifies the value of the Default Priority field.', Comment = '%';
                }
                field("Value Prioritisation"; Rec."Value Prioritisation")
                {
                    ToolTip = 'Specifies the value of the Value Prioritisation field.', Comment = '%';
                }
                field("Numeric Value"; Rec."Numeric Value")
                {
                    ToolTip = 'Specifies the value of the Numeric Value field.', Comment = '%';
                }
                field("Fixed Sorting Field"; Rec."Fixed Sorting Field")
                {
                    ToolTip = 'Specifies the value of the Fixed Sorting Field field.', Comment = '%';
                }
            }
        }
    }
}
