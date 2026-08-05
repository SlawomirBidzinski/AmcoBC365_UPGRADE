tableextension 50067 "AMC Item Ledger Entry" extends "Item Ledger Entry"
{
    fields
    {
        field(50000; "AMC QC Status"; Code[20])
        {
            Caption = 'QC Status'; //TODO 'Status KJ';
            Description = 'AL.19Nov12';
            TableRelation = "AMC QC Status".Code;
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Ext. Lot No."; Code[20])
        {
            Caption = 'Ext. Lot No.'; //TODO 'Zewnętrzny nr partii';
            Description = 'AL.30Dec12';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Sales Item"; Boolean)
        {
            Caption = 'Sales Item'; //TODO 'Sales Item';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Purchase Item"; Boolean)
        {
            Caption = 'Purchase Item';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Item Description"; Text[100])
        {
            CalcFormula = lookup(Item.Description where("No." = field("Item No.")));
            Caption = 'Item Description'; //TODO 'Nazwa Zapasu';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "AMC Pack Unit of Measure"; Code[10])
        {
            Caption = 'Pack Unit of Measure'; //TODO 'Jednostka miary opakowania';
            Description = 'AL.28Jan12';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Pack Quantity'; //TODO 'Ilość w opakowaniu';
            DecimalPlaces = 0 : 3;
            Description = 'AL.28Jan12';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Production Date"; Date)
        {
            Caption = 'Production Date'; //TODO 'Production Date';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Date Filter"; Date)
        {
            Caption = 'Date Filter'; //TODO 'Filtr Daty';
            FieldClass = FlowFilter;
        }
        field(50009; "AMC Item Production Code"; Code[20])
        {
            //FIXME brak Prod. Order No. i Prod. Order Line No.

            CalcFormula = Lookup("Production Order"."Source No." WHERE(Status = CONST(Finished), "No." = FIELD("Document No.")));

            Caption = 'Item Production Code';
            Editable = false;
            FieldClass = FlowField;
            TableRelation = Item;
        }
        field(50010; "AMC Item Production Lot No"; Code[50])
        {
            //FIXME brak Prod. Order No. i Prod. Order Line No.

            CalcFormula = Lookup("Item Ledger Entry"."Lot No." WHERE("Entry Type" = CONST(Output),
                                                                      "Document No." = FIELD("Document No."),
                                                                      "Order Line No." = FIELD("Document Line No.")));


            Caption = 'Item Production Lot No'; //TODO 'Nr Partii Zapasu Produkcji';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "AMC Purchase Invoice No"; Code[20])
        {
            CalcFormula = lookup("Value Entry"."Document No." where("Item Ledger Entry No." = field("Entry No."),
                                                                     "Document Type" = filter("Purchase Invoice" | "Purchase Credit Memo")));
            Caption = 'Purchase Invoice No';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "AMC Item Test PW"; Boolean)
        {
            Caption = 'Item Test PW'; //TODO 'Przyjęcie Próbek PW';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Set Item Control"; Boolean)
        {
            Caption = 'Set Item Control';
            DataClassification = CustomerContent;
        }

    }


}