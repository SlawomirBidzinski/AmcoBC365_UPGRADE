tableextension 50052 "AMC Purchase Line" extends "Purchase Line"
{
    fields
    {
        field(50000; "AMC Main Unit of Measure"; Code[10])
        {
            CalcFormula = lookup(Item."Base Unit of Measure" where("No." = field("No.")));
            Caption = 'Podstawowa Jedn. Miary';
            Editable = false;
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                TestStatusOpen();
            end;
        }
        field(50001; "AMC Rqst Qty to Recpt"; Decimal)
        {
            BlankZero = true;
            Caption = 'Rqst Qty to Recpt';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "AMC Rqst Qty to Recpt" > "Outstanding Quantity" then
                    ERROR(Text_002, "Outstanding Quantity", "Unit of Measure Code");

                "AMC Rqst Qty to Rcpt. (BU)" := "AMC Rqst Qty to Recpt" * "Qty. per Unit of Measure";
            end;
        }
        field(50002; "AMC Receipt Doc No"; Code[20])
        {
            Caption = 'Nr Przyjęcia Magazynowego';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Receipt Qty"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość na Przyjęciu';
            DecimalPlaces = 0 : 5;
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Qty in Base Unit"; Decimal)
        {
            Caption = 'Ilość Jedn Podst';
            DecimalPlaces = 0 : 5;
            Editable = false;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestStatusOpen();
                VALIDATE(Quantity, "AMC Qty in Base Unit" / "Qty. per Unit of Measure");

                if Type = Type::Item then
                    UpdateDirectUnitCost(FIELDNO("AMC Qty in Base Unit"));
            end;
        }
        field(50005; "AMC Direct Unit Cost(BaseUnit)"; Decimal)
        {
            Caption = 'Bezp. Koszt Jedn. Podst.';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestStatusOpen();
                VALIDATE("Direct Unit Cost", "AMC Direct Unit Cost(BaseUnit)" * "Qty. per Unit of Measure");
            end;
        }
        field(50006; "AMC Init Quantity"; Decimal)
        {
            Caption = 'Init Quantity';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                TestStatusOpen();
            end;
        }
        field(50007; "AMC Rqst Qty to Rcpt. (BU)"; Decimal)
        {
            Caption = 'Plan Il. do Przyjęcia (Pods. Jedn)';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if "AMC Rqst Qty to Rcpt. (BU)" > "Outstanding Quantity" * "Qty. per Unit of Measure" then
                    ERROR(Text_002, "Outstanding Quantity" * "Qty. per Unit of Measure", "AMC Main Unit of Measure");

                "AMC Rqst Qty to Recpt" := "AMC Rqst Qty to Rcpt. (BU)" / "Qty. per Unit of Measure";
            end;
        }
        field(50008; "AMC Pack Unit of Measure"; Code[10])
        {
            Caption = 'Jednostka miary opakowania';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                Uom: Record "Unit of Measure";
            begin
                if (xRec."AMC Pack Unit of Measure" <> "AMC Pack Unit of Measure") and
                  ("AMC Pack Unit of Measure" <> '') then begin
                    Uom.GET("AMC Pack Unit of Measure");
                    VALIDATE("AMC Pack Quantity", Uom."AMC Decimal Quantity");
                end;

                if "AMC Pack Unit of Measure" = '' then
                    VALIDATE("AMC Pack Quantity", 0);
            end;
        }
        field(50009; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość w opakowaniu';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Unit Cost (Curr)"; Decimal)
        {
            Caption = 'Cena Jedn. (Wal)';
            DataClassification = CustomerContent;
        }
        field(50013; "AMC Unit Cost Curr Code"; Code[20])
        {
            Caption = 'Kod Waluty Ceny';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Unit Cost Curr Exch. Rate"; Decimal)
        {
            Caption = 'Kurs Waluty dla Ceny Jedn (Wal)';
            DecimalPlaces = 0 : 4;
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Item Reserved"; Decimal)
        {
            CalcFormula = sum("Reservation Entry"."Quantity (Base)" where("Location Code" = field("Location Code"),
                                                                           "Item No." = field("No."),
                                                                           "Source Type" = const(37),
                                                                           "Quantity (Base)" = filter(< 0)));
            Caption = 'Ilość Zapasu Zarezerwowana';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50025; "AMC Last Receipt No"; Code[20])
        {
            Caption = 'Nr Przyjęcia Zakupu';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50026; "AMC Purchase Order Qty"; Decimal)
        {
            CalcFormula = sum("Purchase Line"."AMC Qty in Base Unit" where("Blanket Order No." = field("Document No."),
                                                                        Type = filter(Item),
                                                                        "No." = field("No.")));
            Caption = 'Purchase Order Qty';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50027; "AMC Lot No"; Code[50])
        {
            CalcFormula = lookup("Reservation Entry"."Lot No." where("Item No." = field("No."),
                                                                      "Location Code" = field("Location Code"),
                                                                      "Source Type" = const(39),
                                                                      "Source Subtype" = const(1),
                                                                      "Source ID" = field("Document No."),
                                                                      "Source Ref. No." = field("Line No.")));
            Caption = 'Nr Partii';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50028; "AMC Blank Order Qty."; Decimal)
        {
            CalcFormula = sum("Purchase Line".Quantity where("Document Type" = const("Blanket Order"),
                                                              "Document No." = field("Blanket Order No."),
                                                              "Line No." = field("Blanket Order Line No.")));
            Caption = 'Ilość Zam. Zb.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50029; "AMC Blank Order Rcped. Qty"; Decimal)
        {
            Caption = 'Ilość Przyjęta Zam. Zb';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Purchase Order Status"; Enum "AMC Purchase Order Status")
        {
            Caption = 'Status Zamówienia';
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("AMC Purchase Order Status" = "AMC Purchase Order Status"::Potwierdzone) or
                  ("AMC Purchase Order Status" = "AMC Purchase Order Status"::Anulowane) then begin
                    if "AMC Quantity Ordered" = 0 then
                        "AMC Quantity Ordered" := Quantity;
                    if "AMC Value Ordered" = 0 then
                        "AMC Value Ordered" := "Line Amount";
                end;
            end;
        }
        field(50033; "AMC Purchase Planning Year"; Integer)
        {
            Caption = 'Forecast Planning Year';
            DataClassification = CustomerContent;
        }
        field(50034; "AMC Purchase Planning Week"; Integer)
        {
            Caption = 'Forecast Planning Week';
            DataClassification = CustomerContent;
        }
        field(50035; "AMC Quantity Ordered"; Decimal)
        {
            Caption = 'Quantity Ordered';
            DecimalPlaces = 0 : 5;
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Value Ordered"; Decimal)
        {
            Caption = 'Value Ordered';
            DataClassification = CustomerContent;
        }
        modify("No.")
        {
            TableRelation = if (Type = const(" ")) "Standard Text"
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(false)) "G/L Account" where("Direct Posting" = const(true), "Account Type" = const(Posting), Blocked = const(false))
            else
            if (Type = const("G/L Account"), "System-Created Entry" = const(true)) "G/L Account"
            else
            if (Type = const("Fixed Asset")) "Fixed Asset"
            else
            if (Type = const("Charge (Item)")) "Item Charge"
            else
            if (Type = const(Item)) Item where(Blocked = const(false), "Purchasing Blocked" = const(false),
            "AMC Purchase Item" = const(false), "AMC Out Off Item List" = const(false))
            else
            if (Type = const("Allocation Account")) "Allocation Account"
            else
            if (Type = const(Resource)) Resource;
        }
        modify("Quantity")
        {
            trigger OnAfterValidate()
            begin
                "AMC Qty in Base Unit" := "Qty. per Unit of Measure" * Quantity;

                IF ("AMC Init Quantity" = 0) AND ("AMC Qty in Base Unit" <> 0) then
                    "AMC Init Quantity" := "AMC Qty in Base Unit";
            end;
        }
    }
    var
        Text_002: Label 'Planowana Ilość do Przyjęcia nie może być większa niż %1 %2';
        Text_003: Label 'Nie znaleziono Kodu Wariantu %1 dla kodu Zapasu %2';
}