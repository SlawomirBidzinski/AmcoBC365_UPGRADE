codeunit 50012 "AMC Warehouse Posting"
{
    procedure PostInternalTransfer(WhseInterTransfLine: Record "AMC Whse. Int. Transfer Line"; PostedDocNo: Code[20])
    begin
        ItemJnlLine.INIT();

        ItemJnlLine."Journal Template Name" := 'PRZESUNIÊC';
        ItemJnlLine."Journal Batch Name" := 'INT_TRANSF';
        ItemJnlLine."Source Code" := 'DZIENPODZ';

        ItemJnlLine."Posting Date" := WhseInterTransfLine."Posting Date";
        ItemJnlLine."Document Date" := WhseInterTransfLine."Document Date";
        //ItemJnlLine."Document No." := WhseInterTransfLine."Document No.";
        ItemJnlLine."Document No." := PostedDocNo;
        ItemJnlLine."Line No." := WhseInterTransfLine."Line No.";

        ItemJnlLine."Entry Type" := ItemJnlLine_2."Entry Type"::Transfer;
        ItemJnlLine."AMC Transfer Line" := TRUE;
        ItemJnlLine."Value Entry Type" := ItemJnlLine."Value Entry Type"::"Direct Cost";

        ItemJnlLine."Item No." := WhseInterTransfLine."Item No.";
        ItemJnlLine.Description := WhseInterTransfLine."Item Description";
        ItemJnlLine."Unit of Measure Code" := WhseInterTransfLine."Unit of Measure Code";

        IF ItemRec.GET(WhseInterTransfLine."Item No.") THEN BEGIN

            ItemJnlLine."Inventory Posting Group" := ItemRec."Inventory Posting Group";
            ItemJnlLine."Gen. Prod. Posting Group" := ItemRec."Gen. Prod. Posting Group";

            ItemJnlLine."Item Category Code" := ItemRec."Item Category Code";
        END;

        ItemJnlLine."Location Code" := WhseInterTransfLine."Location Code";
        ItemJnlLine."Bin Code" := WhseInterTransfLine."Bin Code";

        ItemJnlLine."New Location Code" := WhseInterTransfLine."New Location Code";
        ItemJnlLine."New Bin Code" := WhseInterTransfLine."New Bin Code";

        ItemJnlLine.Quantity := WhseInterTransfLine.Quantity;
        ItemJnlLine."Invoiced Quantity" := WhseInterTransfLine.Quantity;
        ItemJnlLine."Quantity (Base)" := WhseInterTransfLine.Quantity;
        ItemJnlLine."Invoiced Qty. (Base)" := WhseInterTransfLine.Quantity;
        ItemJnlLine."Qty. per Unit of Measure" := 1;

        TransferReservation(WhseInterTransfLine, ItemJnlLine, Direction);
        ItemJnlLine."Lot No." := WhseInterTransfLine."Lot No.";
        ItemJnlLine."New Lot No." := WhseInterTransfLine."Lot No.";

        CheckWMSBin(ItemJnlLine);

        ItemJnlPostLine.RunWithCheck(ItemJnlLine);

        InsertWarehouseEntry(WhseInterTransfLine);
    end;

    procedure TransferReservation(WhseMgmnLine: Record "AMC Whse. Int. Transfer Line";
    ItemJnlLine: Record "Item Journal Line"; DirectionSource: Integer)
    var
        lrecReservEntry: Record "Reservation Entry";
        EntryNo: Integer;
    begin
        lrecReservEntry.RESET();
        IF lrecReservEntry.FINDLAST() THEN
            EntryNo := lrecReservEntry."Entry No.";

        lrecReservEntry.INIT();
        lrecReservEntry."Entry No." := EntryNo + 1;
        lrecReservEntry."Item No." := WhseMgmnLine."Item No.";
        lrecReservEntry."Location Code" := WhseMgmnLine."Location Code";

        lrecReservEntry."Quantity (Base)" := -WhseMgmnLine.Quantity;
        lrecReservEntry."Qty. per Unit of Measure" := 1;
        lrecReservEntry."Qty. to Handle (Base)" := -WhseMgmnLine.Quantity;
        lrecReservEntry."Qty. to Invoice (Base)" := -WhseMgmnLine.Quantity;

        lrecReservEntry."Reservation Status" := lrecReservEntry."Reservation Status"::Prospect;
        lrecReservEntry."Creation Date" := WORKDATE();

        lrecReservEntry."Source Type" := 83;
        lrecReservEntry."Source Subtype" := 4;
        lrecReservEntry."Source ID" := 'PRZESUNIEC';
        lrecReservEntry."Source Batch Name" := 'INT_TRANSF';
        lrecReservEntry."Source Ref. No." := ItemJnlLine."Line No.";
        lrecReservEntry."Shipment Date" := WhseMgmnLine."Posting Date";
        lrecReservEntry."Created By" := USERID;

        lrecReservEntry."Item Tracking" := lrecReservEntry."Item Tracking"::"Lot No.";
        lrecReservEntry."Lot No." := WhseMgmnLine."Lot No.";
        lrecReservEntry."New Lot No." := WhseMgmnLine."Lot No.";

        ItemLedgerEntry.RESET();
        ItemLedgerEntry.SETRANGE("Location Code", WhseMgmnLine."Location Code");
        ItemLedgerEntry.SETRANGE("Item No.", WhseMgmnLine."Item No.");
        ItemLedgerEntry.SETRANGE(Open, TRUE);
        ItemLedgerEntry.SETRANGE("Lot No.", WhseMgmnLine."Lot No.");

        IF ItemLedgerEntry.FINDFIRST() THEN BEGIN
            lrecReservEntry."New Expiration Date" := ItemLedgerEntry."Expiration Date";
            lrecReservEntry."AMC Status KJ" := ItemLedgerEntry."AMC QC Status";
        END;

        lrecReservEntry.INSERT();
    end;

    procedure CheckWMSBin(ItemJnlLine: Record "Item Journal Line")
    var
        WMSMgmt: Codeunit "WMS Management";
    begin
        GetLocation(ItemJnlLine."Location Code");
        IF Location."Bin Mandatory" THEN
            WhseTransaction := TRUE;
        CASE ItemJnlLine."Entry Type" OF
            ItemJnlLine."Entry Type"::Purchase, ItemJnlLine."Entry Type"::Sale,
            ItemJnlLine."Entry Type"::"Positive Adjmt.", ItemJnlLine."Entry Type"::"Negative Adjmt.":
                IF Location."Directed Put-away and Pick" THEN
                    WMSMgmt.CheckAdjmtBin(
                      Location, ItemJnlLine.Quantity,
                      (ItemJnlLine."Entry Type" IN
                       [ItemJnlLine."Entry Type"::Purchase,
                        ItemJnlLine."Entry Type"::"Positive Adjmt."]));
            ItemJnlLine."Entry Type"::Transfer:
                BEGIN
                    IF Location."Directed Put-away and Pick" THEN
                        WMSMgmt.CheckAdjmtBin(Location, -ItemJnlLine.Quantity, FALSE);
                    GetLocation(ItemJnlLine."New Location Code");
                    IF Location."Directed Put-away and Pick" THEN
                        WMSMgmt.CheckAdjmtBin(Location, ItemJnlLine.Quantity, TRUE);
                    IF Location."Bin Mandatory" THEN
                        WhseTransaction := TRUE;
                END;
        END;
    end;

    procedure GetLocation(LocationCode: Code[10])
    begin
        IF LocationCode = '' THEN
            CLEAR(Location)
        ELSE
            IF Location.Code <> LocationCode THEN
                Location.GET(LocationCode);
    end;

    procedure InsertWarehouseEntry(WhseInterTransfLine: Record "AMC Whse. Int. Transfer Line")
    var
        WhseIntTransferHead: Record "AMC Whse. Int. Transfer Header";
        WhseEntry: Record "Warehouse Entry";
        LocationPick: Record Location;
        LocationPut: Record Location;
        EntryNo: Integer;
        BinContent: Record "Bin Content";
        BinRec: Record Bin;
        TransferPick: Boolean;
        TransferPut: Boolean;
    begin
        TransferPick := FALSE;
        TransferPut := FALSE;

        WhseEntry.RESET();
        IF WhseEntry.FINDLAST() THEN
            EntryNo := WhseEntry."Entry No.";

        IF LocationPick.GET(WhseInterTransfLine."Location Code") THEN BEGIN
            IF LocationPick."Bin Mandatory" = TRUE THEN
                TransferPick := TRUE;

            IF LocationPick."Directed Put-away and Pick" = TRUE THEN
                TransferPick := TRUE;
        END;

        IF LocationPut.GET(WhseInterTransfLine."New Location Code") THEN BEGIN
            IF LocationPut."Bin Mandatory" = TRUE THEN
                TransferPut := TRUE;

            IF LocationPut."Directed Put-away and Pick" = TRUE THEN
                TransferPut := TRUE;
        END;

        // Zapisy pobrania

        IF TransferPick = TRUE THEN BEGIN
            EntryNo := EntryNo + 1;

            WhseEntry.INIT();
            WhseEntry."Entry No." := EntryNo;

            WhseEntry."Source Code" := 'PRZESMAG';
            WhseEntry."Entry Type" := WhseEntry."Entry Type"::Movement;
            WhseEntry."Reference Document" := WhseEntry."Reference Document"::Movement;

            WhseEntry."Registering Date" := WhseInterTransfLine."Posting Date";

            WhseEntry."Location Code" := WhseInterTransfLine."Location Code";
            WhseEntry."Bin Code" := WhseInterTransfLine."Bin Code";
            WhseEntry."Item No." := WhseInterTransfLine."Item No.";
            WhseEntry."Unit of Measure Code" := WhseInterTransfLine."Unit of Measure Code";
            WhseEntry."Lot No." := WhseInterTransfLine."Lot No.";

            WhseEntry.Quantity := -WhseInterTransfLine.Quantity;
            WhseEntry."Qty. (Base)" := -WhseInterTransfLine.Quantity;
            WhseEntry."Qty. per Unit of Measure" := 1;

            BinContent.RESET();
            BinContent.SETRANGE("Location Code", WhseInterTransfLine."Location Code");
            BinContent.SETRANGE("Bin Code", WhseInterTransfLine."Bin Code");
            BinContent.SETRANGE("Item No.", WhseInterTransfLine."Item No.");
            BinContent.SETRANGE("Unit of Measure Code", WhseInterTransfLine."Unit of Measure Code");
            IF BinContent.FINDFIRST() THEN BEGIN
                WhseEntry."Bin Type Code" := BinContent."Bin Type Code";
                WhseEntry."Zone Code" := BinContent."Zone Code";
            END;

            WhseIntTransferHead.RESET();
            WhseIntTransferHead.SETRANGE("Document No.", WhseInterTransfLine."Document No.");
            WhseIntTransferHead.SETRANGE("Transaction Type", WhseInterTransfLine."Transaction Type");
            IF WhseIntTransferHead.FINDFIRST() THEN BEGIN
                WhseEntry."User ID" := WhseIntTransferHead."Login ID";
                WhseEntry."Reference No." := WhseIntTransferHead."Posted Document No."
            END;

            WhseEntry.INSERT();
        END;

        // Zapisy od³o¿enia

        IF TransferPut = TRUE THEN BEGIN
            EntryNo := EntryNo + 1;

            WhseEntry.INIT();
            WhseEntry."Entry No." := EntryNo;

            WhseEntry."Source Code" := 'PRZESMAG';
            WhseEntry."Entry Type" := WhseEntry."Entry Type"::Movement;
            WhseEntry."Reference Document" := WhseEntry."Reference Document"::Movement;

            WhseEntry."Registering Date" := WhseInterTransfLine."Posting Date";

            WhseEntry."Location Code" := WhseInterTransfLine."New Location Code";
            WhseEntry."Bin Code" := WhseInterTransfLine."New Bin Code";
            WhseEntry."Item No." := WhseInterTransfLine."Item No.";
            WhseEntry."Unit of Measure Code" := WhseInterTransfLine."Unit of Measure Code";
            WhseEntry."Lot No." := WhseInterTransfLine."Lot No.";

            WhseEntry.Quantity := WhseInterTransfLine.Quantity;
            WhseEntry."Qty. (Base)" := WhseInterTransfLine.Quantity;
            WhseEntry."Qty. per Unit of Measure" := 1;

            BinContent.RESET();
            BinContent.SETRANGE("Location Code", WhseInterTransfLine."New Location Code");
            BinContent.SETRANGE("Bin Code", WhseInterTransfLine."New Bin Code");
            BinContent.SETRANGE("Item No.", WhseInterTransfLine."Item No.");
            BinContent.SETRANGE("Unit of Measure Code", WhseInterTransfLine."Unit of Measure Code");
            IF BinContent.FINDFIRST() THEN BEGIN
                WhseEntry."Bin Type Code" := BinContent."Bin Type Code";
                WhseEntry."Zone Code" := BinContent."Zone Code";
            END ELSE BEGIN
                BinContent.INIT();
                BinContent.VALIDATE("Location Code", WhseInterTransfLine."New Location Code");
                BinContent.VALIDATE("Bin Code", WhseInterTransfLine."New Bin Code");
                BinContent.VALIDATE("Item No.", WhseInterTransfLine."Item No.");
                BinContent.VALIDATE("Unit of Measure Code", WhseInterTransfLine."Unit of Measure Code");
                BinContent.INSERT();

                IF BinRec.GET(WhseInterTransfLine."New Location Code", WhseInterTransfLine."New Bin Code") THEN BEGIN
                    BinContent."Zone Code" := BinRec."Zone Code";
                    BinContent."Bin Type Code" := BinRec."Bin Type Code";
                    BinContent."Warehouse Class Code" := BinRec."Warehouse Class Code";
                    BinContent."Bin Ranking" := 100;
                    BinContent.MODIFY;

                    WhseEntry."Bin Type Code" := BinRec."Bin Type Code";
                    WhseEntry."Zone Code" := BinRec."Zone Code";
                END;
            END;

            WhseIntTransferHead.RESET();
            WhseIntTransferHead.SETRANGE("Document No.", WhseInterTransfLine."Document No.");
            WhseIntTransferHead.SETRANGE("Transaction Type", WhseInterTransfLine."Transaction Type");
            IF WhseIntTransferHead.FINDFIRST() THEN BEGIN
                WhseEntry."User ID" := WhseIntTransferHead."Login ID";
                WhseEntry."Reference No." := WhseIntTransferHead."Posted Document No."
            END;

            WhseEntry.INSERT();
        END;
    end;

    var
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
        ItemJnlLine: Record "Item Journal Line";
        ItemJnlLine_2: Record "Item Journal Line";
        ItemRec: Record Item;
        Location: Record Location;
        WhseTransaction: Boolean;
        Direction: Integer;
        ItemLedgerEntry: Record "Item Ledger Entry";
}
