page 50026 "AMC Cust. Sales. Relations"
{
    ApplicationArea = All;
    Caption = 'Customer Salesperson Relation';
    PageType = ListPart;
    SourceTable = "AMC Cust. Salesperson Relation";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                }
                field("Default Salesperson"; Rec."Default Salesperson")
                {
                    ApplicationArea = All;
                }
                field(Notes; Rec.Notes)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
