page 50060 "AMC Internal Transfer List"
{
    ApplicationArea = All;
    Caption = 'Internal Transfer List';
    PageType = List;
    SourceTable = "AMC Whse. Int. Transfer Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "AMC Internal Transfer Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Nr Dokumentu field.', Comment = '%';
                }
                field("Posted Document No."; Rec."Posted Document No.")
                {
                    ToolTip = 'Specifies the value of the Nr Dok. Zaksięgowanego field.', Comment = '%';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ToolTip = 'Specifies the value of the Status Dokumentu field.', Comment = '%';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Data Dokumentu field.', Comment = '%';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Data Księgowania field.', Comment = '%';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the value of the Location Code field.', Comment = '%';
                }
                field("New Location Code"; Rec."New Location Code")
                {
                    ToolTip = 'Specifies the value of the Nowy Kod Lokalizacji field.', Comment = '%';
                }
                field("New Bin Code"; Rec."New Bin Code")
                {
                    ToolTip = 'Specifies the value of the Nowy Kod Pojemnika field.', Comment = '%';
                }
                field("Login ID"; Rec."Login ID")
                {
                    ToolTip = 'Specifies the value of the ID Użytkownika field.', Comment = '%';
                }
                field("Creating Date"; Rec."Creating Date")
                {
                    ToolTip = 'Specifies the value of the Data Utworzenia field.', Comment = '%';
                }
                field("Creating Time"; Rec."Creating Time")
                {
                    ToolTip = 'Specifies the value of the Godzina Utworzenia field.', Comment = '%';
                }
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

    procedure GetSelectionFilter(): Code[80]
    var
        WhseMgmnHead: Record "AMC Whse. Int. Transfer Header";
        FirstDoc: Code[30];
        LastDoc: Code[30];
        SelectionFilter: Code[250];
        DocCount: Integer;
        More: Boolean;
    begin
        CurrPage.SETSELECTIONFILTER(WhseMgmnHead);
        DocCount := WhseMgmnHead.COUNT;
        IF DocCount > 0 THEN BEGIN
            WhseMgmnHead.FIND('-');
            WHILE DocCount > 0 DO BEGIN
                DocCount := DocCount - 1;
                WhseMgmnHead.MARKEDONLY(FALSE);
                FirstDoc := WhseMgmnHead."Document No.";
                LastDoc := FirstDoc;
                More := (DocCount > 0);
                WHILE More DO
                    IF WhseMgmnHead.NEXT() = 0 THEN
                        More := FALSE
                    ELSE
                        IF NOT WhseMgmnHead.MARK() THEN
                            More := FALSE
                        ELSE BEGIN
                            LastDoc := WhseMgmnHead."Document No.";
                            DocCount := DocCount - 1;
                            IF DocCount = 0 THEN
                                More := FALSE;
                        END;
                IF SelectionFilter <> '' THEN
                    SelectionFilter := SelectionFilter + '|';
                IF FirstDoc = LastDoc THEN
                    SelectionFilter := SelectionFilter + FirstDoc
                ELSE
                    SelectionFilter := SelectionFilter + FirstDoc + '..' + LastDoc;
                IF DocCount > 0 THEN BEGIN
                    WhseMgmnHead.MARKEDONLY(TRUE);
                    WhseMgmnHead.NEXT();
                END;
            END;
        END;
        EXIT(SelectionFilter);
    end;

    var
        WhseReport: Report "AMC Internal Transfer Process";
        Text005: Label 'Czy zaksięgować wewnętrzne przesunięcie?';
}
