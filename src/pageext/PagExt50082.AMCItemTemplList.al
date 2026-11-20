pageextension 50082 "AMC Item Templ. List" extends "Item Templ. List"
{
    layout
    {
        addlast(Control1)
        {
            field("AMC Sample Type"; Rec."AMC Sample Type")
            {
                ApplicationArea = All;
            }
        }
    }
}
