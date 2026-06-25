page 50022 "AMC PDF Documents"
{
    ApplicationArea = All;
    Caption = 'PDF Documents';
    PageType = List;
    SourceTable = "AMC PDF Document";
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.', Comment = '%';
                }
                field("PDF Document Type"; Rec."PDF Document Type")
                {
                    ToolTip = 'Specifies the value of the PDF Document Type field.', Comment = '%';
                }
                field("PDF Document No."; Rec."PDF Document No.")
                {
                    ToolTip = 'Specifies the value of the PDF Document No. field.', Comment = '%';
                }
                field("PDF File Link"; Rec."PDF File Link")
                {
                    ToolTip = 'Specifies the value of the PDF File Link field.', Comment = '%';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the value of the Customer No. field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Customer Name field.', Comment = '%';
                }
                field("User Name"; Rec."User Name")
                {
                    ToolTip = 'Specifies the value of the User Name field.', Comment = '%';
                }
                field("Generation Date"; Rec."Generation Date")
                {
                    ToolTip = 'Specifies the value of the Generation Date field.', Comment = '%';
                }
                field("Sign to Send"; Rec."Sign to Send")
                {
                    ToolTip = 'Specifies the value of the Sign to Send field.', Comment = '%';
                }
                field("E-mail Address Sent"; Rec."E-mail Address Sent")
                {
                    ToolTip = 'Specifies the value of the E-mail Address Sent field.', Comment = '%';
                }
                field("Date of Last Send"; Rec."Date of Last Send")
                {
                    ToolTip = 'Specifies the value of the Date of Last Send field.', Comment = '%';
                }
                field("Document Duplicate"; Rec."Document Duplicate")
                {
                    ToolTip = 'Specifies the value of the Document Duplicate field.', Comment = '%';
                }
                field("Duplicate Date"; Rec."Duplicate Date")
                {
                    ToolTip = 'Specifies the value of the Duplicate Date field.', Comment = '%';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
            }
        }
    }
}
