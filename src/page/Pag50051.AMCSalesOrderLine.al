page 50051 "AMC Sales Order Line"
{
    ApplicationArea = All;
    Caption = 'Sales Order Line';
    PageType = ListPart;
    SourceTable = "Sales Line";
    Editable = false;
    SourceTableView = WHERE("Outstanding Quantity" = FILTER(<> 0));

    layout
    {
        area(Content)

        {
            repeater(General)

            {
                ShowCaption = false;
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the record.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the sales order line.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ToolTip = 'Specifies how many units on the order line have not yet been shipped.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Sell-to Customer No."; Rec."Sell-to Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer.';
                }
                field("AMC Customer Search Name"; Rec."AMC Customer Search Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Kontrahenta field.', Comment = '%';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.', Comment = '%';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the item or service on the line.';
                }
                field("AMC Document Date"; Rec."AMC Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.', Comment = '%';
                }
                field("AMC Delivery Date"; Rec."AMC Delivery Date")
                {
                    ToolTip = 'Specifies the value of the Delivery Date field.', Comment = '%';
                }
            }
        }
    }
}
