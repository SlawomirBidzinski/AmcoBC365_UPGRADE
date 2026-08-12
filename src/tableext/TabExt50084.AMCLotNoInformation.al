tableextension 50084 "AMC Lot No. Information" extends "Lot No. Information"
{
    fields
    {
        field(50000; "AMC QC Status"; Code[20])
        {
            CalcFormula = lookup("Item Ledger Entry"."AMC QC Status" where("Item No." = field("Item No."),
                                                                        "Variant Code" = field("Variant Code"),
                                                                        "Lot No." = field("Lot No."),
                                                                        "Location Code" = field("Location Filter"),
                                                                        Open = const(true),
                                                                        Positive = const(true)));
            Caption = 'Status KJ';
            Description = 'AL.20Nov12';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "AMC Ext. Lot No."; Code[20])
        {
            Caption = 'Zewnętrzny nr partii';
            DataClassification = CustomerContent;
            Description = 'AL.30Dec12';
        }
        field(50002; "AMC Expiration Date"; Date)
        {
            CalcFormula = lookup("Item Ledger Entry"."Expiration Date" where("Item No." = field("Item No."),
                                                                              "Variant Code" = field("Variant Code"),
                                                                              "Lot No." = field("Lot No."),
                                                                              "Location Code" = field("Location Filter"),
                                                                              "Expiration Date" = field("Date Filter"),
                                                                              Positive = const(true)));
            Caption = 'Data ważności';
            Description = 'AL.30Dec12';
            FieldClass = FlowField;
        }
        field(50003; "AMC Bin Inventory"; Decimal)
        {
            BlankZero = true;
            CalcFormula = sum("Warehouse Entry"."Qty. (Base)" where("Item No." = field("Item No."),
                                                                     "Variant Code" = field("Variant Code"),
                                                                     "Location Code" = field("Location Filter"),
                                                                     "Bin Code" = field("Bin Filter"),
                                                                     "Lot No." = field("Lot No.")));
            Caption = 'Zapasy w pojemniku';
            DecimalPlaces = 0 : 5;
            Description = 'AL.15Jan13';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50004; "AMC Pack Unit of Measure"; Code[10])
        {
            Caption = 'Jednostka miary opakowania';
            DataClassification = CustomerContent;
            Description = 'AL.28Jan12';
            TableRelation = "Unit of Measure";

            trigger OnValidate()
            var
                Uom: Record 204;
            begin
            end;
        }
        field(50005; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość w opakowaniu';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 3;
            Description = 'AL.28Jan12';
        }
        field(50006; "AMC Pick Quantity (Base)"; Decimal)
        {
            CalcFormula = sum("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Location Code" = field("Location Filter"),
                                                                                         "Bin Code" = field("Bin Filter"),
                                                                                         "Item No." = field("Item No."),
                                                                                         "Variant Code" = field("Variant Code"),
                                                                                         "Action Type" = const(Take),
                                                                                         "Lot No." = field("Lot No.")));
            Caption = 'Pick Quantity (Base)';
            DecimalPlaces = 0 : 5;
            Description = 'AL.07Feb13';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50007; "AMC Receipt Date"; Date)
        {
            Caption = 'Data przyjęcia';
            DataClassification = CustomerContent;
            Description = 'AL.21Nov13';
        }
        field(50008; "AMC Search Vendor Name"; Code[50])
        {
            Caption = 'Nazwa szukana dostawcy';
            DataClassification = CustomerContent;
            Description = 'AL.21Nov13';
        }
    }

}