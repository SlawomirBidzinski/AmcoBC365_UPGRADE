page 50058 "AMC Internal Transfer Card"
{
    ApplicationArea = All;
    Caption = 'Internal Transfer Card';
    PageType = Card;
    SourceTable = "AMC Whse. Int. Transfer Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Nr Dokumentu field.', Comment = '%';
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE(false);
                    end;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;
                    ToolTip = 'Specifies the value of the Typ Transakcji field.', Comment = '%';
                }
                field("Document Status"; Rec."Document Status")
                {
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;
                    ToolTip = 'Specifies the value of the Status Dokumentu field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;
                    ToolTip = 'Specifies the value of the Data Dokumentu field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;
                    ToolTip = 'Specifies the value of the Data Księgowania field.', Comment = '%';
                }
                group("AMC Ustawienia Lokalizacji")
                {
                    field("Location Code"; Rec."Location Code")
                    {
                        Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                    }
                    field("New Location Code"; Rec."New Location Code")
                    {
                        Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        ToolTip = 'Specifies the value of the Nowy Kod Lokalizacji field.', Comment = '%';
                    }
                    field("New Bin Code"; Rec."New Bin Code")
                    {
                        Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        ToolTip = 'Specifies the value of the Nowy Kod Pojemnika field.', Comment = '%';
                    }
                }
                group("AMC Szczegóły Ksiegowania")
                {
                    ShowCaption = false;

                    field(Posted; Rec.Posted)
                    {
                        //Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Posted field.', Comment = '%';
                    }
                    field("Posted Document No."; Rec."Posted Document No.")
                    {
                        //Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Nr Dok. Zaksięgowanego field.', Comment = '%';
                    }
                }
                group("AMC Szczegóły Dokumentu")
                {
                    ShowCaption = false;

                    field("Login ID"; Rec."Login ID")
                    {
                        //Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        Editable = false;
                        ToolTip = 'Specifies the value of the ID Użytkownika field.', Comment = '%';
                    }
                    field("Creating Date"; Rec."Creating Date")
                    {
                        //Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Data Utworzenia field.', Comment = '%';
                    }
                    field("Creating Time"; Rec."Creating Time")
                    {
                        //Editable = Rec."Document Status" = Rec."Document Status"::Open;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Godzina Utworzenia field.', Comment = '%';
                    }
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    Editable = Rec."Document Status" = Rec."Document Status"::Open;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.', Comment = '%';
                }
            }
            part(Lines; "AMC Internal Transf Subf.")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = FIELD("Document No."), "Transaction Type" = field("Transaction Type");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Release)
            {
                Caption = 'Release';
                ApplicationArea = All;

                trigger OnAction()
                Begin
                    CASE rec."Document Status" OF
                        rec."Document Status"::Open:
                            rec."Document Status" := rec."Document Status"::Release;
                    END;
                End;
            }
            action(Open)
            {
                Caption = 'Open';
                ApplicationArea = All;

                trigger OnAction()
                Begin
                    CASE rec."Document Status" OF
                        rec."Document Status"::Release, rec."Document Status"::Posted:
                            rec."Document Status" := rec."Document Status"::Open
                    END;
                End;
            }
            action(Post)
            {
                Caption = 'Post';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    IF CONFIRM(Text005, FALSE) THEN
                        Rec.PostDocument();
                end;
            }
        }
        area(Navigation)
        {
            action(Navigate)
            {
                Caption = 'Navigate';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    Rec.Navigate();
                end;
            }
        }
        area(Reporting)
        {
            action(Transfer)
            {
                Caption = 'Transfer Report';
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CLEAR(WhseReport);
                    WhseReport.SetDocNo(Rec."Document No.");
                    WhseReport.RUNMODAL();
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Transaction Type" := Rec."Transaction Type"::"Internal Transfer";
    end;

    var
        WhseSetup: Record "Warehouse Setup";
        WhseReport: Report "AMC Internal Transfer Process";
        Text001: Label 'Przed Księgowaniem należy Zwolnić Dokument';
        Text004: Label 'Błąd generowania Zaksięgowanego Numeru Dokumentu';
        Text005: Label 'Czy zaksięgować wewnętrzne przesunięcie?';
}
