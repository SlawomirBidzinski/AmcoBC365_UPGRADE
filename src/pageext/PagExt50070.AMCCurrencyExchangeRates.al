pageextension 50070 "AMC Currency Exchange Rates" extends "Currency Exchange Rates"
{
    layout
    {
        addlast(Control1)
        {
            field("AMC Sales Exch. Rate"; Rec."AMC Sales Exch. Rate")
            {
                ApplicationArea = All;
                DecimalPlaces = 4 : 4;
            }
            field("AMC Purch. Exch. Rate"; Rec."AMC Purch. Exch. Rate")
            {
                ApplicationArea = All;
                DecimalPlaces = 4 : 4;
            }
        }
    }
}