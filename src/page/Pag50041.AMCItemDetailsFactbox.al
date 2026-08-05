page 50041 "AMC Item Details Factbox"
{
    ApplicationArea = All;
    Caption = 'Item Details Factbox';
    PageType = CardPart;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            group(General)
            {
                ShowCaption = false;
                field("AMC Items on M.GL"; Rec."AMC Items on M.GL")
                {
                    ApplicationArea = All;
                }
                field("AMC Items on M.SUR"; Rec."AMC Items on M.SUR")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Items on M.SUR (MS)"; Rec."AMC Items on M.SUR (MS)")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Items on M.PROBY"; Rec."AMC Items on M.PROBY")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Items on M.REKLAM"; Rec."AMC Items on M.REKLAM")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Items on M.N.WART"; Rec."AMC Items on M.N.WART")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Items on M.UT"; Rec."AMC Items on M.UT")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Items on KJ"; Rec."AMC Items on KJ")
                {
                    ApplicationArea = All;
                }

            }
        }
    }
}
