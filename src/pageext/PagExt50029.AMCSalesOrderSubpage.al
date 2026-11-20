pageextension 50029 "AMC Sales Order Subform" extends "Sales Order Subform"
{
    layout
    {
        addafter("Description")
        {
            field("AMC Set Item"; Rec."AMC Set Item")
            {
                ApplicationArea = All;

                trigger OnAssistEdit()
                var
                    Item: Record Item;
                    QuestText: Text;
                    Text_000: Label 'Czy wprowadziæ zapas %1\w miejsce wprowadzonego kodu zapasu%2?';
                    Text_003: Label 'Czy utworzyc zapas próbki %1 i zaktualizowaæ linie?';
                    SetQty: Decimal;
                    LineNotes: Text;
                begin
                    IF Rec."AMC Set Item" <> '' THEN BEGIN
                        Item.RESET;
                        Item.SETRANGE("No.", Rec."AMC Set Item");
                        IF Item.FINDFIRST() THEN BEGIN
                            QuestText := STRSUBSTNO(Text_000, Rec."AMC Set Item", Rec."No.");
                            IF CONFIRM(QuestText, FALSE) THEN BEGIN
                                SetQty := Rec.Quantity;
                                LineNotes := Rec."AMC Line Notes";
                                Rec.Type := Rec.Type::Item;

                                Rec.VALIDATE("No.", Rec."AMC Set Item");
                                Rec.Validate(Quantity, SetQty);
                                Rec."Location Code" := 'M.PROBY';
                                Rec."AMC Line Notes" := LineNotes;
                            END;
                        END ELSE BEGIN
                            QuestText := STRSUBSTNO(Text_003, Rec.Description);
                            IF CONFIRM(QuestText, FALSE) THEN BEGIN
                                Rec."AMC Set Item" := Rec.CreateItemRw(Rec."AMC Set Item");
                                Rec.Type := Rec.Type::Item;
                                Rec.VALIDATE("No.", Rec."AMC Set Item");
                                Rec."Location Code" := 'M.PROBY';
                            END;
                        END;
                    END ELSE BEGIN
                        QuestText := STRSUBSTNO(Text_003, Rec.Description);
                        IF CONFIRM(QuestText, FALSE) THEN BEGIN
                            Rec."AMC Set Item" := Rec.CreateItemRw('');
                            Rec.Type := Rec.Type::Item;
                            Rec.VALIDATE("No.", Rec."AMC Set Item");
                            Rec."Location Code" := 'M.PROBY';
                        END;
                    END;
                end;
            }
            field("AMC Qty to Create"; Rec."AMC Qty to Create")
            {
                ApplicationArea = All;
            }
            field("AMC Lot No to Create"; Rec."AMC Lot No to Create")
            {
                ApplicationArea = All;
            }
            field("AMC Item Exp Date"; Rec."AMC Item Exp Date")
            {
                ApplicationArea = All;
            }
            field("AMC EDI Order Line No"; Rec."AMC EDI Order Line No")
            {
                ApplicationArea = All;
            }

            field("AMC EDI Line Remarks"; Rec."AMC EDI Line Remarks")
            {
                ApplicationArea = All;
            }

            field("AMCVAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }

            field("AMC Purchasing Code"; Rec."Purchasing Code")
            {
                ApplicationArea = All;
            }

            field("AMC Purchase Order No."; Rec."Purchase Order No.")
            {
                ApplicationArea = All;
            }

            field("AMC Purch. Order Line No."; Rec."Purch. Order Line No.")
            {
                ApplicationArea = All;
            }
        }
        addafter("Location Code")
        {
            field("AMC Unit Price Source"; Rec."AMC Unit Price Source")
            {
                ApplicationArea = All;
            }
            field("AMC Unit Price Date From"; Rec."AMC Unit Price Date From")
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMC Pack Quantity"; Rec."AMC Pack Quantity")
            {
                ApplicationArea = All;
            }
        }
        addafter(Quantity)
        {
            field("AMC Init Quantity"; Rec."AMC Init Quantity")
            {
                ApplicationArea = All;
                Editable = False;
            }
        }
        addafter("Unit of Measure Code")
        {
            field("AMC Pack Unit of Measure"; Rec."AMC Pack Unit of Measure")
            {
                ApplicationArea = All;
            }
            field("AMC Price Currency"; Rec."AMC Price Currency")
            {
                ApplicationArea = All;
            }
            field("AMC Currency Unit Price"; Rec."AMC Currency Unit Price")
            {
                ApplicationArea = All;
            }
            field("AMC EDI Unit Price"; Rec."AMC EDI Unit Price")
            {
                ApplicationArea = All;
                Editable = False;
            }
        }

        addafter("Line Amount")
        {
            field(AMCAmount; Rec.Amount)
            {
                ApplicationArea = All;
                Editable = False;
            }
            field("AMCAmount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
                Editable = False;
            }
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
        modify("Qty. to Assemble to Order")
        {
            Visible = false;
        }
    }

    actions
    {
        addlast(processing)
        {
            action(LotNoSample)
            {
                Caption = 'Nr partii próbek';
                ApplicationArea = All;
                Image = SalesShipment;

                trigger OnAction()
                begin
                    GenerateLots();
                end;
            }
            action(GenerateSample)
            {
                Caption = 'Generuj zapasy próbek';
                ApplicationArea = All;
                Image = SalesShipment;

                trigger OnAction()
                begin
                    PostItems();
                end;
            }
        }
    }

    local procedure GenerateLots()
    var
        SalesHeader: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Location: Record Location;
        QestLine: Text;
        QtyLines: Integer;
        Text_loc: Label 'Czy wygenerowac w liniach nr partii próbek?';
    begin
        SalesHeader.GET(SalesHeader."Document Type"::Order, Rec."Document No.");

        QestLine := STRSUBSTNO(Text_loc);
        IF CONFIRM(QestLine, FALSE) THEN BEGIN

            SalesLine.RESET;
            SalesLine.SETRANGE(SalesLine."Document No.", Rec."Document No.");
            SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
            SalesLine.SETRANGE(Type, SalesLine.Type::Item);
            SalesLine.SETFILTER("AMC Lot No to Create", '<>%1', '');
            QtyLines := SalesLine.COUNT;

            SalesLine.RESET;
            SalesLine.SETRANGE(SalesLine."Document No.", Rec."Document No.");
            SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
            SalesLine.SETRANGE(Type, SalesLine.Type::Item);
            IF SalesLine.FindSet() THEN
                REPEAT
                    IF Location.GET(SalesLine."Location Code") THEN
                        IF Location."AMC Quality Item Test Loc." THEN
                            IF (SalesLine."AMC Lot No to Create" = '') AND (SalesLine.Quantity <= 2) THEN BEGIN

                                SalesLine."AMC Qty to Create" := SalesLine.Quantity;
                                SalesLine."AMC Lot No to Create" := GetNewLot(SalesHeader);
                                SalesLine."AMC Item Exp Date" := CALCDATE('<1Y>', SalesHeader."Order Date");
                                SalesLine.MODIFY;
                            END;
                UNTIL SalesLine.NEXT = 0;
        END;
    end;

    local procedure GetNewLot(SetSalesHeader: Record "Sales Header"): Code[20]
    var
        QtyLines: Integer;
        FindLot: Boolean;
        SalesLineLoc: Record "Sales Line";
        LotNo: Text;
    begin
        QtyLines := 0;
        FindLot := FALSE;

        REPEAT
            QtyLines := QtyLines + 1;
            LotNo := STRSUBSTNO('%1/%2', SetSalesHeader."No.", QtyLines);

            SalesLineLoc.RESET;
            SalesLineLoc.SETRANGE("Document No.", SetSalesHeader."No.");
            SalesLineLoc.SETRANGE("Document Type", SalesLineLoc."Document Type"::Order);
            SalesLineLoc.SETRANGE(Type, SalesLineLoc.Type::Item);
            SalesLineLoc.SETRANGE("AMC Lot No to Create", LotNo);
            IF NOT SalesLineLoc.FINDFIRST THEN
                FindLot := TRUE;
        UNTIL (QtyLines = 100) OR (FindLot = TRUE);

        EXIT(LotNo);
    end;

    local procedure PostItems()
    var
        ItemJnlLine: Record "Item Journal Line";
        SalesLine: Record "Sales Line";
        WarehouseCreateStock: Codeunit "AMC Warehouse Create Stock";
        QestLine: Text;
        Text_Loc: Label 'Czy wygenerowac stan magazynowy dla zapasów?';
        Text_003: Label 'Nie ma zadnych linii do wygenerowania zapasu';
    begin
        ItemJnlLine.RESET;
        ItemJnlLine.SETRANGE("Journal Template Name", 'PROBA_INS');
        ItemJnlLine.SETRANGE("Journal Batch Name", 'ITEM_INS');
        ItemJnlLine.DELETEALL;

        QestLine := STRSUBSTNO(Text_Loc);
        IF CONFIRM(QestLine, FALSE) THEN BEGIN
            SalesLine.RESET;
            SalesLine.SETRANGE(SalesLine."Document No.", Rec."Document No.");
            SalesLine.SETRANGE("Document Type", SalesLine."Document Type"::Order);
            SalesLine.SETFILTER("AMC Qty to Create", '<>0');
            IF SalesLine.FindSet() THEN BEGIN
                REPEAT
                    IF SalesLine."AMC Qty to Create" <> 0 THEN BEGIN
                        CLEAR(WarehouseCreateStock);
                        WarehouseCreateStock.PostItemLine(SalesLine, Rec."Document No.");
                    END;
                UNTIL SalesLine.NEXT = 0;
            END ELSE
                ERROR(Text_003);
        END;
    end;
}
