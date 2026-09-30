codeunit 50014 "AMC Sales Price Events Mgmt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales Line - Price", 'OnAfterSetPrice', '', false, false)]
    local procedure OnAfterSetPrice(var SalesLine: Record "Sales Line"; PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; var SalesHeader: Record "Sales Header")
    begin
        IF PriceListLine."Unit Price" <> 0 THEN
            CASE PriceListLine."Source Type" OF
                PriceListLine."Source Type"::Customer:
                    SalesLine."AMC Unit Price Source" := SalesLine."AMC Unit Price Source"::"Customer Price";
                PriceListLine."Source Type"::"All Customers":
                    SalesLine."AMC Unit Price Source" := SalesLine."AMC Unit Price Source"::"All Customers";
                PriceListLine."Source Type"::"Customer Price Group":
                    SalesLine."AMC Unit Price Source" := SalesLine."AMC Unit Price Source"::"Group Price";
            END;

        SalesLine."AMC Unit Price Date From" := PriceListLine."Starting Date";
        SalesLine."AMC Price Currency" := PriceListLine."AMC Conversion Currency Code";
        SalesLine."AMC Currency Unit Price" := PriceListLine."Unit Price";

        if (PriceListLine."AMC Currency Base Price") and (SalesHeader."AMC Price Currency" = PriceListLine."AMC Conversion Currency Code") then begin
            SalesHeader.TestField("AMC Price Exch. Rate");

            SalesLine."Unit Price" *= SalesHeader."AMC Price Exch. Rate";
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
