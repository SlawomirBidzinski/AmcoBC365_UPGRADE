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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Price Calculation - V16", 'OnBeforePickBestLine', '', false, false)]
    local procedure OnBeforePickBestLine(AmountType: Enum "Price Amount Type"; PriceListLine: Record "Price List Line"; var BestPriceListLine: Record "Price List Line"; var FoundBestLine: Boolean; var IsHandled: Boolean)
    begin
        if (BestPriceListLine."Source Type" = BestPriceListLine."Source Type"::All) and
           (PriceListLine."Source Type" in [PriceListLine."Source Type"::"All Customers",
                                            PriceListLine."Source Type"::"Customer Price Group",
                                            PriceListLine."Source Type"::Customer]) then begin
            BestPriceListLine := PriceListLine;
            FoundBestLine := true;
            IsHandled := true;
        end
        else if (BestPriceListLine."Source Type" = BestPriceListLine."Source Type"::"All Customers") and
           (PriceListLine."Source Type" in [PriceListLine."Source Type"::"Customer Price Group",
                                            PriceListLine."Source Type"::Customer]) then begin
            BestPriceListLine := PriceListLine;
            FoundBestLine := true;
            IsHandled := true;
        end
        else if (BestPriceListLine."Source Type" = BestPriceListLine."Source Type"::"Customer Price Group") and
           (PriceListLine."Source Type" = PriceListLine."Source Type"::Customer) then begin
            BestPriceListLine := PriceListLine;
            FoundBestLine := true;
            IsHandled := true;
        end;
    end;
}
