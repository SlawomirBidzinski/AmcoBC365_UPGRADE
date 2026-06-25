page 50027 "AMC Cust. Default Bank Acc."
{
    ApplicationArea = All;
    Caption = 'Cust. Default Bank Acc.';
    PageType = ListPart;
    SourceTable = "AMC Default Bank Account";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Bank Account Code"; Rec."Bank Account Code")
                {
                    ToolTip = 'Specifies the value of the Kod Konta Bankowego field.';
                }
                field("Bank Account Currency Code"; Rec."Bank Account Currency Code")
                {
                    ToolTip = 'Specifies the value of the Kod Waluty Konta Bankowego field.';
                }
                field("Bank Account Name"; Rec."Bank Account Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Konta Bankowego field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Kod Waluty field.';
                }
            }
        }
    }
}
