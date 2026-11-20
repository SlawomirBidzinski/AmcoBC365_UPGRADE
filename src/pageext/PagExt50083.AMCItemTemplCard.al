pageextension 50083 "AMC Item Templ. Card" extends "Item Templ. Card"
{
    layout
    {
        addlast(General)
        {
            field("AMC Sample Type"; Rec."AMC Sample Type")
            {
                ApplicationArea = All;
            }
            field("AMC Location Code"; Rec."AMC Location Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
