codeunit 50021 "AMC Events Mgmt."
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
}
