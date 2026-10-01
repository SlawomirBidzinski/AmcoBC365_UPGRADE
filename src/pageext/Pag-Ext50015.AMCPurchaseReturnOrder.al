pageextension 50015 "AMC Purchase Return Order" extends "Purchase Return Order"
{
    layout
    {
        addafter("No.")
        {
            field("AMC Contract Date"; Rec."AMC Contract Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
