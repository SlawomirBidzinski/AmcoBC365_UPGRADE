tableextension 50082 "AMC Warehouse Activity Line" extends "Warehouse Activity Line"
{
    fields
    {
        field(50000; "AMC QC Status"; Code[20])
        {
            CalcFormula = lookup("Item Ledger Entry"."AMC QC Status" where("Item No." = field("Item No."),
                                                                        "Variant Code" = field("Variant Code"),
                                                                        "Lot No." = field("Lot No."),
                                                                        "Location Code" = field("Location Code"),
                                                                        Open = const(true),
                                                                        Positive = const(true)));
            Caption = 'Status KJ';
            Description = 'AL.20Nov12';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "AMC Qty per Item"; Decimal)
        {
            CalcFormula = sum("Warehouse Activity Line".Quantity where("Activity Type" = field("Activity Type"),
                                                                        "Item No." = field("Item No."),
                                                                        "No." = field("No."),
                                                                        "Action Type" = const(Take)));
            Caption = 'Ilość - Zapas';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002; "AMC Qty per Lot No"; Decimal)
        {
            CalcFormula = sum("Warehouse Activity Line".Quantity where("Activity Type" = field("Activity Type"),
                                                                        "Item No." = field("Item No."),
                                                                        "No." = field("No."),
                                                                        "Lot No." = field("Lot No."),
                                                                        "Action Type" = const(Take)));
            Caption = 'Ilość wg Partii';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50003; "AMC Qty on Order"; Decimal)
        {
            CalcFormula = sum("Sales Line".Quantity where("Document Type" = const(Order),
                                                           "Document No." = field("Source No."),
                                                           "Line No." = field("Source Line No.")));
            Caption = 'Ilość na Zamówieniu';
            FieldClass = FlowField;
        }
        field(50004; "AMC Qty on Inv"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("Item No."),
                                                                              "Location Code" = field("Location Code"),
                                                                              "Lot No." = field("Lot No.")));
            Caption = 'Ilość na Magazyn';
            FieldClass = FlowField;
        }
        field(50005; "AMC Qty on Bin"; Decimal)
        {
            CalcFormula = sum("Warehouse Entry"."Qty. (Base)" where("Location Code" = field("Location Code"),
                                                                     "Zone Code" = field("Zone Code"),
                                                                     "Bin Code" = field("Bin Code"),
                                                                     "Item No." = field("Item No."),
                                                                     "Lot No." = field("Lot No.")));
            Caption = 'Ilość w pojemniku';
            DecimalPlaces = 2 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50006; "AMC Pick Quantity (Base)"; Decimal)
        {
            CalcFormula = sum("Warehouse Activity Line"."Qty. Outstanding (Base)" where("Location Code" = field("Location Code"),
                                                                                         "Bin Code" = field("Bin Code"),
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
        field(50007; "AMC Pick Split Source Line No."; Integer)
        {
            Caption = 'Nr źródła wiersza podz. pobrania';
            DataClassification = CustomerContent;
            Description = 'AL.16Jul13';
        }
        field(50008; "AMC Item for KJ"; Boolean)
        {
            Caption = 'Item for KJ';
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                WarehouseActivityLine_Loc: Record "Warehouse Activity Line";
                Item_KJ_Weight: Decimal;
            begin
                if ("AMC Item for KJ" = true) and (xRec."AMC Item for KJ" <> "AMC Item for KJ") then begin
                    if "Qty. Handled" <> 0 then
                        ERROR(Text_004);

                    Item_KJ_Weight := 0;

                    if Item.GET("Item No.") then
                        case Item."AMC Item Type" of
                            Item."AMC Item Type"::Surowce:
                                if Item."AMC Item KJ Weight [kg]" <> 0 then
                                    Item_KJ_Weight := Item."AMC Item KJ Weight [kg]";


                            Item."AMC Item Type"::Towary,
                          Item."AMC Item Type"::Wyroby,
                          Item."AMC Item Type"::Opakowania,
                          Item."AMC Item Type"::Próba,
                          Item."AMC Item Type"::Półprodukt,
                          Item."AMC Item Type"::"Tymcz. R&D":
                                ERROR(Text_005);

                        end;


                    PurchasesPayablesSetup.GET();
                    if PurchasesPayablesSetup."AMC Use Item KJ Registry" = true then begin
                        if PurchasesPayablesSetup."AMC Item KJ Source Location" = "Location Code" then begin
                            if "Unit of Measure Code" = 'KG' then
                                if Item_KJ_Weight <> 0 then
                                    "AMC Item Qty for KJ" := Item_KJ_Weight
                                else
                                    "AMC Item Qty for KJ" := PurchasesPayablesSetup."AMC Item KJ Weight [kg]";
                            if "Unit of Measure Code" = 'SZT' then
                                "AMC Item Qty for KJ" := PurchasesPayablesSetup."AMC Item KJ Quantity [szt]";
                            "AMC Item Location for KJ" := PurchasesPayablesSetup."AMC Item KJ Location";
                        end else
                            ERROR(Text_002, "Location Code");

                    end else
                        ERROR(Text_003);

                end else begin
                    "AMC Item Location for KJ" := '';
                    "AMC Item Qty for KJ" := 0;
                end;

                case "Action Type" of
                    "Action Type"::Take:
                        begin
                            WarehouseActivityLine_Loc.RESET();
                            WarehouseActivityLine_Loc.SETRANGE("Activity Type", "Activity Type");
                            WarehouseActivityLine_Loc.SETRANGE("No.", "No.");
                            WarehouseActivityLine_Loc.SETRANGE("Source Line No.", "Source Line No.");
                            WarehouseActivityLine_Loc.SETRANGE("Lot No.", "Lot No.");
                            WarehouseActivityLine_Loc.SETRANGE("Action Type", WarehouseActivityLine_Loc."Action Type"::Place);
                            if WarehouseActivityLine_Loc.FINDFIRST() then begin
                                WarehouseActivityLine_Loc."AMC Item for KJ" := "AMC Item for KJ";
                                WarehouseActivityLine_Loc."AMC Item Qty for KJ" := "AMC Item Qty for KJ";
                                WarehouseActivityLine_Loc."AMC Item Location for KJ" := "AMC Item Location for KJ";
                                WarehouseActivityLine_Loc.MODIFY();
                            end;
                        end;
                    "Action Type"::Place:
                        begin
                            WarehouseActivityLine_Loc.RESET();
                            WarehouseActivityLine_Loc.SETRANGE("Activity Type", "Activity Type");
                            WarehouseActivityLine_Loc.SETRANGE("No.", "No.");
                            WarehouseActivityLine_Loc.SETRANGE("Source Line No.", "Source Line No.");
                            WarehouseActivityLine_Loc.SETRANGE("Lot No.", "Lot No.");
                            WarehouseActivityLine_Loc.SETRANGE("Action Type", WarehouseActivityLine_Loc."Action Type"::Take);
                            if WarehouseActivityLine_Loc.FINDFIRST() then begin
                                WarehouseActivityLine_Loc."AMC Item for KJ" := "AMC Item for KJ";
                                WarehouseActivityLine_Loc."AMC Item Qty for KJ" := "AMC Item Qty for KJ";
                                WarehouseActivityLine_Loc."AMC Item Location for KJ" := "AMC Item Location for KJ";
                                WarehouseActivityLine_Loc.MODIFY();
                            end;
                        end;
                end;
            end;
        }
        field(50009; "AMC Item Qty for KJ"; Decimal)
        {
            Caption = 'Item Qty for KJ';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                WarehouseActivityLine_Loc: Record "Warehouse Activity Line";
            begin
                if "AMC Item for KJ" = false then
                    ERROR(Text_006);

                if ("AMC Item for KJ" = true) and ("AMC Item KJ Qty registered" = 0) then begin
                    if "AMC Item Qty for KJ" = 0 then
                        ERROR(Text_007);

                    if "AMC Item Qty for KJ" < 0 then
                        ERROR(Text_008);

                    if "AMC Item Qty for KJ" >= Quantity then
                        ERROR(Text_009);
                end;

                case "Action Type" of
                    "Action Type"::Take:
                        begin
                            WarehouseActivityLine_Loc.RESET();
                            WarehouseActivityLine_Loc.SETRANGE("Activity Type", "Activity Type");
                            WarehouseActivityLine_Loc.SETRANGE("No.", "No.");
                            WarehouseActivityLine_Loc.SETRANGE("Source Line No.", "Source Line No.");
                            WarehouseActivityLine_Loc.SETRANGE("Lot No.", "Lot No.");
                            WarehouseActivityLine_Loc.SETRANGE("Action Type", WarehouseActivityLine_Loc."Action Type"::Place);
                            if WarehouseActivityLine_Loc.FINDFIRST() then begin
                                WarehouseActivityLine_Loc."AMC Item Qty for KJ" := "AMC Item Qty for KJ";
                                WarehouseActivityLine_Loc.MODIFY();
                            end;
                        end;
                    "Action Type"::Place:
                        begin
                            WarehouseActivityLine_Loc.RESET();
                            WarehouseActivityLine_Loc.SETRANGE("Activity Type", "Activity Type");
                            WarehouseActivityLine_Loc.SETRANGE("No.", "No.");
                            WarehouseActivityLine_Loc.SETRANGE("Source Line No.", "Source Line No.");
                            WarehouseActivityLine_Loc.SETRANGE("Lot No.", "Lot No.");
                            WarehouseActivityLine_Loc.SETRANGE("Action Type", WarehouseActivityLine_Loc."Action Type"::Take);
                            if WarehouseActivityLine_Loc.FINDFIRST() then begin
                                WarehouseActivityLine_Loc."AMC Item Qty for KJ" := "AMC Item Qty for KJ";
                                WarehouseActivityLine_Loc.MODIFY();
                            end;
                        end;
                end;
            end;
        }
        field(50010; "AMC Item Location for KJ"; Code[20])
        {
            Caption = 'Item Location for KJ';
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(50011; "AMC Item KJ Qty registered"; Decimal)
        {
            BlankZero = true;
            DataClassification = CustomerContent;
            Caption = 'Item KJ Qty registered';
            DecimalPlaces = 0 : 3;
            Editable = false;
        }
        field(50100; "AMC Terminal Quantity"; Decimal)
        {
            CalcFormula = sum("AMC Terminal Entry".Quantity where("Document No." = field("No."),
                                                               "Source Line No." = field("Line No.")));
            Caption = 'Ilość odczytana';
            Description = 'AL.11Jul13';
            FieldClass = FlowField;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        WMSMgt: Codeunit "WMS Management";
        Text001: Label 'You cannot rename a %1.';
        Text002: Label 'You cannot handle more than the outstanding %1 units.';
        Text003: Label 'must not be %1';
        Text004: Label 'If you delete %1 %2, %3 %4, %5 %6\the quantity to %7 will be imbalanced.\Do you still want to delete the %8?';
        Text005: Label 'You must not change the %1 in breakbulk lines.';
        Text006: Label 'The update was interrupted to respect the warning.';
        Location: Record Location;
        Item: Record Item;
        Bin: Record Bin;
        ItemUnitOfMeasure: Record "Item Unit of Measure";
        ItemTrackingCode: Record "Item Tracking Code";
        PurchasesPayablesSetup: Record "Purchases & Payables Setup";
        HideValidationDialog: Boolean;
        Text007: Label 'You must not split breakbulk lines.';
        Text008: Label 'Quantity available to pick is not enough to fill in all the lines.';
        Text009: Label 'If you delete the %1\you must recreate related Warehouse Worksheet Lines manually.\\Do you want to delete the %1?';
        Text011: Label 'You cannot enter the %1 of the %2 as %3.';
        Text012: Label 'The %1 %2 exceeds the quantity available to pick %3 of the %4.\Do you still want to enter this %5?';
        Text013: Label 'All related Warehouse Activity Lines are deleted.';
        ConfirmDeleteLine: Boolean;
        SNRequired: Boolean;
        LNRequired: Boolean;
        Text014: Label '%1 %2 has already been reserved for another document.';
        Text015: Label 'The total available quantity has already been applied.';
        Text016: Label 'Reserved item %1 is not on inventory.';
        Text017: Label '%1 %2 is not available on inventory or it has already been reserved for another document.';
        UseBaseQty: Boolean;
        Text_001: Label 'Numer Partii można modyfikować jedynie na Podjęciu';
        Text_017: Label '%1 %2 is not available on inventory or it has already been reserved for another document.';
        Text_002: Label 'Lokalizacja %1 nie podlega rejestrowaniu próby KJ';
        Text_003: Label 'Ustawienie rejestrowania próby KJ wyłączone';
        Text_004: Label 'Zapasy w części odłożone.\Niemożliwe automatyczne zarejestrowanie próby KJ.';
        Text_005: Label 'Przyjęcie prób dla zapasów można\zarejestrować tylko dla Zapasów - Surowców.';
        Text_006: Label 'Nie można przypisać ilości przy wyłączonej opcji Zapas Próby KJ';
        Text_007: Label 'Nie można wprowadzić w pole Ilość wartość 0\jeżeli włączona jest opcja Zapas Próby KJ';
        Text_008: Label 'Ilość Próby Zapasu KJ nie może być mniejsza od zera.';
        Text_009: Label 'Ilość Próby Zapasu KJ musi być mniejsza od ilości odłożenia zapasu';
        Text_010: Label 'Nie można zmieniać ilości przy włączonej opcji Zapas Próby KJ';

    procedure TermPickSplitLine(var WhseActivLine: Record "Warehouse Activity Line")
    var
        NewWhseActivLine: Record "Warehouse Activity Line";
        NewWhseActivLine2: Record "Warehouse Activity Line";
        WhseActivLine2: Record "Warehouse Activity Line";
        LineSpacing2: Integer;
        LineSpacing: Integer;
    begin
        //---AL.16Jul13
        WhseActivLine.TESTFIELD("Qty. to Handle");
        if WhseActivLine."Activity Type" = WhseActivLine."Activity Type"::"Put-away" then begin
            if WhseActivLine."Breakbulk No." <> 0 then
                ERROR(Text007);
            WhseActivLine.TESTFIELD("Action Type", WhseActivLine."Action Type"::Place);
        end;

        //--Finding Place Line
        WhseActivLine2.SETRANGE("Activity Type", "Activity Type"::Pick);
        WhseActivLine2.SETRANGE("Action Type", "Action Type"::Place);
        WhseActivLine2.SETRANGE("No.", WhseActivLine."No.");
        //---AL.17Jul13
        WhseActivLine2.SETRANGE("Item No.", WhseActivLine."Item No.");
        //+++AL.17Jul13
        WhseActivLine2.SETRANGE("Whse. Document Type", WhseActivLine."Whse. Document Type");
        WhseActivLine2.SETRANGE("Whse. Document No.", WhseActivLine."Whse. Document No.");
        WhseActivLine2.SETRANGE("Whse. Document Line No.", WhseActivLine."Whse. Document Line No.");
        WhseActivLine2.SETRANGE("Breakbulk No.", WhseActivLine."Breakbulk No.");
        WhseActivLine2.SETRANGE("Source No.", WhseActivLine."Source No.");
        WhseActivLine2.SETRANGE("Item No.", WhseActivLine."Item No.");
        WhseActivLine2.SETRANGE("Source Line No.", WhseActivLine."Source Line No.");
        WhseActivLine2.SETRANGE("Source Subline No.", WhseActivLine."Source Subline No.");
        WhseActivLine2.SETRANGE("Serial No.", WhseActivLine."Serial No.");
        WhseActivLine2.SETRANGE("Lot No.", WhseActivLine."Lot No.");
        if WhseActivLine2.FINDFIRST() then begin
            NewWhseActivLine2 := WhseActivLine2;
            NewWhseActivLine2.SETRANGE("No.", WhseActivLine2."No.");
            if NewWhseActivLine2.FIND('>') then
                LineSpacing2 :=
                  (NewWhseActivLine2."Line No." - WhseActivLine2."Line No.") div 2
            else
                LineSpacing2 := 10000;
        end;

        //+++Finding Place line

        //---Create Line for Take

        NewWhseActivLine := WhseActivLine;
        NewWhseActivLine.SETRANGE("No.", WhseActivLine."No.");
        if NewWhseActivLine.FIND('>') then
            LineSpacing :=
              (NewWhseActivLine."Line No." - WhseActivLine."Line No.") div 2
        else
            LineSpacing := 10000;

        NewWhseActivLine.RESET();
        NewWhseActivLine.INIT();
        NewWhseActivLine := WhseActivLine;
        NewWhseActivLine."Line No." := NewWhseActivLine."Line No." + LineSpacing;
        WhseActivLine.CALCFIELDS("AMC Terminal Quantity");
        NewWhseActivLine.Quantity :=
          WhseActivLine."Qty. Outstanding" - WhseActivLine."AMC Terminal Quantity";
        ;
        NewWhseActivLine."Qty. (Base)" :=
          WhseActivLine."Qty. Outstanding (Base)" - WhseActivLine."AMC Terminal Quantity";
        ;
        NewWhseActivLine."Qty. Outstanding" := NewWhseActivLine.Quantity;
        NewWhseActivLine."Qty. Outstanding (Base)" := NewWhseActivLine."Qty. (Base)";
        NewWhseActivLine."Qty. to Handle" := NewWhseActivLine.Quantity;
        NewWhseActivLine."Qty. to Handle (Base)" := NewWhseActivLine."Qty. (Base)";
        NewWhseActivLine."Qty. Handled" := 0;
        NewWhseActivLine."Qty. Handled (Base)" := 0;
        GetLocation("Location Code");
        if Location."Directed Put-away and Pick" then begin
            WMSMgt.CalcCubageAndWeight(
              NewWhseActivLine."Item No.", NewWhseActivLine."Unit of Measure Code",
              NewWhseActivLine."Qty. to Handle", NewWhseActivLine.Cubage, NewWhseActivLine.Weight);
            if not
              (((NewWhseActivLine."Activity Type" = NewWhseActivLine."Activity Type"::"Put-away") and
                (NewWhseActivLine."Action Type" = NewWhseActivLine."Action Type"::Take)) or
               ((NewWhseActivLine."Activity Type" = NewWhseActivLine."Activity Type"::Pick) and
                (NewWhseActivLine."Action Type" = NewWhseActivLine."Action Type"::Place)) or
               ("Breakbulk No." <> 0))
            then begin
                //NewWhseActivLine."Zone Code" := '';
                //NewWhseActivLine."Bin Code" := '';
                NewWhseActivLine."Lot No." := '';

            end;
        end;
        NewWhseActivLine.INSERT();
        //+++Create Line for Take

        //---Create Line for Place
        NewWhseActivLine2 := WhseActivLine2;
        NewWhseActivLine2.SETRANGE("No.", WhseActivLine2."No.");
        if NewWhseActivLine2.FIND('>') then
            LineSpacing2 :=
              (NewWhseActivLine2."Line No." - WhseActivLine2."Line No.") div 2
        else
            LineSpacing2 := 10000;

        NewWhseActivLine2.RESET();
        NewWhseActivLine2.INIT();
        NewWhseActivLine2 := WhseActivLine2;
        NewWhseActivLine2."Line No." := NewWhseActivLine2."Line No." + LineSpacing2;
        NewWhseActivLine2.Quantity :=
          WhseActivLine2."Qty. Outstanding" - WhseActivLine."AMC Terminal Quantity";
        ;
        NewWhseActivLine2."Qty. (Base)" :=
          WhseActivLine2."Qty. Outstanding (Base)" - WhseActivLine."AMC Terminal Quantity";
        ;
        NewWhseActivLine2."Qty. Outstanding" := NewWhseActivLine.Quantity;
        NewWhseActivLine2."Qty. Outstanding (Base)" := NewWhseActivLine."Qty. (Base)";
        NewWhseActivLine2."Qty. to Handle" := NewWhseActivLine2.Quantity;
        NewWhseActivLine2."Qty. to Handle (Base)" := NewWhseActivLine2."Qty. (Base)";
        NewWhseActivLine2."Qty. Handled" := 0;
        NewWhseActivLine2."Qty. Handled (Base)" := 0;
        GetLocation("Location Code");
        if Location."Directed Put-away and Pick" then begin
            WMSMgt.CalcCubageAndWeight(
              NewWhseActivLine2."Item No.", NewWhseActivLine2."Unit of Measure Code",
              NewWhseActivLine2."Qty. to Handle", NewWhseActivLine2.Cubage, NewWhseActivLine2.Weight);
            /*
            IF NOT
              (((NewWhseActivLine2."Activity Type" = NewWhseActivLine2."Activity Type"::"Put-away") AND
                (NewWhseActivLine2."Action Type" = NewWhseActivLine2."Action Type"::Take)) OR
               ((NewWhseActivLine2."Activity Type" = NewWhseActivLine2."Activity Type"::Pick) AND
                (NewWhseActivLine2."Action Type" = NewWhseActivLine2."Action Type"::Place)) OR
               ("Breakbulk No." <> 0))
            THEN BEGIN
            */
            //NewWhseActivLine."Zone Code" := '';
            //NewWhseActivLine."Bin Code" := '';
            NewWhseActivLine2."Lot No." := '';

            //END;
        end;
        NewWhseActivLine2.INSERT();

        //++++Create line for Place


        WhseActivLine.Quantity := WhseActivLine."AMC Terminal Quantity" + WhseActivLine."Qty. Handled";
        WhseActivLine."Qty. (Base)" :=
          WhseActivLine."AMC Terminal Quantity" + WhseActivLine."Qty. Handled (Base)";
        WhseActivLine."Qty. to Handle" := WhseActivLine.Quantity;
        WhseActivLine."Qty. to Handle (Base)" := WhseActivLine."Qty. (Base)";
        WhseActivLine."Qty. Outstanding" := WhseActivLine."AMC Terminal Quantity";
        WhseActivLine."Qty. Outstanding (Base)" := WhseActivLine."AMC Terminal Quantity";
        if Location."Directed Put-away and Pick" then
            WMSMgt.CalcCubageAndWeight(
              WhseActivLine."Item No.", WhseActivLine."Unit of Measure Code",
              WhseActivLine."Qty. to Handle", WhseActivLine.Cubage, WhseActivLine.Weight);
        WhseActivLine.MODIFY();

        //---Update Splited Place Line
        WhseActivLine2.Quantity := WhseActivLine."AMC Terminal Quantity" + WhseActivLine2."Qty. Handled";
        WhseActivLine2."Qty. (Base)" :=
          WhseActivLine."AMC Terminal Quantity" + WhseActivLine2."Qty. Handled (Base)";
        WhseActivLine2."Qty. to Handle" := WhseActivLine2.Quantity;
        WhseActivLine2."Qty. to Handle (Base)" := WhseActivLine2."Qty. (Base)";
        WhseActivLine2."Qty. Outstanding" := WhseActivLine."AMC Terminal Quantity";
        WhseActivLine2."Qty. Outstanding (Base)" := WhseActivLine."AMC Terminal Quantity";
        if Location."Directed Put-away and Pick" then
            WMSMgt.CalcCubageAndWeight(
              WhseActivLine2."Item No.", WhseActivLine2."Unit of Measure Code",
              WhseActivLine2."Qty. to Handle", WhseActivLine2.Cubage, WhseActivLine2.Weight);
        WhseActivLine2.MODIFY();

    end;

    procedure GetLocation(LocationCode: Code[10])
    begin
        if LocationCode = '' then
            CLEAR(Location)
        else
            if Location.Code <> LocationCode then
                Location.GET(LocationCode);
    end;

    procedure TDeleteRelatedWhseActivLines(WhseActivLine: Record 5767; CalledFromHeader: Boolean)
    var
        WhseActivLine2: Record 5767;
        WhseActivLine3: Record 5767;
        WhseWkshLine: Record 7326;
        CreatePick: Codeunit "Create Pick";
        Confirmed: Boolean;
    begin
//FIXME
#if false
        //---AL.17Jul13 - Delete related Lines from Terminal
        with WhseActivLine do begin
            if ("Activity Type" in ["Activity Type"::"Invt. Put-away", "Activity Type"::"Invt. Pick"]) and
               (not CalledFromHeader)
            then begin
                if "Activity Type" = "Activity Type"::"Invt. Pick" then
                    CreatePick.AdjustReservation(
                      "Qty. Outstanding (Base)", "Source Type", "Source Subtype",
                      "Source No.", "Source Line No.", "Source Subline No.", 1);
                exit
            end;
            WhseActivLine2.SETCURRENTKEY(
              "Activity Type", "No.", "Whse. Document Type", "Whse. Document No.", "Whse. Document Line No.");
            WhseActivLine2.SETRANGE("Activity Type", "Activity Type");
            WhseActivLine2.SETRANGE("No.", "No.");
            WhseWkshLine.SETCURRENTKEY("Whse. Document Type", "Whse. Document No.", "Whse. Document Line No.");
            if WhseActivLine2.FIND('-') then
                repeat
                    WhseWkshLine.SETRANGE("Whse. Document Type", WhseActivLine2."Whse. Document Type");
                    WhseWkshLine.SETRANGE("Whse. Document No.", WhseActivLine2."Whse. Document No.");
                    WhseWkshLine.SETRANGE("Whse. Document Line No.", WhseActivLine2."Whse. Document Line No.");
                    if WhseWkshLine.FIND('-') then
                        if not CONFIRM(Text009, false, TABLECAPTION) then
                            ERROR(Text006)
                        else
                            Confirmed := true;
                until (WhseActivLine2.NEXT() = 0) or Confirmed;

            if (not CalledFromHeader) and
               ("Action Type" <> "Action Type"::" ") then begin
                WhseActivLine2.SETRANGE("Whse. Document Type", "Whse. Document Type");
                WhseActivLine2.SETRANGE("Whse. Document No.", "Whse. Document No.");
                WhseActivLine2.SETRANGE("Whse. Document Line No.", "Whse. Document Line No.");
                WhseActivLine2.SETRANGE("Breakbulk No.", "Breakbulk No.");
                WhseActivLine2.SETRANGE("Source No.", "Source No.");
                WhseActivLine2.SETRANGE("Source Line No.", "Source Line No.");
                WhseActivLine2.SETRANGE("Source Subline No.", "Source Subline No.");
                WhseActivLine2.SETRANGE("Serial No.", "Serial No.");
                WhseActivLine2.SETRANGE("Lot No.", "Lot No.");
                if WhseActivLine2.FIND('-') then begin
                    WhseActivLine3.COPY(WhseActivLine2);
                    WhseActivLine3.SETRANGE("Action Type", "Action Type");
                    WhseActivLine3.SETFILTER("Line No.", '<>%1', "Line No.");
                    if WhseActivLine3.FIND('-') then begin
                        if not ConfirmDeleteLine then
                            /*
                            IF NOT CONFIRM(
                              STRSUBSTNO(
                                Text004,
                                FIELDCAPTION("Activity Type"),"Activity Type", FIELDCAPTION("No."),"No.",
                                FIELDCAPTION("Line No."),"Line No.","Action Type",TABLECAPTION),
                              FALSE) THEN
                                ERROR(Text006);
                                */
                ConfirmDeleteLine := true;
                        if (WhseActivLine2."Activity Type" = WhseActivLine2."Activity Type"::Pick) and
                           (WhseActivLine2."Action Type" <> WhseActivLine2."Action Type"::Place)
                        then
                            CreatePick.AdjustReservation(
                              WhseActivLine2."Qty. Outstanding (Base)", WhseActivLine2."Source Type", WhseActivLine2."Source Subtype",
                              WhseActivLine2."Source No.", WhseActivLine2."Source Line No.", WhseActivLine2."Source Subline No.", 1);
                        exit;
                    end;
                end;
            end;
            if not CalledFromHeader then
                if "Action Type" <> "Action Type"::" " then
                    WhseActivLine2.SETFILTER("Line No.", '<>%1', "Line No.")
                else
                    WhseActivLine2.SETRANGE("Line No.", "Line No.");
            if WhseActivLine2.FIND('-') then
                repeat
                    WhseActivLine2.DELETE(); // to ensure correct item tracking update
                    DeleteBinContent(WhseActivLine2);
                    UpdateRelatedItemTrkg(WhseActivLine2);
                    if (WhseActivLine2."Activity Type" = WhseActivLine2."Activity Type"::Pick) and
                       (WhseActivLine2."Action Type" <> WhseActivLine2."Action Type"::Place) or
                       (WhseActivLine2."Activity Type" = WhseActivLine2."Activity Type"::"Invt. Pick")
                    then
                        CreatePick.AdjustReservation(
                            WhseActivLine2."Qty. Outstanding (Base)", WhseActivLine2."Source Type", WhseActivLine2."Source Subtype",
                            WhseActivLine2."Source No.", WhseActivLine2."Source Line No.", WhseActivLine2."Source Subline No.", 1);
                until WhseActivLine2.NEXT() = 0;
            if (not CalledFromHeader) and
               ("Action Type" <> "Action Type"::" ") then begin
                WhseActivLine2.RESET();
                WhseActivLine2.SETRANGE("Activity Type", "Activity Type");
                WhseActivLine2.SETRANGE("No.", "No.");
                //IF WhseActivLine2.FIND('-') THEN
                //  MESSAGE(Text013);
            end;
        end;
#endif
    end;
}