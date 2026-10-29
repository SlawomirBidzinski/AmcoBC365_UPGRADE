codeunit 50015 "AMC QC Mgmt."
{
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
}
