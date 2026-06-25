page 50033 "AMC Country of Origin Sub."
{
    ApplicationArea = All;
    Caption = 'Item Country of Origin';
    PageType = ListPart;
    SourceTable = "AMC Item Country of Origin";
    UsageCategory = Lists;
    CardPageId = "AMC Country of Origin Sub.";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Item Code"; Rec."Item Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                    Visible = false;
                }

                field("Country of Origin Code"; Rec."Country of Origin Code")

                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field("Country Name"; Rec."Country Name")

                {
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }
    }
}