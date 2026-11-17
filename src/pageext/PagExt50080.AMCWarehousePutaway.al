pageextension 50080 "AMC Warehouse Put-away" extends "Warehouse Put-away"
{
    layout
    {
        addafter("Sorting Method")
        {
            field("AMC Order No"; Rec."AMC Order No")
            {
                ApplicationArea = All;
            }
            field(VendName; VendName)
            {
                ApplicationArea = All;
                Caption = 'Vendor Name';
                Editable = false;
            }
            field(SearchName; SearchName)
            {
                ApplicationArea = All;
                Caption = 'Vendor Search Name';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        PurchHdr: Record "Purchase Header";
    begin
        VendName := '';
        SearchName := '';
        
        Rec.CalcFields("AMC Order No");
        if PurchHdr.Get(PurchHdr."Document Type"::Order, Rec."AMC Order No") then begin
            PurchHdr.CalcFields("AMC Vendor Search Name");
            VendName := PurchHdr."Buy-from Vendor Name";
            SearchName := PurchHdr."AMC Vendor Search Name";
        end;
    end;

    var
        VendName: Text;
        SearchName: Text;
}
