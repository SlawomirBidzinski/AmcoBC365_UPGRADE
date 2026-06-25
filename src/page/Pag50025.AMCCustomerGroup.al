page 50025 "AMC Customer Group"
{
    ApplicationArea = All;
    Caption = 'AMC Customer Group';
    PageType = List;
    SourceTable = "AMC Customer Group";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Customer Group Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
