page 50046 "AMC Sales Comment Subpage"
{
    ApplicationArea = All;
    Caption = 'Sales Comment Subpage';
    PageType = ListPart;
    SourceTable = "Sales Comment Line";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies a code for the comment.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the date the comment was created.';
                }
                field(Comment; Rec.Comment)
                {
                    ToolTip = 'Specifies the comment itself.';
                }
            }
        }
    }
}
