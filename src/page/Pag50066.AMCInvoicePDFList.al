page 50066 "AMC Invoice PDF List"
{
    ApplicationArea = All;
    Caption = 'Invoice PDF List';
    PageType = ListPart;
    SourceTable = "AMC PDF Document";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ToolTip = 'Specifies the value of the Nr Zapisu field.', Comment = '%';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ToolTip = 'Specifies the value of the Typ Dokumentu field.', Comment = '%';
                }
                field("Document No"; Rec."Document No")
                {
                    ToolTip = 'Specifies the value of the Nr Dokumentu field.', Comment = '%';
                }
                field("PDF Document Type"; Rec."PDF Document Type")
                {
                    ToolTip = 'Specifies the value of the Typ Dokumentu PDF field.', Comment = '%';
                }
                field("PDF Document No"; Rec."PDF Document No")
                {
                    ToolTip = 'Specifies the value of the Nr Dokumentu PDF field.', Comment = '%';
                }
                field("PDF File Link"; Rec."PDF File Link")
                {
                    ToolTip = 'Specifies the value of the Plik dokumentu PDF field.', Comment = '%';
                }
                field("Customer Code"; Rec."Customer Code")
                {
                    ToolTip = 'Specifies the value of the Nr Nabywcy field.', Comment = '%';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Nabywcy field.', Comment = '%';
                }
                field("Generation Date"; Rec."Generation Date")
                {
                    ToolTip = 'Specifies the value of the Data Generowania PDF field.', Comment = '%';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the ID Użytkownika field.', Comment = '%';
                }
                field("Date of Last Send"; Rec."Date of Last Send")
                {
                    ToolTip = 'Specifies the value of the Data ostatniej wysyłki field.', Comment = '%';
                }
                field("Sign to Send"; Rec."Sign to Send")
                {
                    ToolTip = 'Specifies the value of the Oznacz do wysłania field.', Comment = '%';
                }
                field("Document Duplicate"; Rec."Document Duplicate")
                {
                    ApplicationArea = All;
                }
                field("Duplicate Date"; Rec."Duplicate Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
