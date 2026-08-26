tableextension 50080 "AMC Warehouse Receipt Line" extends "Warehouse Receipt Line"
{
    fields
    {
        field(50000; "AMC Terminal Quantity"; Decimal)
        {
            CalcFormula = sum("AMC Terminal Entry".Quantity where("Source ID"=const(1),
                                                               "Document Type"=const("Purchase Receipt"),
                                                               "Document No."=field("No."),
                                                               "Source Line No."=field("Line No.")));
            Caption = 'Ilość odczytana';
            DecimalPlaces = 0:2;
            Description = 'BTC.AL.11Jul13';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50005; "AMC Serial No."; Code[50])
        {
            CalcFormula = lookup("Reservation Entry"."Serial No." where ("Item No."=field("Item No."),
                                                                         "Location Code"=field("Location Code"),
                                                                         "Source ID"=field("Source No."),
                                                                         "Source Ref. No."=field("Source Line No.")));
            FieldClass = FlowField;
        }
        field(50006; "AMC Purchase Unit Price"; Decimal)
        {
            CalcFormula = lookup("Purchase Line"."Unit Cost" where ("Document Type"=const(Order),
                                                                    "Document No."=field("Source No."),
                                                                    "Line No."=field("Source Line No.")));
            Caption = 'Purchase Unit Price';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50007; "AMC Item Unit of Measure"; Code[20])
        {
            CalcFormula = lookup(Item."Base Unit of Measure" where ("No."=field("Item No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50026; "AMC Document Line ID"; Integer)
        {
            Caption = 'Identyfikator wiersza';
            DataClassification = CustomerContent;
            Description = 'AL11Oct12';
        }
        field(50027; "AMC Assigned Lot No Qty."; Decimal)
        {
            CalcFormula = sum("Reservation Entry"."Qty. to Handle (Base)" where ("Item No."=field("Item No."),
                                                                                 "Location Code"=field("Location Code"),
                                                                                 "Source Type"=const(39),
                                                                                 "Source ID"=field("Source No.")));
            Caption = 'Assigned Lot No Qty.';
            DecimalPlaces = 0:5;
            FieldClass = FlowField;
        }
        field(50028; "AMC Term. Doc. Qty"; Decimal)
        {
            CalcFormula = sum("Reservation Entry"."AMC Terminal Scan Qty" where ("Source Type"=field("Source Type"),
                                                                             "Source Subtype"=field("Source Subtype"),
                                                                             "Source ID"=field("Source No."),
                                                                             "Item No."=field("Item No.")));
            Caption = 'Term. Doc. Qty';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    
}    