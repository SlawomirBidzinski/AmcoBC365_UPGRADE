pageextension 50078 "AMC Warehouse Picks" extends "Warehouse Picks"
{
    layout
    {
        addafter("Source No.")
        {
            field("AMC Order No"; Rec."AMC Order No")
            {
                ApplicationArea = All;
            }
            field(CustName; CustName)
            {
                ApplicationArea = All;
                Caption = 'Customer Name';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        SalesHdr: Record "Sales Header";
    begin
        CustName := '';
        Rec.CalcFields("AMC Order No");
        if SalesHdr.Get(SalesHdr."Document Type"::Order, Rec."AMC Order No") then
            CustName := SalesHdr."Sell-to Customer Name";
    end;

    var
        CustName: Text;
}
