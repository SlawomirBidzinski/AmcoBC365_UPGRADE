page 50012 "AMC QC Status Change"
{
    ApplicationArea = All;
    Caption = 'QC Status Change';
    PageType = Worksheet;
    SourceTable = "Item Ledger Entry";
    SourceTableView = sorting("Item No.", "Lot No.", "Location Code");
    UsageCategory = Tasks;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(Filters)
            {
                ShowCaption = false;
                field(ItemFilter; ItemFilter)
                {
                    Caption = 'Item Filter';
                    ApplicationArea = All;
                    TableRelation = Item;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        ItemList: Page "Item List";
                        NewSelectionFilter: Text;
                    begin
                        ItemList.LookupMode(true);

                        if ItemList.RunModal() = Action::LookupOK then begin
                            NewSelectionFilter := ItemList.GetSelectionFilter();

                            if NewSelectionFilter <> '' then begin
                                if ItemFilter = '' then
                                    ItemFilter := NewSelectionFilter
                                else
                                    ItemFilter := ItemFilter + NewSelectionFilter;

                                Text := ItemFilter;
                                exit(true);
                            end;
                        end;

                        exit(false);
                    end;

                    trigger OnValidate()
                    begin
                        ItemFilter := UPPERCASE(ItemFilter);
                        CheckFieldValidate();
                    end;
                }
                field(LocationFilter; LocationFilter)
                {
                    Caption = 'Location Filter';
                    ApplicationArea = All;
                    TableRelation = Location;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        LocList: Page "Location List";
                        NewSelectionFilter: Text;
                    begin
                        LocList.LookupMode(true);

                        if LocList.RunModal() = Action::LookupOK then begin
                            NewSelectionFilter := LocList.GetSelectionFilter();

                            if NewSelectionFilter <> '' then begin
                                if LocationFilter = '' then
                                    LocationFilter := NewSelectionFilter
                                else
                                    LocationFilter := LocationFilter + NewSelectionFilter;

                                Text := LocationFilter;
                                exit(true);
                            end;
                        end;

                        exit(false);
                    end;

                    trigger OnValidate()
                    begin
                        LocationFilter := UPPERCASE(LocationFilter);
                        CheckFieldValidate;
                    end;
                }
                field(LotFilter; LotFilter)
                {
                    Caption = 'Lot Filter';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        LotFilter := UPPERCASE(LotFilter);
                        CheckFieldValidate();
                    end;
                }
                field(ExpirationCalculationFilter; ExpirationCalculationFilter)
                {
                    Caption = 'Expiration Calculation Filter';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        IF ExpirationCalculationFilter <> '' THEN BEGIN
                            ExpirationDateFilter := '..' + FORMAT(CALCDATE(ExpirationCalculationFilter, WORKDATE));
                        END ELSE BEGIN
                            ExpirationDateFilter := '';
                        END;
                        CheckFieldValidate;
                    end;
                }
                field(ExpirationDateFilter; ExpirationDateFilter)
                {
                    Caption = 'Expiration Date Filter';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        CLEAR(ExpirationCalculationFilter);
                        QCMgmt.CreateExpirationDateFilter(ExpirationDateFilter);
                    end;
                }
                field(QCStatusFilter; QCStatusFilter)
                {
                    Caption = 'QC Status Filter';
                    ApplicationArea = All;
                    TableRelation = "AMC QC Status";

                    trigger OnValidate()
                    begin
                        QCStatusFilter := UPPERCASE(QCStatusFilter);
                        CheckFieldValidate();
                    end;
                }
                field(PurchRcptNoFilter; PurchRcptNoFilter)
                {
                    Caption = 'Purch. Receipt Filter';
                    ApplicationArea = All;
                    TableRelation = "Purch. Rcpt. Header";
                }
                field(PurchVendorNoFilter; PurchVendorNoFilter)
                {
                    Caption = 'Vendor Filter';
                    ApplicationArea = All;
                    TableRelation = Vendor;
                }
                field(NewQCStatus; NewQCStatus)
                {
                    Caption = 'New QC Status';
                    ApplicationArea = All;
                    TableRelation = "AMC QC Status";
                }
            }
            repeater(Lines)
            {
                ShowCaption = false;
                Editable = false;
                field("AMC QC Status"; Rec."AMC QC Status")
                {
                    ToolTip = 'Specifies the value of the QC Status field.', Comment = '%';
                    StyleExpr = QCStyle;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the entry''s posting date.';
                }
                field(LotNoInfoSearchVendorName; LotNoInfo."AMC Search Vendor Name")
                {
                    Caption = 'Search Vendor Name';
                    ApplicationArea = All;
                }
                field(LotNoInfoReceiptDate; LotNoInfo."AMC Receipt Date")
                {
                    Caption = 'Receipt Date';
                    ApplicationArea = All;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ToolTip = 'Specifies which type of transaction that the entry is created from.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the document number on the entry. The document is the voucher that the entry was based on, for example, a receipt.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the number of the item in the entry.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the variant of the item on the line.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of the entry.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ToolTip = 'Specifies the code for the global dimension that is linked to the record or entry for analysis purposes. Two global dimensions, typically for the company''s most important activities, are available on all cards, documents, reports, and lists.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ToolTip = 'Specifies the code for the location that the entry is linked to.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies a serial number if the posted item carries such a number.';
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ToolTip = 'Specifies a lot number if the posted item carries such a number.';
                }
                field("Warranty Date"; Rec."Warranty Date")
                {
                    ToolTip = 'Specifies the last day of warranty for the item on the line.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ToolTip = 'Specifies the last date that the item on the line can be used.';
                }
                field("AMC Production Date"; Rec."AMC Production Date")
                {
                    ToolTip = 'Specifies the value of the Production Date field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item in the item entry.';
                }
                field("Invoiced Quantity"; Rec."Invoiced Quantity")
                {
                    ToolTip = 'Specifies how many units of the item on the line have been invoiced.';
                }
                field("Remaining Quantity"; Rec."Remaining Quantity")
                {
                    ToolTip = 'Specifies the quantity in the Quantity field that remains to be processed.';
                }
                field("Reserved Quantity"; Rec."Reserved Quantity")
                {
                    ToolTip = 'Specifies how many units of the item on the line have been reserved.';
                }
                field("Qty. per Unit of Measure"; Rec."Qty. per Unit of Measure")
                {
                    ToolTip = 'Specifies the quantity per item unit of measure.';
                }
                field("Completely Invoiced"; Rec."Completely Invoiced")
                {
                    ToolTip = 'Specifies if the entry has been fully invoiced or if more posted invoices are expected. Only completely invoiced entries can be revalued.';
                }
                field(Open; Rec.Open)
                {
                    ToolTip = 'Specifies whether the entry has been fully applied to.';
                }
                field("Drop Shipment"; Rec."Drop Shipment")
                {
                    ToolTip = 'Specifies if your vendor ships the items directly to your customer.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(FindRec)
            {
                Image = Find;
                ApplicationArea = All;
                Caption = 'Find';

                trigger OnAction()
                begin
                    StartSearching();
                end;
            }
            action(ChangeStatus)
            {
                Image = Change;
                ApplicationArea = All;
                Caption = 'Change';

                trigger OnAction()
                begin
                    StartChanging();
                end;
            }
        }
        area(Promoted)
        {
            actionref(FindRec_Promoted; FindRec) { }
            actionref(ChangeStatus_Promoted; ChangeStatus) { }
        }
    }

    trigger OnFindRecord(Which: Text): Boolean
    begin
        TmpItemLedgerEntry := Rec;
        if not TmpItemLedgerEntry.Find(Which) THEN
            exit(false);
        Rec := TmpItemLedgerEntry;
        exit(true);
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    var
        CurrentSteps: Integer;
    begin
        TmpItemLedgerEntry := Rec;
        CurrentSteps := TmpItemLedgerEntry.Next(Steps);
        if CurrentSteps <> 0 then
            Rec := TmpItemLedgerEntry;
        exit(CurrentSteps);
    end;


    local procedure CheckFieldValidate()
    begin
        QCMgmt.ClearTmpRecordset(TmpItemLedgerEntry);
        CurrPage.UPDATE;
    end;

    local procedure StartSearching()
    begin
        QCMgmt.GetTmpRecordset(TmpItemLedgerEntry,
                               ItemFilter,
                               LocationFilter,
                               LotFilter,
                               ExpirationDateFilter,
                               QCStatusFilter,
                               PurchRcptNoFilter,
                               PurchVendorNoFilter);
    end;

    local procedure StartChanging()
    begin
        ItemLedgerEntry.Copy(TmpItemLedgerEntry);
        CurrPage.SetSelectionFilter(TmpItemLedgerEntry);
        QCMgmt.ChangeQCStatus(TmpItemLedgerEntry, NewQCStatus, TRUE);
        TmpItemLedgerEntry.Copy(ItemLedgerEntry);
    end;

    trigger OnAfterGetRecord()
    var
        QCStatus: Record "AMC QC Status";
    begin
        QCStyle := Format(PageStyle::None);
        if QCStatus.Get(Rec."AMC QC Status") then
            QCStyle := QCStatus.GetStatusStyle();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        IF NOT LotNoInfo.GET(TmpItemLedgerEntry."Item No.", TmpItemLedgerEntry."Variant Code", TmpItemLedgerEntry."Lot No.") THEN
            LotNoInfo.INIT();
    end;

    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        TmpItemLedgerEntry: Record "Item Ledger Entry" temporary;
        QCStatus: Record "AMC QC Status";
        LotNoInfo: Record "Lot No. Information";
        QCMgmt: Codeunit "AMC QC Mgmt.";
        ItemFilter: Text;
        LocationFilter: Text;
        LotFilter: Text;
        ExpirationCalculationFilter: Text;
        ExpirationDateFilter: Text;
        QCStatusFilter: Text;
        PurchRcptNoFilter: Text;
        PurchVendorNoFilter: Text;
        QCStyle: Text;
        NewQCStatus: Code[20];
}
