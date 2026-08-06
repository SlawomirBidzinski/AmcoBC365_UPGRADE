pageextension 50032 "AMC Purchase Order List Ext" extends "Purchase Order List"
{
    AdditionalSearchTerms = 'Procurement List, Buy Order Overview, Vendor Orders, Order Purchase Log, Acquisition List, Supplier Orders, Buy List, Purchase Log, Supply Order List, Goods Order Overview';
    
    trigger OnOpenPage()
    begin
        Rec.SetRange("AMC PW Transaction", false);
    end;
}
