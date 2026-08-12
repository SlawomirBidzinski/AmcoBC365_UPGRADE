table 50054 "AMC Whse. Int. Transfer Line"
{
    Caption = 'Whse. Int. Transfer Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Nr Dokumentu';
        }
        field(2; "Transaction Type"; Option)
        {
            Caption = 'Typ Transakcji';
            OptionCaption = ' ,Internal Transfer';
            OptionMembers = " ","Internal Transfer";
        }
        field(3; "Document Date"; Date)
        {
            Caption = 'Data Dokumentu';
        }
        field(4; "Line No."; Integer)
        {
            Caption = 'Nr Linii';
        }
        field(5; "Item No."; Code[20])
        {
            Caption = 'Nr Zapasu';
            TableRelation = Item;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");

                IF ItemRec.GET("Item No.") THEN BEGIN
                    "Item Description" := ItemRec.Description;
                    "Unit of Measure Code" := ItemRec."Base Unit of Measure";
                END ELSE BEGIN
                    "Item Description" := '';
                    "Unit of Measure Code" := '';
                END;

                WarehouseIntTransferHeader.RESET;
                WarehouseIntTransferHeader.SETRANGE("Document No.", "Document No.");
                WarehouseIntTransferHeader.SETRANGE("Transaction Type", "Transaction Type");
                IF WarehouseIntTransferHeader.FINDSET THEN
                    IF WarehouseIntTransferHeader."Document Status" = WarehouseIntTransferHeader."Document Status"::Open THEN
                        ERROR(Text_001);


                "Location Code" := WarehouseIntTransferHeader."Location Code";
                "New Location Code" := WarehouseIntTransferHeader."New Location Code";
                "New Bin Code" := WarehouseIntTransferHeader."New Bin Code";

                "Document Date" := WarehouseIntTransferHeader."Document Date";
                "Posting Date" := WarehouseIntTransferHeader."Posting Date";
            end;
        }
        field(6; "Item Description"; Text[100])
        {
            Caption = 'Opis Zapasu';
        }
        field(7; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Jednostka Miary Zapasu';
            TableRelation = "Item Unit of Measure".Code WHERE("Item No." = FIELD("Item No."));
        }
        field(8; "Location Code"; Code[20])
        {
            Caption = 'Kod Lokalizacji';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(9; "Bin Code"; Code[20])
        {
            Caption = 'Kod Pojemnika';
            trigger OnValidate()
            begin
                ERROR(Text_001);
            end;

            trigger OnLookup()
            begin

                BinContent.RESET;
                BinContent.SETRANGE("Item No.", "Item No.");
                BinContent.SETRANGE("Location Code", "Location Code");
                if "Lot No." <> '' then
                    BinContent.SETRANGE("Lot No. Filter", "Lot No.");

                IF BinContent.FINDFIRST() THEN BEGIN
                    CLEAR(BinContentList);
                    BinContentList.SETTABLEVIEW(BinContent);
                    BinContentList.SETRECORD(BinContent);
                    BinContentList.LOOKUPMODE(TRUE);
                    IF BinContentList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        BinContentList.GETRECORD(BinContent);
                        "Bin Code" := BinContent."Bin Code";
                        "Lot No." := '';
                    END;
                END;
            end;
        }
        field(10; "New Location Code"; Code[20])
        {
            Caption = 'Nowy Kod Lokalizacji';
            TableRelation = Location WHERE("Use As In-Transit" = CONST(false));
        }
        field(11; "New Bin Code"; Code[20])
        {
            Caption = 'Nowy Kod Pojemnika';
            TableRelation = Bin.Code WHERE("Location Code" = FIELD("New Location Code"));
        }
        field(12; Quantity; Decimal)
        {
            Caption = 'Ilość';
            DecimalPlaces = 0 : 10;
        }
        field(20; "Lot No."; Code[20])
        {
            Caption = 'Nr Partii';
            trigger OnLookup()
            begin
                LotNoInformation.RESET;
                LotNoInformation.SETRANGE("Item No.", "Item No.");
                LotNoInformation.SETRANGE("Location Filter", "Location Code");
                IF "Bin Code" <> '' THEN
                    LotNoInformation.SETFILTER("Bin Filter", "Bin Code");
                LotNoInformation.SETFILTER("AMC Bin Inventory", '<>0');
                IF LotNoInformation.FINDFIRST THEN BEGIN
                    CLEAR(LotList);
                    LotList.SETTABLEVIEW(LotNoInformation);
                    LotList.SETRECORD(LotNoInformation);
                    LotList.LOOKUPMODE(TRUE);
                    IF LotList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                        LotList.GETRECORD(LotNoInformation);
                        "Lot No." := LotNoInformation."Lot No."
                    END;
                END
            end;
        }
        field(30; Posted; Boolean)
        {
            Caption = 'Zaksięgowany';
        }
        field(32; "Posting Date"; Date)
        {
            Caption = 'Data Księgowania';
        }
        field(33; "Source Warehouse Qty"; Decimal)
        {
            CalcFormula = Sum("Warehouse Entry".Quantity WHERE("Item No." = FIELD("Item No."),
                                                                "Location Code" = FIELD("Location Code"),
                                                                "Bin Code" = FIELD("Bin Code"),
                                                                "Unit of Measure Code" = FIELD("Unit of Measure Code")));
            Caption = 'Ilość Pojemn. Źródł.';
            FieldClass = FlowField;
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                Rec.ShowDimensions();
            end;

            trigger OnValidate()
            begin
                DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
            end;
        }
        field(481; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
            end;
        }
        field(482; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
                                                          Blocked = const(false));

            trigger OnValidate()
            begin
                Rec.ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
            end;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Transaction Type", "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Item No.") { }
    }

    procedure ShowDimensions()
    begin
        "Dimension Set ID" :=
          DimMgt.EditDimensionSet("Dimension Set ID", StrSubstNo('%1 %2 %3', TableCaption(), "Document No.", "Line No."));
        DimMgt.UpdateGlobalDimFromDimSetID("Dimension Set ID", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code");
    end;

    procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
    end;

    var
        ItemRec: Record Item;
        ItemLedgerEntry: Record "Item Ledger Entry";
        LotNoInformation: Record "Lot No. Information";
        BinContent: Record "Bin Content";
        WarehouseIntTransferHeader: Record "AMC Whse. Int. Transfer Header";
        BinContentList: Page "Item Bin Contents";
        LotList: Page "Lot No. Information List";
        DimMgt: Codeunit DimensionManagement;
        Text_001: Label 'Przed dodaniem linii należy zwolnić dokument';
        Text_002: Label 'Nie można usuwać zasksięgowanych linii';
        Text_003: Label 'Nie można modyfikować zasksięgowanych linii';

    trigger OnModify()
    begin
        IF Posted = TRUE THEN
            ERROR(Text_003);
    end;

    trigger OnDelete()
    begin
        IF Posted = TRUE THEN
            ERROR(Text_002);
    end;
}
