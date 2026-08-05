page 50044 "AMC Item Led. Profit Con. Sub."
{
    ApplicationArea = All;
    Caption = 'Item Led. Profit Con. Sub.';
    PageType = ListPart;
    SourceTable = "AMC Profit Item Contr.";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Item Description"; Rec."Item Description")
                {
                    ApplicationArea = All;
                }
                field("Sales Order No."; Rec."Sales Order No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Order Line"; Rec."Sales Order Line")
                {
                    ApplicationArea = All;
                }
                field("Item Leger Entry No."; Rec."Item Leger Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Lot No"; Rec."Lot No")
                {
                    ApplicationArea = All;
                }
                field("Sales Shipment No"; Rec."Sales Shipment No")
                {
                    ApplicationArea = All;
                }
                field("Sales Shipment Line No"; Rec."Sales Shipment Line No")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Quantity Shipment"; Rec."Quantity Shipment")
                {
                    ApplicationArea = All;
                }
                field("Quantity Verified to Invoice"; Rec."Quantity Verified to Invoice")
                {
                    ApplicationArea = All;
                }
                field("Checked for Low Price"; Rec."Checked for Low Price")
                {
                    ApplicationArea = All;
                }
                field("Profit % Level"; Rec."Profit % Level")
                {
                    ApplicationArea = All;
                }
                field("Profit Status"; Rec."Profit Status")
                {
                    ApplicationArea = All;
                }
                field("Profit Check UserId"; Rec."Profit Check UserId")
                {
                    ApplicationArea = All;
                }
                field("Profit Calc Date"; Rec."Profit Calc Date")
                {
                    ApplicationArea = All;
                }
                field("Profit Calc Pers."; Rec."Profit Calc Pers.")
                {
                    ApplicationArea = All;
                }
                field("Authorised User"; Rec."Authorised User")
                {
                    ApplicationArea = All;
                }
                field("Sales Amount"; Rec."Sales Amount")
                {
                    ApplicationArea = All;
                }
                field("Sales Unit Price"; Rec."Sales Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Sales Unit Cost"; Rec."Sales Unit Cost")
                {
                    ApplicationArea = All;
                }
                field("Cost Amout"; Rec."Cost Amout")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
