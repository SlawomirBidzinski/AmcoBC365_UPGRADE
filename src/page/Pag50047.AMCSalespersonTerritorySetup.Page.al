page 50047 "AMC Salesp. Territory Setup"
{
    ApplicationArea = All;
    Caption = 'Salesperson Territory Setup';
    PageType = ListPart;
    SourceTable = "AMC Salesperson Territory";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ToolTip = 'Specifies the value of the Kod Sprzedawcy field.';
                    ApplicationArea = All;
                }
                field("Territory Code"; Rec."Territory Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Kod Regionu field.';
                }
                field("Territory Name"; Rec."Territory Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Regionu field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
