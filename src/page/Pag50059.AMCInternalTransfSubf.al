page 50059 "AMC Internal Transf Subf."
{
    ApplicationArea = All;
    Caption = 'Internal Transf Subf.';
    PageType = ListPart;
    SourceTable = "AMC Whse. Int. Transfer Line";
    DelayedInsert = TRue;
    AutoSplitKey = True;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    Visible = FALSE;
                    ToolTip = 'Specifies the value of the Nr Dokumentu field.', Comment = '%';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Visible = FALSE;
                    ToolTip = 'Specifies the value of the Typ Transakcji field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    Visible = FALSE;
                    ToolTip = 'Specifies the value of the Nr Linii field.', Comment = '%';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Nr Zapasu field.', Comment = '%';
                }
                field("Item Description"; Rec."Item Description")
                {
                    ToolTip = 'Specifies the value of the Opis Zapasu field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Ilość field.', Comment = '%';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies the value of the Jednostka Miary Zapasu field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Kod Lokalizacji field.', Comment = '%';
                }
                field("Bin Code"; Rec."Bin Code")
                {
                    ToolTip = 'Specifies the value of the Kod Pojemnika field.', Comment = '%';
                }
                field("Source Warehouse Qty"; Rec."Source Warehouse Qty")
                {
                    ToolTip = 'Specifies the value of the Ilość Pojemn. Źródł. field.', Comment = '%';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies the value of the Nr Partii field.', Comment = '%';
                }
                field("New Location Code"; Rec."New Location Code")
                {
                    ToolTip = 'Specifies the value of the Nowy Kod Lokalizacji field.', Comment = '%';
                }
                field("New Bin Code"; Rec."New Bin Code")
                {
                    ToolTip = 'Specifies the value of the Nowy Kod Pojemnika field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Data Dokumentu field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Data Księgowania field.', Comment = '%';
                }
                field(Posted; Rec.Posted)
                {
                    ToolTip = 'Specifies the value of the Zaksięgowany field.', Comment = '%';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(BinContent)
            {
                Caption = 'Bin Content';
                ApplicationArea = All;
                RunObject = Page "Bin Contents";
                RunPageView = SORTING("Item No.");
                RunPageLink = "Item No." = FIELD("Item No.");
            }
        }
    }
}
