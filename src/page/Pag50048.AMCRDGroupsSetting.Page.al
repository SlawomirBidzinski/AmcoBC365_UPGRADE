page 50048 "AMC R&D Groups Setting"
{
    ApplicationArea = All;
    Caption = 'R&D Groups Setting';
    PageType = ListPart;
    SourceTable = "AMC R&D Groups";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("R&D Group Code"; Rec."R&D Group Code")
                {
                    ToolTip = 'Specifies the value of the Kod Grupy R&&D field.';
                    ApplicationArea = All;
                }
                field("R&D Group name"; Rec."R&D Group name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Grupy R&&D field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
