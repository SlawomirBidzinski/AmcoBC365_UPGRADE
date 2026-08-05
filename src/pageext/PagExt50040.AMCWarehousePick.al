pageextension 50040 "AMC Warehouse Pick" extends "Warehouse Pick"
{
    layout
    {
        addafter("No.")
        {
            field(AMCCurrentLocationCode; CurrentLocationCode)
            {
                ApplicationArea = All;
                Caption = 'Curr. Location Code';
                TableRelation = Location;
                Editable = false;
            }
        }
        addafter("Breakbulk Filter")
        {
            field("AMC Order No"; Rec."AMC Order No")
            {
                ApplicationArea = All;
            }
            field(AMCSearchName; SearchName)
            {
                ApplicationArea = All;
                Caption = 'Search Name';
                Editable = false;
            }
            field("AMC Zone Code"; Rec."AMC Zone Code")
            {
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        SalesHeader: Record "Sales Header";
        CustomerRec:Record Customer;
    begin
        SearchName := '';

        Rec.SETRANGE("No.");
        CurrentLocationCode := Rec."Location Code";

        Rec.CALCFIELDS("AMC Order No");
        IF Rec."AMC Order No" <> '' THEN
            IF SalesHeader.GET(SalesHeader."Document Type"::Order, Rec."AMC Order No") THEN
                IF CustomerRec.GET(SalesHeader."Sell-to Customer No.") THEN
                    SearchName := CustomerRec."Search Name";
    end;

    var
        SearchName: Code[50];
        CurrentLocationCode: Code[20];
}
