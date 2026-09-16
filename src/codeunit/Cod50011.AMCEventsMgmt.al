codeunit 50011 "AMC Events Mgmt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterSetPrice', '', false, false)]
    local procedure OnAfterSetPrice(var SalesLine: Record "Sales Line"; PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; var SalesHeader: Record "Sales Header")
    begin
        IF PriceListLine."Unit Price" <> 0 THEN BEGIN
            CASE PriceListLine."Source Type" OF
                PriceListLine."Source Type"::Customer:
                    SalesLine."AMC Unit Price Source" := SalesLine."AMC Unit Price Source"::"Customer Price";
                PriceListLine."Source Type"::"All Customers":
                    SalesLine."AMC Unit Price Source" := SalesLine."AMC Unit Price Source"::"All Customers";
                PriceListLine."Source Type"::"Customer Price Group":
                    SalesLine."AMC Unit Price Source" := SalesLine."AMC Unit Price Source"::"Group Price";
            END;
        END;
        SalesLine."AMC Unit Price Date From" := PriceListLine."Starting Date";
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeWhseShptHeaderInsert', '', false, false)]
    local procedure OnBeforeWhseShptHeaderInsert(var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; var WarehouseRequest: Record "Warehouse Request"; SalesLine: Record "Sales Line"; TransferLine: Record "Transfer Line"; SalesHeader: Record "Sales Header")
    begin
        WarehouseShipmentHeader."AMC RW Transaction" := SalesHeader."AMC RW Transaction";
        //WarehouseShipmentHeader."AMC Shipment Type" := 
        WarehouseShipmentHeader.Validate("AMC Customer Code", SalesHeader."Sell-to Customer No.");
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeWhseReceiptHeaderInsert', '', false, false)]
    local procedure OnBeforeWhseReceiptHeaderInsert(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; var WarehouseRequest: Record "Warehouse Request")
    var
        PurchHdr: Record "Purchase Header";
    begin
        if WarehouseRequest."Source Document" <> WarehouseRequest."Source Document"::"Purchase Order" then
            exit;

        if not PurchHdr.Get(PurchHdr."Document Type"::Order, WarehouseRequest."Source No.") then
            exit;

        WarehouseReceiptHeader."AMC PW Transaction" := PurchHdr."AMC PW Transaction";
        //WarehouseReceiptHeader."AMC Receipt Type" := 
        WarehouseReceiptHeader.Validate("AMC Vendor Code", PurchHdr."Buy-from Vendor No.");
    end;
}
