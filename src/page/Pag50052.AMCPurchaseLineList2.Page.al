page 50052 "AMC Purchase Line List 2"
{
    ApplicationArea = All;
    Caption = 'Purchase Line List';
    PageType = List;
    SourceTable = "Purchase Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Buy-from Vendor No."; Rec."Buy-from Vendor No.")
                {
                    ToolTip = 'Specifies the name of the vendor who delivered the items.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number.';
                }
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the line type.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the blanket purchase order.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code for the location where the items on the line will be located.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the code of the currency of the amounts on the purchase line.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the quantity of the purchase order line.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ToolTip = 'Specifies the name of the item or resource''s unit of measure, such as piece or hour.';
                }
                field("Outstanding Quantity"; Rec."Outstanding Quantity")
                {
                    ToolTip = 'Specifies how many units on the order line have not yet been received.';
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ToolTip = 'Specifies how many item units on this line have been reserved.';
                }
                field("AMC Rqst Qty to Recpt"; Rec."AMC Rqst Qty to Recpt")
                {
                    ToolTip = 'Specifies the value of the Rqst Qty to Recpt field.';
                }
                field("AMC Receipt Doc No"; Rec."AMC Receipt Doc No")
                {
                    ToolTip = 'Specifies the value of the Nr Przyjęcia Magazynowego field.';
                }
                field("AMC Receipt Qty"; Rec."AMC Receipt Qty")
                {
                    ToolTip = 'Specifies the value of the Ilość na Przyjęciu field.';
                }
                field("Expected Receipt Date"; Rec."Expected Receipt Date")
                {
                    ToolTip = 'Specifies the date you expect the items to be available in your warehouse.';
                }
                field("Planned Receipt Date"; Rec."Planned Receipt Date")
                {
                    ToolTip = 'Specifies the date when the item is planned to arrive in inventory. Forward calculation: planned receipt date = order date + vendor lead time (per the vendor calendar and rounded to the next working day in first the vendor calendar and then the location calendar). If no vendor calendar exists, then: planned receipt date = order date + vendor lead time (per the location calendar). Backward calculation: order date = planned receipt date - vendor lead time (per the vendor calendar and rounded to the previous working day in first the vendor calendar and then the location calendar). If no vendor calendar exists, then: order date = planned receipt date - vendor lead time (per the location calendar).';
                }
                field("Requested Receipt Date"; Rec."Requested Receipt Date")
                {
                    ToolTip = 'Specifies the date that you want the vendor to deliver to the ship-to address. The value in the field is used to calculate the latest date you can order the items to have them delivered on the requested receipt date. If you do not need delivery on a specific date, you can leave the field blank.';
                }
                field("Promised Receipt Date"; Rec."Promised Receipt Date")
                {
                    ToolTip = 'Specifies the date that the vendor has promised to deliver the order.';
                }
                field("AMC Last Receipt No"; Rec."AMC Last Receipt No")
                {
                    ToolTip = 'Specifies the value of the Nr Przyjęcia Zakupu field.';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ToolTip = 'Specifies how many units of the item on the line have been posted as received.';
                }
                field("Lead Time Calculation"; Rec."Lead Time Calculation")
                {
                    ToolTip = 'Specifies a date formula for the amount of time it takes to replenish the item.';
                }
                field("Receipt No."; Rec."Receipt No.")
                {
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ToolTip = 'Specifies the value of the Vendor Item No. field.';
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    ToolTip = 'Specifies the value of the Sales Order No. field.';
                }
            }
        }
    }

    procedure SetInitForm(CustCode: Code[20]; OrderNo: Code[20]; ItemCode: Code[20])
    begin

    end;
}
