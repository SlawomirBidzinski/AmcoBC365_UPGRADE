page 50065 "AMC Item Statistics FactBox"
{
    ApplicationArea = All;
    Caption = 'Item Statistics FactBox';
    PageType = CardPart;
    SourceTable = "Purchase Line";
    Editable = false;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                Caption = 'Item Card';

                trigger OnDrillDown()
                begin
                    ShowDetails();
                end;
            }
            field(ItemWhse; STRSUBSTNO('(%1)', ItemWhseQty(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Whse. Quantity';
            }
            field(MagLoxx; STRSUBSTNO('(%1)', ItemLoxxQty(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Mag. Loxx';
            }
            field(PurchOrder; STRSUBSTNO('(%1)', ItemPurchQty(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Purch. Order';
            }
            field(ProdQty; STRSUBSTNO('(%1)', ItemProdQty(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Prod. Order';
            }
            field(SalesQty; STRSUBSTNO('(%1)', ItemSalesQty(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Prod. Order';
            }
            field(PurchPrice; STRSUBSTNO('(%1)',PurchInfoPaneMgt.CalcNoOfPurchasePrices(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Purch. Price';
            }
            field(Discount; STRSUBSTNO('(%1)',PurchInfoPaneMgt.CalcNoOfPurchLineDisc(Rec)))
            {
                ApplicationArea = All;
                Caption = 'Line Discount';
            }
        }
    }

    local procedure ShowDetails()
    var
        Item: Record Item;
    begin
        if Item.Get(Rec."No.") then
            PAGE.Run(PAGE::"Item Card", Item);
    end;

    local procedure ItemWhseQty(PurchaseLine: Record "Purchase Line"): Decimal
    var
        ItemRec: Record Item;
    begin
        IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
            IF ItemRec.GET(PurchaseLine."No.") THEN BEGIN
                ItemRec.SETRANGE("Location Filter", PurchaseLine."Location Code");
                ItemRec.CALCFIELDS(Inventory);
                EXIT(ROUND(ItemRec.Inventory, 0.1));
            END ELSE
                EXIT(0);
        END ELSE
            EXIT(0);
    end;

    local procedure ItemLoxxQty(PurchaseLine: Record "Purchase Line"): Decimal
    var
        ItemRec: Record Item;
    begin
        IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
            IF ItemRec.GET(PurchaseLine."No.") THEN BEGIN
                ItemRec.SETFILTER("Location Filter", 'M.LOXX');
                ItemRec.CALCFIELDS(Inventory);
                EXIT(ROUND(ItemRec.Inventory, 0.1));
            END ELSE
                EXIT(0);
        END ELSE
            EXIT(0);
    end;

    local procedure ItemSalesQty(PurchaseLine: Record "Purchase Line"): Decimal
    var
        ItemRec: Record Item;
    begin
        IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
            IF ItemRec.GET(PurchaseLine."No.") THEN BEGIN
                ItemRec.CALCFIELDS("Qty. on Sales Order");
                EXIT(ROUND(ItemRec."Qty. on Sales Order", 0.1));
            END ELSE
                EXIT(0);
        END ELSE
            EXIT(0);
    end;

    local procedure ItemProdQty(PurchaseLine: Record "Purchase Line"): Decimal
    var
        ItemRec: Record Item;
    begin
        IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
            IF ItemRec.GET(PurchaseLine."No.") THEN BEGIN
                ItemRec.CALCFIELDS("Qty. on Component Lines");
                EXIT(ROUND(ItemRec."Qty. on Component Lines", 0.1));
            END ELSE
                EXIT(0);
        END ELSE
            EXIT(0);
    end;

    local procedure ItemPurchQty(PurchaseLine: Record "Purchase Line"): Decimal
    var
        ItemRec: Record Item;
    begin
        IF PurchaseLine.Type = PurchaseLine.Type::Item THEN BEGIN
            IF ItemRec.GET(PurchaseLine."No.") THEN BEGIN
                ItemRec.CALCFIELDS("Qty. on Purch. Order");
                EXIT(ROUND(ItemRec."Qty. on Purch. Order", 0.1));
            END ELSE
                EXIT(0);
        END ELSE
            EXIT(0);
    end;

    var
        PurchInfoPaneMgt: Codeunit "Purchases Info-Pane Management";
}
