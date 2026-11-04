codeunit 50015 "AMC QC Mgmt."
{
    Permissions = tabledata "Item Ledger Entry" = rmid;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    var
        QCStatus: Record "AMC QC Status";
        Item: Record Item;
        TransferItemLedgEntry: Record "Item Ledger Entry";
    begin
        Item.Get(NewItemLedgEntry."Item No.");

        if (NewItemLedgEntry."Entry Type" = NewItemLedgEntry."Entry Type"::Transfer) and
           (NewItemLedgEntry.Quantity > 0) then begin
            TransferItemLedgEntry.Reset();
            TransferItemLedgEntry.SetRange("Item No.", NewItemLedgEntry."Item No.");
            TransferItemLedgEntry.SetRange("Document No.", NewItemLedgEntry."Document No.");
            TransferItemLedgEntry.SetRange("Lot No.", NewItemLedgEntry."Lot No.");
            TransferItemLedgEntry.SetFilter(Quantity, '<0');
            if TransferItemLedgEntry.FindFirst() then
                NewItemLedgEntry."AMC QC Status" := TransferItemLedgEntry."AMC QC Status";
        end
        else if NewItemLedgEntry.Quantity > 0 then begin
            Item.TestField("AMC Default QC Status");
            QCStatus.Get(Item."AMC Default QC Status");

            NewItemLedgEntry."AMC QC Status" := Item."AMC Default QC Status";
        end;

        CheckQCStatus(NewItemLedgEntry);
    end;

    local procedure CheckQCStatus(NewItemLedgEntry: Record "Item Ledger Entry")
    var
        QCStatus: Record "AMC QC Status";
        ItemLedgEntry: Record "Item Ledger Entry";
        ShowError: Boolean;
        ErrorLbl: Label 'The item %1, lot %2 has not passed the quality control.';
    begin
        if NewItemLedgEntry."AMC QC Status" = '' then
            exit;

        QCStatus.Get(NewItemLedgEntry."AMC QC Status");
        ShowError := false;

        if QCStatus."Lot Blocking" then begin
            ItemLedgEntry.Reset();
            ItemLedgEntry.SetRange("Item No.", NewItemLedgEntry."Item No.");
            ItemLedgEntry.SetRange("Variant Code", NewItemLedgEntry."Variant Code");
            ItemLedgEntry.SetRange("Location Code", NewItemLedgEntry."Location Code");
            ItemLedgEntry.SetRange("Lot No.", NewItemLedgEntry."Lot No.");
            ItemLedgEntry.SetRange(Open, true);
            if ItemLedgEntry.FindSet() then
                repeat
                    QCStatus.Get(ItemLedgEntry."AMC QC Status");
                    case NewItemLedgEntry."Entry Type" of
                        NewItemLedgEntry."Entry Type"::Consumption:
                            ShowError := not QCStatus.Consumption;
                        NewItemLedgEntry."Entry Type"::Sale:
                            ShowError := not QCStatus.Sales;
                        NewItemLedgEntry."Entry Type"::Transfer:
                            ShowError := not QCStatus.Transfer;
                    end;
                until ItemLedgEntry.Next = 0;
        end
        else
            case NewItemLedgEntry."Entry Type" of
                NewItemLedgEntry."Entry Type"::Consumption:
                    ShowError := not QCStatus.Consumption;
                NewItemLedgEntry."Entry Type"::Sale:
                    ShowError := not QCStatus.Sales;
                NewItemLedgEntry."Entry Type"::Transfer:
                    ShowError := not QCStatus.Transfer;
            end;

        if ShowError then
            Error(ErrorLbl, ItemLedgEntry."Item No.", ItemLedgEntry."Lot No.");
    end;

    procedure GetTmpRecordset(var TmpItemLedgerEntry: Record "Item Ledger Entry" temporary; ItemFilter: Text; LocationFilter: Text;
                            LotFilter: Text; ExpirationDateFilter: Text; QCStatusFilter: Text; PurchRcptNoFilter: Text; PurchVendorNoFilter: Text)
    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        Item: Record Item;
    begin
        ClearTmpRecordset(TmpItemLedgerEntry);

        ItemLedgerEntry.RESET;

        ItemLedgerEntry.SETCURRENTKEY("Item No.", Open, "Variant Code", Positive, "Location Code",
                                      "Posting Date", "Expiration Date", "Lot No.", "Serial No.");

        ItemLedgerEntry.SETRANGE(Open, TRUE);
        ItemLedgerEntry.SETRANGE(Positive, TRUE);
        ItemLedgerEntry.SETFILTER("Item No.", ItemFilter);
        ItemLedgerEntry.SETFILTER("Location Code", LocationFilter);
        ItemLedgerEntry.SETFILTER("Expiration Date", ExpirationDateFilter);
        ItemLedgerEntry.SETFILTER("AMC QC Status", QCStatusFilter);
        ItemLedgerEntry.SETFILTER("Document No.", PurchRcptNoFilter);
        ItemLedgerEntry.SETFILTER("Source No.", PurchVendorNoFilter);
        ItemLedgerEntry.SETFILTER("Lot No.", LotFilter);
        IF ItemLedgerEntry.FindSet() THEN BEGIN
            REPEAT
                IF (ItemLedgerEntry.GETFILTER("Expiration Date") = '') OR
                   ((ItemLedgerEntry.GETFILTER("Expiration Date") <> '') AND (ItemLedgerEntry."Expiration Date" <> 0D)) THEN BEGIN

                    TmpItemLedgerEntry := ItemLedgerEntry;

                    IF TmpItemLedgerEntry.Description = '' THEN BEGIN
                        IF TmpItemLedgerEntry."Item No." <> Item."No." THEN
                            IF NOT Item.GET(TmpItemLedgerEntry."Item No.") THEN
                                CLEAR(Item);

                        TmpItemLedgerEntry.Description := Item.Description;
                    END;
                    TmpItemLedgerEntry.INSERT;
                END;
            UNTIL ItemLedgerEntry.NEXT() = 0;
        END;
    end;

    procedure ClearTmpRecordset(VAR TmpItemLedgerEntry: Record "Item Ledger Entry" temporary)
    begin
        TmpItemLedgerEntry.Reset();
        TmpItemLedgerEntry.DeleteAll();
    end;

    procedure ChangeQCStatus(VAR lTmpItemLedgerEntry: Record "Item Ledger Entry" temporary; NewQCStatus: Code[10]; lRequest: Boolean)
    var
        lItemLedgerEntry: Record "Item Ledger Entry";
        lConfirmed: Boolean;
        lQCStatus: Record "AMC QC Status";
        lLotNoInfo: Record "Lot No. Information";
        Text001: Label 'Do you want change the %1 of the current record?';
        Text002: Label 'Do you want to change the %1 of the selected records?';
        Text003: Label 'There is no record to change.';
    begin
        IF lRequest THEN BEGIN
            CASE lTmpItemLedgerEntry.COUNT OF
                0:
                    ERROR(Text003);
                1:
                    lConfirmed := CONFIRM(Text001, TRUE, lTmpItemLedgerEntry.FIELDCAPTION("AMC QC Status"));
                ELSE
                    lConfirmed := CONFIRM(Text002, TRUE, lTmpItemLedgerEntry.FIELDCAPTION("AMC QC Status"));
            END;
        END ELSE BEGIN
            lConfirmed := TRUE;
        END;

        IF lConfirmed THEN BEGIN
            IF lTmpItemLedgerEntry.FIND('-') THEN BEGIN
                REPEAT
                    lItemLedgerEntry.GET(lTmpItemLedgerEntry."Entry No.");

                    lItemLedgerEntry."AMC QC Status" := NewQCStatus;
                    lItemLedgerEntry.MODIFY;

                    lTmpItemLedgerEntry."AMC QC Status" := NewQCStatus;
                    lTmpItemLedgerEntry.MODIFY;
                    IF lQCStatus.GET(NewQCStatus) THEN BEGIN
                        IF lLotNoInfo.GET(lItemLedgerEntry."Item No.", lItemLedgerEntry."Variant Code", lItemLedgerEntry."Lot No.") THEN BEGIN
                            lLotNoInfo.Blocked := lQCStatus."Lot Blocking";
                            lLotNoInfo.MODIFY;
                        END;
                    END ELSE BEGIN
                        IF lLotNoInfo.GET(lItemLedgerEntry."Item No.", lItemLedgerEntry."Variant Code", lItemLedgerEntry."Lot No.") THEN BEGIN
                            lLotNoInfo.Blocked := FALSE;
                            lLotNoInfo.MODIFY;
                        END;
                    END;

                UNTIL lTmpItemLedgerEntry.NEXT = 0;
            END;
        END;
    end;


    procedure CreateExpirationDateFilter(VAR ExpirationDateFilter: Text[30])
    var
        FilterTokens: Codeunit "Filter Tokens";
    begin
        FilterTokens.MakeDateFilter(ExpirationDateFilter);
    end;
}
