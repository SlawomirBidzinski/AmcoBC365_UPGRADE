pageextension 50026 "AMC Price List Lines" extends "Price List Lines"
{
    layout
    {
        modify("SourceNo")
        {
            Style = Favorable;
        }
        modify(StartingDate)
        {
            StyleExpr = ActualItem;
            Visible = true;
        }
        modify(EndingDate)
        {
            StyleExpr = ActualItem;
            Visible = true;
        }
        modify("Unit Price")
        {
            StyleExpr = ActualItem;
        }
        addafter(SourceNo)
        {
            field("AMC Priority";Rec."AMC Priority")
            {
                ApplicationArea = All;
            }
            field("AMC Item Description"; Rec."AMC Item Description")
            {
                ApplicationArea = All;
                Style = Favorable;
            }
            field("AMC Item Long Description"; Rec."AMC Item Long Description")
            {
                ApplicationArea = All;
                Style = Favorable;
            }
            field(AMCItemBlocked; ShowItemBlocked)
            {
                ApplicationArea = All;
                Caption = 'Item Blocked';
                Editable = false;
            }
        }
        addlast(Control1)
        {
            field("AMC Currency Base Price"; Rec."AMC Currency Base Price")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Name"; Rec."AMC Customer Name")
            {
                ApplicationArea = All;
            }
            field("AMC Customer Quantiy"; Rec."AMC Customer Quantity")
            {
                ApplicationArea = All;
            }
            field("AMC User ID"; Rec."AMC User ID")
            {
                ApplicationArea = All;
            }
            field("AMCLast Change Date Time"; Rec."AMCLast Change Date Time")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        IF (((Rec."Starting Date" = 0D) OR (WorkDate() >= Rec."Starting Date")) AND ((Rec."Ending Date" = 0D) OR (WorkDate() <= Rec."Ending Date"))) THEN
            ActualPrice := TRUE
        ELSE
            ActualPrice := FALSE;

        IF Item.GET(Rec."Source No.") THEN
            ShowItemBlocked := Item.Blocked;

        IF (((Rec."Starting Date" = 0D) OR (WorkDate() >= Rec."Starting Date")) AND
           ((Rec."Ending Date" = 0D) OR (WorkDate() <= Rec."Ending Date"))) THEN
            ActualItem := 'Favorable'
        else
            ActualItem := 'Unfavorable';
    end;

    procedure SetDateFilters(PriceListHeader: Record "Price List Header")
    begin
        Rec.SETFILTER("Starting Date", PriceListHeader.GetFilter("Starting Date"));
        Rec.SETFILTER("Ending Date", PriceListHeader.GetFilter("Ending Date"));
    end;

    var
        Item: Record Item;
        SerActivePrice: Boolean;
        ActualPrice: Boolean;
        ShowItemBlocked: Boolean;
        ActualItem: Text;
}
