pageextension 50027 "AMC Sales Price List" extends "Sales Price List"
{
    layout
    {
        addlast(General)
        {
            field(AMCSerActivePrice; SerActivePrice)
            {
                ApplicationArea = All;
                Caption = 'Active Price Filter';

                trigger OnValidate()
                begin
                    SetDateFilters();
                    CurrPage.Update(false);
                end;
            }
        }
    }

    local procedure SetDateFilters()
    begin
        IF SerActivePrice THEN BEGIN
            Rec.SETFILTER("Starting Date", '%1|..%2', 0D, ActualDate);
            Rec.SETFILTER("Ending Date", '%1|%2..', 0D, ActualDate);
        END ELSE BEGIN
            Rec.SETRANGE("Starting Date");
            Rec.SETRANGE("Ending Date");
        END;

        CurrPage.Lines.Page.SetDateFilters(Rec);
    end;

    var
        Item: Record Item;
        SerActivePrice: Boolean;
        ActualDate: Date;
        ActualPrice: Boolean;
        ShowItemBlocked: Boolean;
        ActualItem: Text;
}
