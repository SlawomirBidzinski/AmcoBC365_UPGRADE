table 50053 "AMC Whse. Int. Transfer Header"
{
    Caption = 'Whse. Int. Transfer Header';
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Internal Transfer List";
    LookupPageId = "AMC Internal Transfer List";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Nr Dokumentu';
        }
        field(2; "Transaction Type"; Option)
        {
            Caption = 'Typ Transakcji';
            OptionCaption = ' ,Internal Transfer';
            OptionMembers = " ","Internal Transfer";
        }
        field(3; "Document Date"; Date)
        {
            Caption = 'Data Dokumentu';
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Data Księgowania';
        }
        field(5; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(6; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
        field(7; "Document Status"; Option)
        {
            Caption = 'Status Dokumentu';
            OptionCaption = 'Open,Release,Posted,Closed';
            OptionMembers = Open,Release,Posted,Closed;

            trigger OnValidate()
            begin
                IF "Document Status" = "Document Status"::Release THEN BEGIN
                    TESTFIELD("Document Date");
                    TESTFIELD("Posting Date");
                    TESTFIELD("Transaction Type");
                END;

                IF (Rec."Document Status" = "Document Status"::Open) THEN BEGIN
                    WhseIntTransferLine.RESET();
                    WhseIntTransferLine.SETRANGE("Document No.", "Document No.");
                    IF WhseIntTransferLine.FINDFIRST() THEN
                        ERROR(Text005);
                END;

                IF (xRec."Document Status" = "Document Status"::Posted) AND
                   (Rec."Document Status" = "Document Status"::Open) OR
                   (Rec."Document Status" = "Document Status"::Release) THEN BEGIN

                    WhseIntTransferLine.RESET();
                    WhseIntTransferLine.SETRANGE("Document No.", "Document No.");
                    WhseIntTransferLine.SETRANGE(Posted, TRUE);
                    IF WhseIntTransferLine.FINDFIRST() THEN
                        ERROR(Text004);
                END;
            end;
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Location Code';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(9; "Bin Code"; Code[20])
        {
            Caption = 'Kod Pojemnika';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("Location Code"));
        }
        field(10; "New Location Code"; Code[10])
        {
            Caption = 'Nowy Kod Lokalizacji';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(11; "New Bin Code"; Code[20])
        {
            Caption = 'Nowy Kod Pojemnika';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("New Location Code"));
        }
        field(12; Posted; Boolean)
        {
            Caption = 'Posted';
        }
        field(90; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        }
        field(100; "Creating Date"; Date)
        {
            Caption = 'Data Utworzenia';
        }
        field(101; "Creating Time"; Time)
        {
            Caption = 'Godzina Utworzenia';
        }
        field(102; "Login ID"; Code[50])
        {
            Caption = 'ID Użytkownika';
        }
        field(103; "No. Series"; Code[20])
        {
            Caption = 'Nr Serii';
        }
        field(104; "Post No. Series"; Code[20])
        {
            Caption = 'Nr Serii Zaksięgowanej';
        }
        field(105; "Posted Document No."; Code[20])
        {
            Caption = 'Nr Dok. Zaksięgowanego';
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                Rec.ShowDocDim();
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        IF "Document Status" IN ["Document Status"::Release, "Document Status"::Posted, "Document Status"::Closed] THEN
            ERROR(Text001);
    end;

    trigger OnInsert()
    begin
        WhseSetup.GET();

        IF "Document No." = '' THEN BEGIN
            TestNoSeries();
            NoSeriesMgt.InitSeries(GetNoSeriesCode(), xRec."No. Series", "Document Date", "Document No.", "No. Series");
        END;

        InitRecord();
    end;

    trigger OnModify()
    begin
        IF xRec."Document Status" IN ["Document Status"::Closed] THEN
            ERROR(Text002);
    end;

    var
        WhseIntTransferLine: Record "AMC Whse. Int. Transfer Line";
        WhseSetup: Record "Warehouse Setup";
        NoSeriesMgt: Codeunit "No. Series";
        DimMgt: Codeunit DimensionManagement;
        Text004: Label 'Nie można otworzyć nagłówka w przypadku zaksięgowanych linii';
        Text005: Label 'Nie można otworzyć nagłówka w przypadku wprowadzonych linii';
        Text001: Label 'Nie można usunąć nagłówka dokumentu';
        Text002: Label 'Nie można modyfikować zamkniętego dokumentu';
        Text007: Label 'You may have changed a dimension.\\Do you want to update the lines?';

    procedure Navigate()
    var
        NavigateForm: Page Navigate;
    begin
        IF ("Posted Document No." <> '') AND
         ("Document Status" = "Document Status"::Posted) OR
         ("Document Status" = "Document Status"::Closed) THEN BEGIN
            NavigateForm.SetDoc("Posting Date", "Posted Document No.");
            NavigateForm.RUN();
        END;
    end;

    procedure InitRecord()
    begin
        "Document Type" := "Document Type"::Order;
        "Creating Date" := WORKDATE();
        "Document Date" := WORKDATE();
        "Posting Date" := WORKDATE();
        "Creating Time" := TIME;
        "Login ID" := USERID;

        WhseSetup.GET();
        "No. Series" := WhseSetup."AMC Internal Transf. No.Series";
        "Post No. Series" := WhseSetup."AMC PostedInt.Transf.No.Series";
    end;

    procedure AssistEdit(OldWhseMagHeader: Record "AMC Whse. Int. Transfer Header"): Boolean
    begin
        WhseSetup.GET();
        TestNoSeries();

        IF NoSeriesMgt.SelectSeries(GetNoSeriesCode(), OldWhseMagHeader."No. Series", "No. Series") THEN BEGIN
            WhseSetup.GET();
            TestNoSeries();
            NoSeriesMgt.SetSeries("Document No.");
            EXIT(TRUE);
        END;
    end;

    local procedure TestNoSeries(): Boolean
    begin
        WhseSetup.TESTFIELD("AMC Internal Transf. No.Series");
    end;

    local procedure GetNoSeriesCode(): Code[10]
    begin
        EXIT(WhseSetup."AMC Internal Transf. No.Series");
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := Rec."Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");

        if OldDimSetID <> Rec."Dimension Set ID" then begin
            Modify();
            if TransferLinesExist() then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    procedure TransferLinesExist(): Boolean
    begin
        WhseIntTransferLine.Reset();
        WhseIntTransferLine.SetRange("Document No.", "Document No.");
        exit(WhseIntTransferLine.FindFirst());
    end;

    procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
    var
        ConfirmManagement: Codeunit "Confirm Management";
        NewDimSetID: Integer;
    begin
        if NewParentDimSetID = OldParentDimSetID then
            exit;

        if not ConfirmManagement.GetResponseOrDefault(Text007, true) then
            exit;

        WhseIntTransferLine.Reset();
        WhseIntTransferLine.SetRange("Document No.", "Document No.");
        WhseIntTransferLine.LockTable();
        if WhseIntTransferLine.Find('-') then
            repeat
                NewDimSetID := DimMgt.GetDeltaDimSetID(WhseIntTransferLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
                if WhseIntTransferLine."Dimension Set ID" <> NewDimSetID then begin
                    WhseIntTransferLine."Dimension Set ID" := NewDimSetID;

                    DimMgt.UpdateGlobalDimFromDimSetID(
                      WhseIntTransferLine."Dimension Set ID", WhseIntTransferLine."Shortcut Dimension 1 Code",
                      WhseIntTransferLine."Shortcut Dimension 2 Code");
                    WhseIntTransferLine.Modify();
                end;
            until WhseIntTransferLine.Next() = 0;
    end;

    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin
        OldDimSetID := Rec."Dimension Set ID";
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet(
            Rec, "Dimension Set ID", StrSubstNo('%1 %2', TableCaption(), Rec."Document No."),
            "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

        if OldDimSetID <> "Dimension Set ID" then begin
            Modify();
            if TransferLinesExist() then
                UpdateAllLineDim("Dimension Set ID", OldDimSetID);
        end;
    end;

    procedure PostDocument()
    var
        ItemJnlLine: Record "Item Journal Line";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        WarehousePosting: Codeunit "AMC Warehouse Posting";
    begin
        IF Rec."Document Status" = Rec."Document Status"::Open THEN
            ERROR(Text001);

        IF Rec."Posted Document No." = '' THEN BEGIN
            IF Rec."Post No. Series" = '' THEN
                CASE Rec."Transaction Type" OF
                    Rec."Transaction Type"::"Internal Transfer":
                        Rec."Post No. Series" := WhseSetup."AMC PostedInt.Transf.No.Series";
                END;
            NoSeriesMgt.InitSeries(Rec."Post No. Series", xRec."No. Series",
                                   Rec."Posting Date", Rec."Posted Document No.", Rec."No. Series");
            Rec.MODIFY();
        END;

        IF Rec."Posted Document No." = '' THEN
            ERROR(Text004);

        ItemJnlLine.RESET();
        ItemJnlLine.SETRANGE("Journal Template Name", 'PRZESUNIEC');
        ItemJnlLine.SETRANGE("Journal Batch Name", 'INT_TRANSF');
        ItemJnlLine.DELETEALL();

        WhseIntTransferLine.RESET();
        WhseIntTransferLine.SETRANGE("Document No.", Rec."Document No.");
        WhseIntTransferLine.SETRANGE(Posted, FALSE);
        IF WhseIntTransferLine.FindSet() THEN BEGIN
            REPEAT
                IF WhseIntTransferLine.Quantity <> 0 THEN
                    WarehousePosting.PostInternalTransfer(WhseIntTransferLine, Rec."Posted Document No.");
                WhseIntTransferLine.Posted := TRUE;
                WhseIntTransferLine.MODIFY();
            UNTIL WhseIntTransferLine.NEXT() = 0;
            Rec.Posted := TRUE;
            Rec."Document Status" := Rec."Document Status"::Posted;
            Rec.MODIFY();
        END ELSE
            ERROR(Text003);
    end;

    var
        Text003: Label 'Nie ma żadnych linii do zaksięgowania';
}
