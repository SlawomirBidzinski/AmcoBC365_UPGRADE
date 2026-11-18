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
                                Rec."Location Code" := 'M.PROBY';
                            END;
                        END;
                    END ELSE BEGIN
                        QuestText := STRSUBSTNO(Text_003, Rec.Description);
                        IF CONFIRM(QuestText, FALSE) THEN BEGIN
                            Rec."AMC Set Item" := Rec.CreateItemRw('');
                            Rec."Location Code" := 'M.PROBY';
                        END;
                    END;
                end;
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
}
