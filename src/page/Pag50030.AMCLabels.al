page 50030 "AMC Labels"
{
    ApplicationArea = All;
    Caption = 'AMC Labels';
    PageType = List;
    SourceTable = "AMC Label";
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
                field("Label File Path"; Rec."Label File Path")
                {
                    ToolTip = 'Specifies the value of the Label File Path field.', Comment = '%';
                }
            }
        }
    }
}
