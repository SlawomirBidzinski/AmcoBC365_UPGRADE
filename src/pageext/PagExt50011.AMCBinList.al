pageextension 50011 "AMC Bin List" extends "Bin List"
{
    layout
    {
        addafter(Description)
        {
            field("AMC Ship"; Rec."AMC Ship")
            {
                ApplicationArea = All;
            }
        }
    }
}
