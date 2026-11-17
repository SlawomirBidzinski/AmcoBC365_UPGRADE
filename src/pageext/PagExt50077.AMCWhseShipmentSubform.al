pageextension 50077 "AMC Whse. Shipment Subform" extends "Whse. Shipment Subform"
{
    layout
    {
        addafter("Location Code")
        {
            field(InventoryQty; InventoryQty)
            {
                Caption = 'Inventory';
                ApplicationArea = All;
                Editable = false;
            }
        }
        modify("Location Code")
        {
            Visible = true;
        }
    }

    trigger OnAfterGetRecord()
    var
        Item: Record Item;
    begin
        InventoryQty := 0;

        if not Item.Get(Rec."Item No.") then
            exit;

        Item.SetRange("Location Filter", Rec."Location Code");
        Item.CalcFields(Inventory);
        InventoryQty := Item.Inventory;
    end;

    var
        InventoryQty: Decimal;
}
