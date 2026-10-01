codeunit 50015 "AMC Purch. Price Events Mgmt."
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Purchase Line - Price", 'OnAfterSetPrice', '', false, false)]
    local procedure OnAfterSetPrice(var PurchaseLine: Record "Purchase Line"; PriceListLine: Record "Price List Line"; AmountType: Enum "Price Amount Type"; CurrPriceType: Enum "Price Type"; var PurchaseHeader: Record "Purchase Header")
    begin
    end;
}
