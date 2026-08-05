page 50050 "AMC Customer Sales Statistics"
{
    ApplicationArea = All;
    Caption = 'Customer Sales Statistics';
    PageType = ListPart;
    SourceTable = Customer;
    Editable = false;
    SourceTableView = WHERE("AMC Sales 5M" = FILTER(<> 0));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                ShowCaption = false;

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the customer. The field is either filled automatically from a defined number series, or you enter the number manually because you have enabled manual number entry in the number-series setup.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ToolTip = 'Specifies an alternate name that you can use to search for a customer.';
                }
                field("AMC Sales Act. Month"; Rec."AMC Sales Act. Month")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż BM field.', Comment = '%';
                }
                field("AMC Sales Prv Month"; Rec."AMC Sales Prv Month")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż BM-1M field.', Comment = '%';
                }
                field("AMC Sales 2Prv Month"; Rec."AMC Sales 2Prv Month")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż BM-2M field.', Comment = '%';
                }
                field("AMC Sales 3Prv Month"; Rec."AMC Sales 3Prv Month")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż BM-3M field.', Comment = '%';
                }
                field("AMC Sales 4Prv Month"; Rec."AMC Sales 4Prv Month")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż BM-4M field.', Comment = '%';
                }
                field("AMC Sales 5M"; Rec."AMC Sales 5M")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż 5M field.', Comment = '%';
                }
            }
            group(Statistics)
            {
                Caption = 'Statistics';
                field("AMC Total Sales CM"; Rec."AMC Total Sales CM")
                {
                    ApplicationArea = All;
                }
                field("AMC Total Sales CM-1M"; Rec."AMC Total Sales CM-1M")
                {
                    ApplicationArea = All;
                }
                field("AMC Total Sales CM-2M"; Rec."AMC Total Sales CM-2M")
                {
                    ApplicationArea = All;
                }
                field("AMC Total Sales CM-3M"; Rec."AMC Total Sales CM-3M")
                {
                    ApplicationArea = All;
                }
                field("AMC Total Sales CM-4M"; Rec."AMC Total Sales CM-4M")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
