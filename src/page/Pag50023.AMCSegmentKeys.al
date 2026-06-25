page 50023 "AMC Segment Keys"
{
    ApplicationArea = All;
    Caption = 'AMC Segment Keys';
    PageType = List;
    SourceTable = "AMC Segment Key";
    UsageCategory = Administration;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer Segment Key"; Rec."Customer Segment Key")
                {
                    ToolTip = 'Specifies the value of the Customer Segment Key field.', Comment = '%';
                }
                field("Customer Segment Name"; Rec."Customer Segment Name")
                {
                    ToolTip = 'Specifies the value of the Customer Segment Name field.', Comment = '%';
                }
                field("Customer BU Name"; Rec."Customer BU Name")
                {
                    ToolTip = 'Specifies the value of the Customer BU Name field.', Comment = '%';
                }
            }
        }
    }
}
