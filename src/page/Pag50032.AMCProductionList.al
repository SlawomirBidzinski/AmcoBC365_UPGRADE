page 50032 "AMC Production List"
{
    ApplicationArea = All;
    Caption = 'Production List';
    PageType = ListPart;
    SourceTable = "AMC Item Production";
    DelayedInsert = true;
    SourceTableView = where("Entry Type" = const(Producent));


    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Producent; Rec.Producent)
                {
                    ToolTip = 'Specifies the value of the Producent field.', Comment = '%';
                }
                field("Nazwa Producenta"; Rec."Nazwa Producenta")
                {
                    ToolTip = 'Specifies the value of the Nazwa Producenta field.', Comment = '%';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Currency Code field.', Comment = '%';
                }
                field("Fill zero sign in Item Code"; Rec."Fill zero sign in Item Code")
                {
                    ToolTip = 'Specifies the value of the Nazwa Producenta field.', Comment = '%';
                }
                field("Item Code Leght"; Rec."Item Code Leght")
                {
                    ToolTip = 'Specifies the value of the Fill zero sign in Item Code Leght field.', Comment = '%';
                }
                field("Country Code"; Rec."Country Code")
                {
                    ToolTip = 'Specifies the value of the Fill zero sign in Item Code field.', Comment = '%';
                }
            }
        }
    }

}