pageextension 50032 "AMC Purchase Order List Ext" extends "Purchase Order List"
{
    trigger OnOpenPage()
    begin
        Rec.SetRange("AMC PW Transaction", false);
    end;
}
