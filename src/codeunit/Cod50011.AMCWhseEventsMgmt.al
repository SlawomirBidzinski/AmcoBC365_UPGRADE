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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchases Warehouse Mgt.", 'OnPurchLine2ReceiptLineOnAfterUpdateReceiptLine', '', false, false)]
    local procedure OnPurchLine2ReceiptLineOnAfterUpdateReceiptLine(var WarehouseReceiptLine: Record "Warehouse Receipt Line"; var WhseReceiptHeader: Record "Warehouse Receipt Header"; PurchaseLine: Record "Purchase Line")
    var
        Item: Record Item;
        Zone: Record Zone;
        Bin: Record Bin;
        BinType: Record "Bin Type";
    begin
        if not Item.Get(PurchaseLine."No.") then
            exit;

        if Item."Warehouse Class Code" <> '' then begin
            Bin.Reset();
            Bin.SetRange("Location Code", WarehouseReceiptLine."Location Code");
            Bin.SetRange("AMC Receive", true);
            Bin.SetRange("Warehouse Class Code", Item."Warehouse Class Code");
            if Bin.FindFirst() then
                WarehouseReceiptLine."Bin Code" := Bin.Code;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Shipment", 'OnBeforePostedWhseShptHeaderInsert', '', false, false)]
    local procedure OnBeforePostedWhseShptHeaderInsert(var PostedWhseShipmentHeader: Record "Posted Whse. Shipment Header"; WarehouseShipmentHeader: Record "Warehouse Shipment Header")
    begin
        PostedWhseShipmentHeader."AMC Customer Code" := WarehouseShipmentHeader."AMC Customer Code";
        PostedWhseShipmentHeader."AMC Customer Name" := WarehouseShipmentHeader."AMC Customer Name";
        PostedWhseShipmentHeader."AMC Customer Address" := WarehouseShipmentHeader."AMC Customer Address";
        PostedWhseShipmentHeader."AMC Customer post code" := WarehouseShipmentHeader."AMC Customer post code";
        PostedWhseShipmentHeader."AMC Ship-to Code" := WarehouseShipmentHeader."AMC Ship-to Code";
        PostedWhseShipmentHeader."AMC Ship-to Adress" := WarehouseShipmentHeader."AMC Ship-to Adress";
        PostedWhseShipmentHeader."AMC Ship-to City" := WarehouseShipmentHeader."AMC Ship-to City";
        PostedWhseShipmentHeader."AMC Ship-to Post Code" := WarehouseShipmentHeader."AMC Ship-to Post Code";
        PostedWhseShipmentHeader."AMC Ship-to Name" := WarehouseShipmentHeader."AMC Ship-to Name";
        PostedWhseShipmentHeader."AMC Ship-to Contact" := WarehouseShipmentHeader."AMC Ship-to Contact";
        PostedWhseShipmentHeader."AMC Ship-to Phone" := WarehouseShipmentHeader."AMC Ship-to Phone";
        PostedWhseShipmentHeader."AMC Remarks" := WarehouseShipmentHeader."AMC Remarks";
        PostedWhseShipmentHeader."AMC Pallet Quantity" := WarehouseShipmentHeader."AMC Pallet Quantity";
        PostedWhseShipmentHeader."AMC Pallet Item Code" := WarehouseShipmentHeader."AMC Pallet Item Code";
        PostedWhseShipmentHeader."AMC Your Reference" := WarehouseShipmentHeader."AMC Your Reference";
        PostedWhseShipmentHeader."AMC Create by User ID" := WarehouseShipmentHeader."AMC Create by User ID";
        PostedWhseShipmentHeader."AMC Creation Date" := WarehouseShipmentHeader."AMC Creation Date";
        PostedWhseShipmentHeader."AMC RW Transaction" := WarehouseShipmentHeader."AMC RW Transaction";
        PostedWhseShipmentHeader."AMC Shipment Type" := WarehouseShipmentHeader."AMC Shipment Type";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Whse.-Post Receipt", 'OnBeforePostedWhseRcptHeaderInsert', '', false, false)]
    local procedure OnBeforePostedWhseRcptHeaderInsert(var PostedWhseReceiptHeader: Record "Posted Whse. Receipt Header"; WarehouseReceiptHeader: Record "Warehouse Receipt Header")
    begin
        PostedWhseReceiptHeader."AMC FirmType" := WarehouseReceiptHeader."AMC FirmType";
        PostedWhseReceiptHeader."AMC Vendor Code" := WarehouseReceiptHeader."AMC Vendor Code";
        PostedWhseReceiptHeader."AMC Vendor Name" := WarehouseReceiptHeader."AMC Vendor Name";
        PostedWhseReceiptHeader."AMC Vendor Address" := WarehouseReceiptHeader."AMC Vendor Address";
        PostedWhseReceiptHeader."AMC Vendor post code" := WarehouseReceiptHeader."AMC Vendor post code";
        PostedWhseReceiptHeader."AMC Vendor City" := WarehouseReceiptHeader."AMC Vendor City";
        PostedWhseReceiptHeader."AMC Receipt Date" := WarehouseReceiptHeader."AMC Receipt Date";
        PostedWhseReceiptHeader."AMC Create by IdUser" := WarehouseReceiptHeader."AMC Create by IdUser";
        PostedWhseReceiptHeader."AMC Creation Date" := WarehouseReceiptHeader."AMC Creation Date";
        PostedWhseReceiptHeader."AMC Receipt Type" := WarehouseReceiptHeader."AMC Receipt Type";
        PostedWhseReceiptHeader."AMC Notes" := WarehouseReceiptHeader."AMC Notes";
        PostedWhseReceiptHeader."AMC Document ID" := WarehouseReceiptHeader."AMC Document ID";
        PostedWhseReceiptHeader."AMC Customer Search Name" := WarehouseReceiptHeader."AMC Customer Search Name";
        PostedWhseReceiptHeader."AMC PW Transaction" := WarehouseReceiptHeader."AMC PW Transaction";
    end;
}
