pageextension 50081 "AMC Location Card" extends "Location Card"
{
    layout
    {
        addlast(General)
        {
            field("AMC Quality Item Test Loc."; Rec."AMC Quality Item Test Loc.")
            {
                ApplicationArea = All;
            }
        }
        addlast(Bins)
        {
            field("Default Bin Code"; Rec."Default Bin Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
