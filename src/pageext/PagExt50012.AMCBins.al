pageextension 50012 "AMC Bins" extends Bins
{
    layout
    {
        addafter(Description)
        {
            field("AMC Ship"; Rec."AMC Ship")
            {
                ApplicationArea = All;
            }
            field("AMC Receive"; Rec."AMC Receive")
            {
                ApplicationArea = All;
            }
        }
    }
}
