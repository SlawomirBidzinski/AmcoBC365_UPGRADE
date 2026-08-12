page 50057 "AMC Item Calculation Subf"
{
    ApplicationArea = All;
    Caption = 'Item Calculation Subf';
    PageType = ListPart;
    SourceTable = "AMC Item Calculation Line";
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Calculation No"; Rec."Calculation No")
                {
                    ToolTip = 'Specifies the value of the Calculation No field.', Comment = '%';
                }
                field("Calculation Line No"; Rec."Calculation Line No")
                {
                    ToolTip = 'Specifies the value of the Calculation Line No field.', Comment = '%';
                }
                field("Item Budget Instance"; Rec."Item Budget Instance")
                {
                    ToolTip = 'Specifies the value of the Instancja Budżetu Zapasu field.', Comment = '%';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the value of the Calculate Type field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Calculation Type"; Rec."Calculation Type")
                {
                    ToolTip = 'Specifies the value of the Calculation Type field.', Comment = '%';
                }
                field("Component Code"; Rec."Component Code")
                {
                    ToolTip = 'Specifies the value of the Component Code field.', Comment = '%';
                }
                field("Component Name"; Rec."Component Name")
                {
                    ToolTip = 'Specifies the value of the Component Name field.', Comment = '%';
                }
                field("Component Type"; Rec."Component Type")
                {
                    ToolTip = 'Specifies the value of the Typ Zapasu field.', Comment = '%';
                }
                field("Component Code Of Measure"; Rec."Component Code Of Measure")
                {
                    ToolTip = 'Specifies the value of the Component Code Of Measure field.', Comment = '%';
                }
                field("Component BOM Source"; Rec."Component BOM Source")
                {
                    ToolTip = 'Specifies the value of the Component BOM Source field.', Comment = '%';
                }
                field("Sub BOM"; Rec."Sub BOM")
                {
                    ToolTip = 'Specifies the value of the Składnik BOM field.', Comment = '%';
                }
                field("BOM Level"; Rec."BOM Level")
                {
                    ToolTip = 'Specifies the value of the Poziom BOMu field.', Comment = '%';
                }
                field("Qty per Source"; Rec."Qty per Source")
                {
                    ToolTip = 'Specifies the value of the Ilość źródła field.', Comment = '%';
                }
                field("Component IFF Flaver"; Rec."Component IFF Flaver")
                {
                    ToolTip = 'Specifies the value of the Komponent Aromat IFF field.', Comment = '%';
                }
                field("Component IFF Flaver Qty"; Rec."Component IFF Flaver Qty")
                {
                    ToolTip = 'Specifies the value of the Ilość Komp. Aromatu IFF field.', Comment = '%';
                }
                field("Weight Item"; Rec."Weight Item")
                {
                    ToolTip = 'Specifies the value of the Zapas Wagowy field.', Comment = '%';
                }
                field("Zablokowany Cennik Zapasu"; Rec."Zablokowany Cennik Zapasu")
                {
                    ToolTip = 'Specifies the value of the Zablok. Cennik dla Zapasu field.', Comment = '%';
                }
                field("Brak Ceny dla Zapasów"; Rec."Brak Ceny dla Zapasów")
                {
                    ToolTip = 'Specifies the value of the Brak Ceny dla Zapasu field.', Comment = '%';
                }
                field("Brak Zapasu w Cenniku"; Rec."Brak Zapasu w Cenniku")
                {
                    ToolTip = 'Specifies the value of the Brak Zapasu w Cenniku field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Ilość field.', Comment = '%';
                }
                field("Calculation Unit Cost"; Rec."Calculation Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Koszt Jedn. Wyceny field.', Comment = '%';
                }
                field("Additional Cost"; Rec."Additional Cost")
                {
                    ToolTip = 'Specifies the value of the Koszty Dodatkowe field.', Comment = '%';
                }
                field("Manulal Insert Cost"; Rec."Manulal Insert Cost")
                {
                    ToolTip = 'Specifies the value of the Koszt Modyfikowany field.', Comment = '%';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Kosz Jedn. zap. PLN field.', Comment = '%';
                }
                field("Last Unit Cost"; Rec."Last Unit Cost")
                {
                    ToolTip = 'Specifies the value of the Ostatni Koszt Jedn. PLN field.', Comment = '%';
                }
                field("Budget Unit Cost LCY"; Rec."Budget Unit Cost LCY")
                {
                    ToolTip = 'Specifies the value of the Razem Koszt Budżetowy PLN field.', Comment = '%';
                }
                field("Budget Unit Addit. LCY"; Rec."Budget Unit Addit. LCY")
                {
                    ToolTip = 'Specifies the value of the Razem Dodtk. Koszt Budżet. PLN field.', Comment = '%';
                }
                field("Budget Unit Cost Total"; Rec."Budget Unit Cost Total")
                {
                    ToolTip = 'Specifies the value of the Razem Koszt Budżetowy field.', Comment = '%';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ToolTip = 'Specifies the value of the Kod Waluty field.', Comment = '%';
                }
                field("Currecny Exchange"; Rec."Currecny Exchange")
                {
                    ToolTip = 'Specifies the value of the Kurs wymiany field.', Comment = '%';
                }
                field("Budget Unit Price"; Rec."Budget Unit Price")
                {
                    ToolTip = 'Specifies the value of the Koszt Budżetowy Walut. field.', Comment = '%';
                }
                field("Budget Unit Addit."; Rec."Budget Unit Addit.")
                {
                    ToolTip = 'Specifies the value of the Dodatkowy Koszt Budż field.', Comment = '%';
                }
                field("Component Amout"; Rec."Component Amout")
                {
                    ToolTip = 'Specifies the value of the Kwota Komponentu field.', Comment = '%';
                }
                field("Total Component Amount"; Rec."Total Component Amount")
                {
                    ToolTip = 'Specifies the value of the Razem kwota komponentu field.', Comment = '%';
                }
                field("Type of Income"; Rec."Type of Income")
                {
                    ToolTip = 'Specifies the value of the Typ Przyjęcia field.', Comment = '%';
                }
                field("Income Date"; Rec."Income Date")
                {
                    ToolTip = 'Specifies the value of the Data Przyjęcia field.', Comment = '%';
                }
                field("Vendor Code"; Rec."Vendor Code")
                {
                    ToolTip = 'Specifies the value of the Kod Dostawcy field.', Comment = '%';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ToolTip = 'Specifies the value of the Nazwa Dostawcy field.', Comment = '%';
                }
            }
        }
    }
}
