page 50055 "AMC Item Calculation Card"
{
    ApplicationArea = All;
    Caption = 'Item Calculation Card';
    PageType = Card;
    SourceTable = "AMC Item Calculation";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Calculation No"; Rec."Calculation No")
                {
                    ToolTip = 'Specifies the value of the Nr Wyceny field.', Comment = '%';
                }
                field("Item Budget Instance"; Rec."Item Budget Instance")
                {
                    ToolTip = 'Specifies the value of the Item Budget Instance field.', Comment = '%';
                }
                field("Source Type"; Rec."Source Type")
                {
                    ToolTip = 'Specifies the value of the Calculate Type field.', Comment = '%';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field("Code Description"; Rec."Code Description")
                {
                    ToolTip = 'Specifies the value of the Code Description field.', Comment = '%';
                }
                field("Qty of Components"; Rec."Qty of Components")
                {
                    ToolTip = 'Specifies the value of the Ilość Komponentów field.', Comment = '%';
                }
                field("Include Packages"; Rec."Include Packages")
                {
                    ToolTip = 'Specifies the value of the Zawiera Opakowania field.', Comment = '%';
                }
                field("Item Blocked"; Rec."Item Blocked")
                {
                    ToolTip = 'Specifies the value of the Zapas Zablokowany field.', Comment = '%';
                }
                field("Init Notes"; Rec."Init Notes")
                {
                    ToolTip = 'Specifies the value of the Uwagi Zlecającego field.', Comment = '%';
                }
                field("Calculation Notes"; Rec."Calculation Notes")
                {
                    ToolTip = 'Specifies the value of the Uwagi do Wyceny field.', Comment = '%';
                }
                field("Notes Additn."; Rec."Notes Additn.")
                {
                    ToolTip = 'Specifies the value of the Uwagi Dodatkowe field.', Comment = '%';
                }
                field("Init Source"; Rec."Init Source")
                {
                    ToolTip = 'Specifies the value of the Źródło Utworzenia field.', Comment = '%';
                }
                field("Calculation Status"; Rec."Calculation Status")
                {
                    ToolTip = 'Specifies the value of the Status wyceny field.', Comment = '%';
                }
                field("Calculatio Date Time"; Rec."Calculatio Date Time")
                {
                    ToolTip = 'Specifies the value of the Data Zatwierdzenia field.', Comment = '%';
                }
                field("Calculation Type"; Rec."Calculation Type")
                {
                    ToolTip = 'Specifies the value of the Calculation Type field.', Comment = '%';
                }
                field("Includes IFF Flavor"; Rec."Includes IFF Flavor")
                {
                    ToolTip = 'Specifies the value of the Zawiera Aromat IFF field.', Comment = '%';
                }
                field("Total Calc. Qty Items"; Rec."Total Calc. Qty Items")
                {
                    ToolTip = 'Specifies the value of the Razem Ilość Zapasów field.', Comment = '%';
                }
                field("Maksimum BOM Level"; Rec."Maksimum BOM Level")
                {
                    ToolTip = 'Specifies the value of the Maksymalny poziom BOM field.', Comment = '%';
                }
                field("Optimalisation Code"; Rec."Optimalisation Code")
                {
                    ToolTip = 'Specifies the value of the Kod Zgł. Optymalizacji field.', Comment = '%';
                }
                field("Currency USD Rate"; Rec."Currency USD Rate")
                {
                    ToolTip = 'Specifies the value of the Kurs Wymiany USD field.', Comment = '%';
                }
                field("Currency GBP Rate"; Rec."Currency GBP Rate")
                {
                    ToolTip = 'Specifies the value of the Kurs Wymiany GBP field.', Comment = '%';
                }
                field("Currency EUR Rate"; Rec."Currency EUR Rate")
                {
                    ToolTip = 'Specifies the value of the Kurs Wymiany EUR field.', Comment = '%';
                }
                field("Currency CHF Rate"; Rec."Currency CHF Rate")
                {
                    ToolTip = 'Specifies the value of the Kurs Wymiany CHF field.', Comment = '%';
                }
                field("Total Actual Value"; Rec."Total Actual Value")
                {
                    ToolTip = 'Specifies the value of the Razem Wartość Bieżąca field.', Comment = '%';
                }
                field("Total Cal. Value"; Rec."Total Cal. Value")
                {
                    ToolTip = 'Specifies the value of the Razem Wartość Kalkulacji field.', Comment = '%';
                }
                field("Calculatin Init"; Rec."Calculatin Init")
                {
                    ToolTip = 'Specifies the value of the Inicjowanie Zapytania field.', Comment = '%';
                }
                field("Init UserID"; Rec."Init UserID")
                {
                    ToolTip = 'Specifies the value of the Użytkownik zapytania field.', Comment = '%';
                }
                field("Init Date Time"; Rec."Init Date Time")
                {
                    ToolTip = 'Specifies the value of the Data zapytania wyceny field.', Comment = '%';
                }
                field("Calculation Close"; Rec."Calculation Close")
                {
                    ToolTip = 'Specifies the value of the Zatwierdzenie Wyceny field.', Comment = '%';
                }
                field("Calculation UserID"; Rec."Calculation UserID")
                {
                    ToolTip = 'Specifies the value of the Użytkownik Zatwierdzający field.', Comment = '%';
                }
            }
            part(Lines; "AMC Item Calculation Subf")
            {
                ApplicationArea = All;
                SubPageLink = "Calculation No" = FIELD("Calculation No");
            }
            group(Details)
            {
                Caption = 'Details';

                field("Last Calculation Time"; Rec."Last Calculation Time")
                {
                    ToolTip = 'Specifies the value of the Data ostat. kalkulacji field.', Comment = '%';
                }
                field("Last Calculation UserID"; Rec."Last Calculation UserID")
                {
                    ToolTip = 'Specifies the value of the Użytkownik ostat. kalkulacji field.', Comment = '%';
                }
                field("Rozwinięcie BOMów"; Rec."Rozwinięcie BOMów")
                {
                    ToolTip = 'Specifies the value of the Rozwinięcie BOMów field.', Comment = '%';
                }
                field("Calculation Date"; Rec."Calculation Date")
                {
                    ToolTip = 'Specifies the value of the Data Dokumentu field.', Comment = '%';
                }
                field("Calculation Entry"; Rec."Calculation Entry")
                {
                    ToolTip = 'Specifies the value of the Nr wyceny field.', Comment = '%';
                }
                field("Brak Ceny dla Zapasów"; Rec."Brak Ceny dla Zapasów")
                {
                    ToolTip = 'Specifies the value of the Brak Ceny dla Zapasu field.', Comment = '%';
                }
                field("Generowanie Zbiorcze"; Rec."Generowanie Zbiorcze")
                {
                    ToolTip = 'Specifies the value of the Generowanie Zbiorcze field.', Comment = '%';
                }
            }
        }
    }
}
