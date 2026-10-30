codeunit 50015 "AMC QC Mgmt."
{
    Permissions = tabledata "Item Ledger Entry" = rmid;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', false, false)]
    local procedure OnAfterInitItemLedgEntry(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    var
        QCStatus: Record "AMC QC Status";
        Item: Record Item;
        StatusErrLbl: Label 'QC Status %1 does not allow type %2';
        StatusLotErrLbl: Label 'The whole lot has been blocked by Quality Control process';
    begin
        Item.Get(NewItemLedgEntry."Item No.");
        Item.TestField("AMC Default QC Status");
        QCStatus.Get(Item."AMC Default QC Status");
        if QCStatus."Lot Blocking" then
            Error(StatusLotErrLbl);

        case NewItemLedgEntry."Entry Type" of
            Enum::"Item Ledger Entry Type"::Purchase,
            Enum::"Item Ledger Entry Type"::"Positive Adjmt.":
                if not QCStatus.Purchase then
                    Error(StatusErrLbl, QCStatus.Code, QCStatus.FieldCaption(Purchase));
            Enum::"Item Ledger Entry Type"::Sale:
                if not QCStatus.Sales then
                    Error(StatusErrLbl, QCStatus.Code, QCStatus.FieldCaption(Sales));
            Enum::"Item Ledger Entry Type"::Output,
            Enum::"Item Ledger Entry Type"::Consumption:
                if not QCStatus.Consumption then
                    Error(StatusErrLbl, QCStatus.Code, QCStatus.FieldCaption(Consumption));
            Enum::"Item Ledger Entry Type"::Transfer:
                if not QCStatus.Transfer then
                    Error(StatusErrLbl, QCStatus.Code, QCStatus.FieldCaption(Transfer));
        end;

        NewItemLedgEntry."AMC QC Status" := Item."AMC Default QC Status";
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
