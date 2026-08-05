page 50043 "AMC Fabryka Producenta"
{
    ApplicationArea = All;
    Caption = 'Production List';
    PageType = ListPart;
    SourceTable = "AMC Item Production";
    DelayedInsert = true;
    SourceTableView = where("Entry Type" = const(Fabryka));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Fabryka; Rec.Fabryka)
                {
                    ToolTip = 'Specifies the value of the Fabryka field.', Comment = '%';
                }
                field("Nazwa Fabryki"; Rec."Nazwa Fabryki")
                {
                    ToolTip = 'Specifies the value of the Nazwa Fabryki field.', Comment = '%';
                }
            }
        }
    }
}