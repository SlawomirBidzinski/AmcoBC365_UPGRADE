page 50053 "AMC Item Budget Instance"
{
    ApplicationArea = All;
    Caption = 'Item Budget Instance';
    PageType = List;
    SourceTable = "AMC Item Budget Instance";
    UsageCategory = Lists;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item Budget Instance"; Rec."Item Budget Instance")
                {
                    ToolTip = 'Specifies the value of the Item Budget Instance field.', Comment = '%';
                }
                field("Item Budget Name"; Rec."Item Budget Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Instancji Zapasu field.', Comment = '%';
                }
                field("Typ Wyceny"; Rec."Typ Wyceny")
                {
                    ToolTip = 'Specifies the value of the Calculation Type field.', Comment = '%';
                }
                field("Default Instance"; Rec."Default Instance")
                {
                    ToolTip = 'Specifies the value of the Domyślna Instacja Budżetowa field.', Comment = '%';
                }
                field("Sprzedaż Data Od"; Rec."Sprzedaż Data Od")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż Data Od field.', Comment = '%';
                }
                field("Sprzedaż Data Do"; Rec."Sprzedaż Data Do")
                {
                    ToolTip = 'Specifies the value of the Sprzedaż Data Do field.', Comment = '%';
                }
                field("Date From"; Rec."Date From")
                {
                    ToolTip = 'Specifies the value of the Date From field.', Comment = '%';
                }
                field("Curency Rate EUR"; Rec."Curency Rate EUR")
                {
                    ToolTip = 'Specifies the value of the Curency Rate EUR field.', Comment = '%';
                }
                field("Curency Rate USD"; Rec."Curency Rate USD")
                {
                    ToolTip = 'Specifies the value of the Curency Rate USD field.', Comment = '%';
                }
                field("Curency Rate GBP"; Rec."Curency Rate GBP")
                {
                    ToolTip = 'Specifies the value of the Curency Rate GBP field.', Comment = '%';
                }
                field("Curency Rate CHF"; Rec."Curency Rate CHF")
                {
                    ToolTip = 'Specifies the value of the Curency Rate CHF field.', Comment = '%';
                }
                field(Notice; Rec.Notice)
                {
                    ToolTip = 'Specifies the value of the Uwagi field.', Comment = '%';
                }
            }
        }
    }
}
