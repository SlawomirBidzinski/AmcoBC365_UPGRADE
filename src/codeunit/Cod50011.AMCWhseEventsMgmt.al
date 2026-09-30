codeunit 50011 "AMC Whse. Events Mgmt."
{
    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeWhseShptHeaderInsert', '', false, false)]
    local procedure OnBeforeWhseShptHeaderInsert(var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; var WarehouseRequest: Record "Warehouse Request"; SalesLine: Record "Sales Line"; TransferLine: Record "Transfer Line"; SalesHeader: Record "Sales Header")
    begin
        case WarehouseRequest."Source Document" of
            WarehouseRequest."Source Document"::"Sales Order":
                begin
                    WarehouseShipmentHeader."AMC RW Transaction" := SalesHeader."AMC RW Transaction";
                    WarehouseShipmentHeader."AMC Shipment Type" := WarehouseShipmentHeader."AMC Shipment Type"::Sales;
                    WarehouseShipmentHeader.Validate("AMC Customer Code", SalesHeader."Sell-to Customer No.");
                end;
            WarehouseRequest."Source Document"::"Sales Return Order":
                begin
                    WarehouseShipmentHeader."AMC RW Transaction" := SalesHeader."AMC RW Transaction";
                    WarehouseShipmentHeader."AMC Shipment Type" := WarehouseShipmentHeader."AMC Shipment Type"::"Purchase Return";
                    WarehouseShipmentHeader.Validate("AMC Customer Code", SalesHeader."Sell-to Customer No.");
                end;
            WarehouseRequest."Source Document"::"Inbound Transfer", WarehouseRequest."Source Document"::"Outbound Transfer":
                WarehouseShipmentHeader."AMC Shipment Type" := WarehouseShipmentHeader."AMC Shipment Type"::Transfer;
        end;
    end;

    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnBeforeWhseReceiptHeaderInsert', '', false, false)]
    local procedure OnBeforeWhseReceiptHeaderInsert(var WarehouseReceiptHeader: Record "Warehouse Receipt Header"; var WarehouseRequest: Record "Warehouse Request")
    var
        PurchHdr: Record "Purchase Header";
        SalesHdr: Record "Sales Header";
    begin
        case WarehouseRequest."Source Document" of
            WarehouseRequest."Source Document"::"Purchase Order":
                begin
                    PurchHdr.Get(PurchHdr."Document Type"::Order, WarehouseRequest."Source No.");
                    WarehouseReceiptHeader."AMC PW Transaction" := PurchHdr."AMC PW Transaction";
                    WarehouseReceiptHeader."AMC Receipt Type" := WarehouseReceiptHeader."AMC Receipt Type"::Purchase;
                    WarehouseReceiptHeader.Validate("AMC Vendor Code", PurchHdr."Buy-from Vendor No.");
                end;
            WarehouseRequest."Source Document"::"Sales Return Order":
                begin
                    SalesHdr.Get(SalesHdr."Document Type"::"Return Order", WarehouseRequest."Source No.");
                    WarehouseReceiptHeader."AMC PW Transaction" := SalesHdr."AMC RW Transaction";
                    WarehouseReceiptHeader."AMC Receipt Type" := WarehouseReceiptHeader."AMC Receipt Type"::"Sale Return";
                end;
            WarehouseRequest."Source Document"::"Inbound Transfer", WarehouseRequest."Source Document"::"Outbound Transfer":
                WarehouseReceiptHeader."AMC Receipt Type" := WarehouseReceiptHeader."AMC Receipt Type"::Transfer;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Warehouse Mgt.", 'OnBeforeCreateShptLineFromSalesLine', '', false, false)]
    local procedure OnBeforeCreateShptLineFromSalesLine(var WarehouseShipmentLine: Record "Warehouse Shipment Line"; WarehouseShipmentHeader: Record "Warehouse Shipment Header"; SalesLine: Record "Sales Line"; SalesHeader: Record "Sales Header")
    var
        Item: Record Item;
        Zone: Record Zone;
        Bin: Record Bin;
        BinType: Record "Bin Type";
    begin
        if not Item.Get(SalesLine."No.") then
            exit;

        if Item."Warehouse Class Code" <> '' then begin
            Bin.Reset();
            Bin.SetRange("Location Code", WarehouseShipmentLine."Location Code");
            Bin.SetRange("AMC Ship", true);
            Bin.SetRange("Warehouse Class Code", Item."Warehouse Class Code");
            if Bin.FindFirst() then
                WarehouseShipmentLine."Bin Code" := Bin.Code;
        end;
    end;
}
