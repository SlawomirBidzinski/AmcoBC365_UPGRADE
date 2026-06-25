page 50024 "AMC Customer Industrial Keys"
{
    ApplicationArea = All;
    Caption = 'AMC Customer Industrial Keys';
    PageType = List;
    SourceTable = "AMC Customer Industrial Key";
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
                field(L2; Rec.L2)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field(L3; Rec.L3)
                {
                    ToolTip = 'Specifies the value of the L3 field.', Comment = '%';
                }
            }
        }
    }
}
