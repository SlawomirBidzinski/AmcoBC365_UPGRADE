codeunit 50016 "AMC Warehouse Create Stock"
{
    Permissions = tabledata "Warehouse Entry" = rmid,
                  tabledata "Reservation Entry" = rmid;
    procedure PostItemLine(SalesLine: Record "Sales Line"; PostedDocNo: Code[20])
    var
        ItemJnlLine: Record "Item Journal Line" temporary;
        SalesHeader: Record "Sales Header";
        ItemRec: Record Item;
        LocationRec: Record Location;
        ItemLedgerEntry: Record "Item Ledger Entry";
        BinContent: Record "Bin Content";
        ItemJnlPostLine: Codeunit "Item Jnl.-Post Line";
        Direction: Integer;
    begin
        SalesSetup.Get();
        SalesSetup.TestField("AMC Samples Jnl. Temp. Name");
        SalesSetup.TestField("AMC Samples Jnl. Batch Name");

        PostDate := 0D;
        LocactionSet := '';
        BinSet := '';
        ExpDate := 0D;

        ItemJnlLine.RESET;
        ItemJnlLine.DELETEALL;

        ItemJnlLine.INIT;

        ItemJnlLine."Journal Template Name" := SalesSetup."AMC Samples Jnl. Temp. Name";
        ItemJnlLine."Journal Batch Name" := SalesSetup."AMC Samples Jnl. Batch Name";
        ItemJnlLine."Source Code" := SalesSetup."AMC Samples Source Code";

        SalesHeader.RESET;
        SalesHeader.SETRANGE("Document Type", SalesHeader."Document Type"::Order);
        SalesHeader.SETRANGE("No.", SalesLine."Document No.");
        IF SalesHeader.FINDFIRST THEN BEGIN
            SalesHeader.TESTFIELD("Posting Date");
            SalesHeader.TESTFIELD("Document Date");
        END;

        ItemJnlLine."Posting Date" := SalesHeader."Posting Date";
        ItemJnlLine."Document Date" := SalesHeader."Document Date";

        ItemJnlLine."Document No." := PostedDocNo;
        ItemJnlLine."Line No." := SalesLine."Line No.";

        ItemJnlLine."Entry Type" := ItemJnlLine."Entry Type"::"Positive Adjmt.";
        ItemJnlLine."AMC Transfer Line" := FALSE;
        ItemJnlLine."Value Entry Type" := ItemJnlLine."Value Entry Type"::"Direct Cost";

        ItemJnlLine."Item No." := SalesLine."No.";
        ItemJnlLine.Description := SalesLine.Description;
        ItemJnlLine."Unit of Measure Code" := SalesLine."Unit of Measure Code";

        IF ItemRec.GET(SalesLine."No.") THEN BEGIN

            ItemJnlLine."Inventory Posting Group" := ItemRec."Inventory Posting Group";
            ItemJnlLine."Gen. Prod. Posting Group" := ItemRec."Gen. Prod. Posting Group";

            ItemJnlLine."Item Category Code" := ItemRec."Item Category Code";
        END;

        ItemJnlLine."AMC Test Item Insert" := TRUE;
        ItemJnlLine."Location Code" := SalesLine."Location Code";

        IF LocationRec.GET(SalesLine."Location Code") THEN
            LocationRec.TESTFIELD("Default Bin Code");
        ItemJnlLine."Bin Code" := LocationRec."Default Bin Code";

        ItemJnlLine.Quantity := SalesLine."AMC Qty to Create";
        ItemJnlLine."Invoiced Quantity" := SalesLine."AMC Qty to Create";
        ItemJnlLine."Quantity (Base)" := SalesLine."AMC Qty to Create";
        ItemJnlLine."Invoiced Qty. (Base)" := SalesLine."AMC Qty to Create";
        ItemJnlLine."Qty. per Unit of Measure" := 1;
        ItemJnlLine.VALIDATE(Amount, 0);

        PostDate := ItemJnlLine."Posting Date";
        LocactionSet := ItemJnlLine."Location Code";
        BinSet := ItemJnlLine."Bin Code";
        ExpDate := SalesLine."AMC Item Exp Date";

        TransferReservation(SalesLine, ItemJnlLine, Direction);

        CheckWMSBin(ItemJnlLine);

        ItemJnlPostLine.RunWithCheck(ItemJnlLine);

        InsertWarehouseEntry(SalesLine);

        SalesLine."AMC Qty Created" := SalesLine."AMC Qty to Create";
        SalesLine."AMC Qty to Create" := 0;
        SalesLine.MODIFY;
    end;

    local procedure GetLocation(LocationCode: Code[10])
    begin
        IF LocationCode = '' THEN
            CLEAR(Location)
        ELSE
            IF Location.Code <> LocationCode THEN
                Location.GET(LocationCode);
    end;

    local procedure CheckWMSBin(ItemJnlLine: Record "Item Journal Line")
    var
        WMSMgmt: Codeunit "WMS Management";
    begin
        GetLocation(ItemJnlLine."Location Code");
        IF Location."Bin Mandatory" THEN
            WhseTransaction := TRUE;
        CASE ItemJnlLine."Entry Type" OF
            ItemJnlLine."Entry Type"::Purchase, ItemJnlLine."Entry Type"::Sale,
            ItemJnlLine."Entry Type"::"Positive Adjmt.", ItemJnlLine."Entry Type"::"Negative Adjmt.":
                BEGIN
                    IF Location."Directed Put-away and Pick" THEN BEGIN
                        WMSMgmt.CheckAdjmtBin(
                          Location, ItemJnlLine.Quantity,
                          (ItemJnlLine."Entry Type" IN
                           [ItemJnlLine."Entry Type"::Purchase,
                            ItemJnlLine."Entry Type"::"Positive Adjmt."]));
                    END;
                END;
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

    local procedure TransferReservation(SalesLineLoc: Record "Sales Line"; ItemJnlLine: Record "Item Journal Line"; DirectionSource: Integer)
    var
        ReservEntry: Record "Reservation Entry";
        Item: Record Item;
        EntryNo: Integer;
    begin
        Item.Get(ItemJnlLine."Item No.");
        Item.TestField("AMC Default QC Status");

        ReservEntry.RESET;
        IF ReservEntry.FINDLAST THEN
            EntryNo := ReservEntry."Entry No.";

        ReservEntry.INIT;
        ReservEntry."Entry No." := EntryNo + 1;
        ReservEntry."Item No." := SalesLineLoc."No.";
        ReservEntry."Location Code" := SalesLineLoc."Location Code";

        ReservEntry.Positive := TRUE;

        ReservEntry."Quantity (Base)" := SalesLineLoc."AMC Qty to Create";
        ReservEntry."Qty. per Unit of Measure" := 1;
        ReservEntry."Qty. to Handle (Base)" := SalesLineLoc."AMC Qty to Create";
        ReservEntry."Qty. to Invoice (Base)" := SalesLineLoc."AMC Qty to Create";

        ReservEntry."Reservation Status" := ReservEntry."Reservation Status"::Prospect;
        ReservEntry."Creation Date" := WORKDATE;

        ReservEntry."Source Type" := 83;
        ReservEntry."Source Subtype" := 2;
        ReservEntry."Source ID" := SalesSetup."AMC Samples Jnl. Temp. Name";
        ReservEntry."Source Batch Name" := SalesSetup."AMC Samples Jnl. Batch Name";
        ReservEntry."Source Ref. No." := ItemJnlLine."Line No.";
        ReservEntry."Shipment Date" := ItemJnlLine."Posting Date";

        ReservEntry."AMC Production Date" := ItemJnlLine."Posting Date";
        ReservEntry."Expiration Date" := SalesLineLoc."AMC Item Exp Date";
        ReservEntry."Created By" := USERID;

        ReservEntry."Item Tracking" := ReservEntry."Item Tracking"::"Lot No.";
        ReservEntry."Lot No." := SalesLineLoc."AMC Lot No to Create";
        ReservEntry."New Lot No." := SalesLineLoc."AMC Lot No to Create";

        ReservEntry."New Expiration Date" := SalesLineLoc."AMC Item Exp Date";
        ReservEntry."AMC Status KJ" := Item."AMC Default QC Status";

        ReservEntry.INSERT;
    end;


    local procedure InsertWarehouseEntry(SalesLineRec: Record "Sales Line")
    var
        WhseEntry: Record "Warehouse Entry";
        LocationRec: Record Location;
        EntryNo: Integer;
        CreateBinRejestry: Boolean;
        BinContent: Record "Bin Content";
        BinRec: Record Bin;
    begin
        CreateBinRejestry := FALSE;

        WhseEntry.RESET;
        IF WhseEntry.FINDLAST THEN
            EntryNo := WhseEntry."Entry No.";

        IF LocationRec.GET(LocactionSet) THEN BEGIN
            IF LocationRec."Bin Mandatory" = TRUE THEN
                CreateBinRejestry := TRUE;
            IF LocationRec."Directed Put-away and Pick" = TRUE THEN
                CreateBinRejestry := TRUE;
        END;

        IF CreateBinRejestry = TRUE THEN BEGIN

            EntryNo := EntryNo + 1;

            WhseEntry.INIT;
            WhseEntry."Entry No." := EntryNo;

            WhseEntry."Source Code" := SalesSetup."AMC Samples Source Code";
            WhseEntry."Entry Type" := WhseEntry."Entry Type"::"Positive Adjmt.";
            WhseEntry."Reference Document" := WhseEntry."Reference Document"::"Item Journal";

            WhseEntry."Registering Date" := PostDate;

            WhseEntry."Location Code" := LocactionSet;
            WhseEntry."Bin Code" := BinSet;
            WhseEntry."Item No." := SalesLineRec."No.";
            WhseEntry."Unit of Measure Code" := SalesLineRec."Unit of Measure Code";
            WhseEntry."Lot No." := SalesLineRec."AMC Lot No to Create";
            WhseEntry."Expiration Date" := ExpDate;

            WhseEntry.Quantity := SalesLineRec."AMC Qty to Create";
            WhseEntry."Qty. (Base)" := SalesLineRec."AMC Qty to Create";
            WhseEntry."Qty. per Unit of Measure" := 1;

            BinContent.RESET;
            BinContent.SETRANGE("Location Code", LocactionSet);
            BinContent.SETRANGE("Bin Code", BinSet);
            BinContent.SETRANGE("Item No.", SalesLineRec."No.");
            BinContent.SETRANGE("Unit of Measure Code", SalesLineRec."Unit of Measure Code");
            IF BinContent.FINDFIRST THEN BEGIN
                WhseEntry."Bin Type Code" := BinContent."Bin Type Code";
                WhseEntry."Zone Code" := BinContent."Zone Code";
            END ELSE BEGIN
                BinContent.INIT;
                BinContent."Location Code" := LocactionSet;
                BinContent."Bin Code" := BinSet;
                BinContent."Zone Code" := SalesSetup."AMC Samples Zone Code";
                BinContent.Validate("Bin Type Code", SalesSetup."AMC Samples Bin Type Code");
                BinContent."Warehouse Class Code" := SalesSetup."AMC Samples Whse. Class. Code";
                BinContent."Item No." := SalesLineRec."No.";
                BinContent."Unit of Measure Code" := SalesLineRec."Unit of Measure Code";
                BinContent.INSERT;

                WhseEntry."Bin Type Code" := BinContent."Bin Type Code";
                WhseEntry."Zone Code" := BinContent."Zone Code";
            END;

            WhseEntry."User ID" := USERID;
            WhseEntry."Reference No." := SalesLineRec."Document No.";

            WhseEntry.INSERT;
        END;
    end;

    var
        Location: Record Location;
        SalesSetup: Record "Sales & Receivables Setup";
        LocactionSet: Code[20];
        WhseTransaction: Boolean;
        PostDate: Date;
        BinSet: Code[20];
        ExpDate: Date;
}
