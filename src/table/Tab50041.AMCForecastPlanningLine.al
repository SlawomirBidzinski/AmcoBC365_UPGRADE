table 50041 "AMC Forecast Planning Line"
{
    Caption = 'Forecast Planning Line';
    DataClassification = CustomerContent;
    DrillDownPageId = "AMC Forecast Planning List";
    LookupPageId = "AMC Forecast Planning List";

    fields
    {
        field(1; "Forecast Planning No."; Code[20])
        {
            Caption = 'Forecast Planning No.';
            DataClassification = CustomerContent;
            TableRelation = "AMC Forecast Planning Header";
        }
        field(2; "Forecast Code"; Code[10])
        {
            Caption = 'Kod Prognozy';
            TableRelation = "Production Forecast Name";
            Editable = false;
        }
        field(3; Year; Integer)
        {
            Caption = 'Rok';
            Editable = false;
        }
        field(4; "Week No."; Integer)
        {
            Caption = 'Nr Tygodnia';
            Editable = false;
        }
        field(5; "Week Starting Date"; Date)
        {
            Caption = 'Week Starting Date';
            Editable = false;
        }
        field(6; "Week Ending Date"; Date)
        {
            Caption = 'Week Ending Date';
            Editable = false;
        }
        field(7; "Previous Week From Date"; Date)
        {
            Caption = 'Data Prognozy Poprz. Tygodnia';
            Editable = false;
        }
        field(8; "Location Code"; Code[10])
        {
            Caption = 'Kod Lokalizacji';
        }
        field(9; "Item No."; Code[20])
        {
            Caption = 'Kod Zapasu';
            TableRelation = Item;

            trigger OnValidate()
            var
                PrevForecEntry: Record "AMC Forecast Planning Line";
                Item: Record Item;
                ItemDimension: Record "AMC Item Dimension";
            begin
                if Item.GET("Item No.") then begin
                    "Item Description" := Item.Description;
                    "Base Unit of Measure" := Item."Base Unit of Measure";
                    "Pack Unit of Measure" := Item."AMC Pack Unit of Measure";

                    ItemDimension.RESET();
                    ItemDimension.SETRANGE("Item No.", "Item No.");
                    ItemDimension.SETRANGE("Dimension Code", 'ALERGENY');
                    if ItemDimension.FINDFIRST() then begin
                        DimValueTrans.RESET();
                        DimValueTrans.SETRANGE("Dimension Code", 'ALERGENY');
                        DimValueTrans.SETRANGE("Dimension Value Code", ItemDimension."Dimension Value Code");
                        DimValueTrans.SETRANGE(Type, DimValueTrans.Type::ExtDimVal);
                        DimValueTrans.SETRANGE("Language ID", 0);
                        if DimValueTrans.FINDFIRST() then
                            Alergeny := DimValueTrans."Printer Text 1";
                    end;

                    if "Forecast Remarks" = '' then begin
                        PrevForecEntry.RESET();
                        PrevForecEntry.SETRANGE("Item No.", Item."No.");
                        if "Week No." > 1 then begin
                            PrevForecEntry.SETRANGE(Year, Year);
                            PrevForecEntry.SETRANGE("Week No.", "Week No." - 1);
                        end;

                        if PrevForecEntry.FINDLAST() then
                            if PrevForecEntry."Forecast Remarks" <> '' then
                                "Forecast Remarks" := PrevForecEntry."Forecast Remarks";
                    end;
                end;
            end;
        }
        field(10; "Item Description"; Text[100])
        {
            Caption = 'Nazwa Zapasu';
            Editable = false;
        }
        field(11; "Base Unit of Measure"; Code[10])
        {
            Caption = 'Podst. jednostka miary';
            Editable = false;
            TableRelation = "Item Unit of Measure".Code where("Item No." = field("Item No."));
        }
        field(12; "Pack Unit of Measure"; Code[10])
        {
            Caption = 'Jednostka miary opakowania';
            Editable = false;
            TableRelation = "Unit of Measure";
        }
        field(13; Alergeny; Text[200])
        {
            Caption = 'Alergeny';
            Editable = false;
        }
        field(14; "Reorder Point"; Decimal)
        {
            FieldClass = FlowField;
            BlankZero = true;
            CalcFormula = lookup(Item."Reorder Point" where("No." = field("Item No.")));
            Caption = 'Poziom Ponownego Zamówienia';
            DecimalPlaces = 0 : 3;
            Editable = false;

        }
        field(15; "Reorder Quantity"; Decimal)
        {
            FieldClass = FlowField;
            BlankZero = true;
            CalcFormula = lookup(Item."Reorder Quantity" where("No." = field("Item No.")));
            Caption = 'Ilość Ponownego zamówienia';
            DecimalPlaces = 0 : 3;
            Editable = false;

        }
        field(16; "Reorder Policy"; Enum "Reordering Policy")
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Reordering Policy" where("No." = field("Item No.")));
            Caption = 'Zasady Ponownego Zamówienia';

        }
        field(17; "Production BOM"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Production BOM No." where("No." = field("Item No.")));
            Caption = 'BOM Produkcyjny';
            Editable = false;

        }
        field(18; "Production Lot"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."AMC Production Lot" where("No." = field("Item No.")));
            Caption = 'Szarża produkcji';

        }
        field(19; "Product Safety Stock"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."AMC Product Safety Stock" where("No." = field("Item No.")));
            Caption = 'Stan bezpieczny wyrobu';

        }
        field(20; "Max Stock Item"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."AMC Max Item Stock" where("No." = field("Item No.")));
            Caption = 'Max Stock Item';

        }
        field(21; "Week Forecast Qty"; Decimal)
        {
            BlankZero = true;
            Caption = 'Ilość Prognozy Tygodniowa';
            DecimalPlaces = 2 : 2;
        }
        field(22; Monday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Pn';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(23; Tuesday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Wt';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(24; Wednesday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Śr';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(25; Thursday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Cz';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(26; Friday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Pt';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(27; Saturday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Sb';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(28; Sunday; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Ni';
            DecimalPlaces = 2 : 2;

            trigger OnValidate()
            begin
                CalcForecast();
            end;
        }
        field(50; Inventory; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("Item No.")));
            Caption = 'Zapasy';
            DecimalPlaces = 0 : 3;
            Editable = false;

        }
        field(51; "Inventory / Location"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("Item No."),
                                                                              "Remaining Quantity" = filter(> 0),
                                                                              "Location Code" = field("Location Code")));
            Caption = 'Zapasy / Magazyn';
            DecimalPlaces = 0 : 3;
            Editable = false;

        }
        field(52; "Inventory <> M.KJ"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("Item No."),
                                                                              "Remaining Quantity" = filter(> 0),
                                                                              "Location Code" = filter(<> 'M. KJ')));
            Caption = 'Inventory <> K.J.';
            DecimalPlaces = 0 : 3;
            Description = 'M. KJ';
            Editable = false;

        }
        field(60; "Forecast Remarks"; Text[100])
        {
            Caption = 'Forecast Remarks';
        }
        field(90; "Prev. Forecast Filter"; Integer)
        {
            FieldClass = FlowFilter;
            Caption = 'Filtr Poprzedniej Prognozy';
        }
        field(91; "Prev. Forecast Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("AMC Forecast Planning Line"."Week Forecast Qty" where("Forecast Planning No." = field("Forecast Planning No."),
                                                                            "Item No." = field("Item No."),
                                                                            "Week Starting Date" = field("Previous Week From Date")));
            Caption = 'Ilość Poprzedniej Prognozy';

        }
        field(120; "Production Order Forecast Qty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Production Order".Quantity where(Status = const("Firm Planned"),
                                                                 "Source Type" = const(Item),
                                                                 "Source No." = field("Item No."),
                                                                 "AMC Forecast Planning Year" = field(Year),
                                                                 "AMC Forecast Planning Week" = field("Week No."),
                                                                 "AMC Forecast Order" = const(true)));
            Caption = 'Planowana Il. Zl. Prod';

        }
        field(121; "Production Order Release Qty."; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("Production Order".Quantity where(Status = const("Firm Planned"),
                                                                 "Source Type" = const(Item),
                                                                 "Source No." = field("Item No."),
                                                                 "AMC Forecast Planning Year" = field(Year),
                                                                 "AMC Forecast Planning Week" = field("Week No."),
                                                                 "AMC Forecast Order" = const(true)));
            Caption = 'Zatwierdzona Il. Zl. Prod';

        }
        field(130; "No Print Forecat Item"; Boolean)
        {
            FieldClass = FlowField;
            CalcFormula = lookup(Item."AMC Forecast No Print Item" where("No." = field("Item No.")));
            Caption = 'Nie Drukuj na Prognozie';

        }
        field(200; "Date Filter CM"; Date)
        {
            Caption = 'Filtr Daty BM';
            FieldClass = FlowFilter;
        }
        field(201; "Date Filter CM-1M"; Date)
        {
            Caption = 'Filtr Daty BM-1M';
            FieldClass = FlowFilter;
        }
        field(202; "Date Filter CM-2M"; Date)
        {
            Caption = 'Filtr Daty BM-2M';
            FieldClass = FlowFilter;
        }
        field(203; "Date Filter 5M"; Date)
        {
            Caption = 'Filtr Daty 5M';
            FieldClass = FlowFilter;
        }
        field(204; "Date Filter CM-3M"; Date)
        {
            Caption = 'Filtr Daty BM-3M';
            FieldClass = FlowFilter;
        }
        field(205; "Date Filter CM-4M"; Date)
        {
            Caption = 'Filtr Daty BM-4M';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(Key1; "Forecast Planning No.", "Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SalesSetup: Record "Sales & Receivables Setup";
        ForecPlanning: Record "AMC Forecast Planning Line";
        DimValueTrans: Record "AMC Dimension Value Transl.";

    procedure CalcForecast()
    begin

        if "Week Forecast Qty" <>
                           Monday
                           + Tuesday
                           + Wednesday
                           + Thursday
                           + Friday
                           + Saturday
                           + Sunday then
            "Week Forecast Qty" :=
                               Monday
                               + Tuesday
                               + Wednesday
                               + Thursday
                               + Friday
                               + Saturday
                               + Sunday;
    end;

    procedure UpdateProdOrder(var ProdOrder: Record "Production Order"; PrvDate: Date; PrvQty: Decimal)
    var
        ForPlan: Record "AMC Forecast Planning Line";
        ForPlanNew: Record "AMC Forecast Planning Line";
        SetNewYear: Integer;
        SetNewWeek: Integer;
        SetNewDay: Integer;
        SetPrvYear: Integer;
        SetPrvWeek: Integer;
        SetPrvDay: Integer;
        TextLoc_001: Label 'Nie mozna przenieść zlecenia produkcyjnego na okres Rok:%1 Tydzień: %2\Nie znaleziono dla tego okresu harmonogramu dla Zapasu %3 Planowania Produkcji';
    begin
        if ((PrvQty = 0) or (PrvDate = 0D)) then
            exit;

        if ((ProdOrder.Quantity = PrvQty) and (ProdOrder."Due Date" = PrvDate)) then
            exit;

        SetNewYear := DATE2DWY(ProdOrder."Due Date", 3);
        SetNewWeek := DATE2DWY(ProdOrder."Due Date", 2);
        SetNewDay := DATE2DWY(ProdOrder."Due Date", 1);


        SetPrvYear := DATE2DWY(PrvDate, 3);
        SetPrvWeek := DATE2DWY(PrvDate, 2);
        SetPrvDay := DATE2DWY(PrvDate, 1);

        ForPlan.RESET();
        ForPlan.SETRANGE(Year, SetPrvYear);
        ForPlan.SETRANGE("Week No.", SetPrvWeek);
        ForPlan.SETRANGE("Item No.", ProdOrder."Source No.");
        if ForPlan.FINDFIRST() then begin
            ForPlanNew.RESET();
            ForPlanNew.SETRANGE(Year, SetNewYear);
            ForPlanNew.SETRANGE("Week No.", SetNewWeek);
            ForPlanNew.SETRANGE("Item No.", ProdOrder."Source No.");
            if not ForPlanNew.FINDFIRST() then
                ERROR(TextLoc_001, SetNewYear, SetNewWeek, ProdOrder."Source No.");

            case SetPrvDay of
                1:
                    begin
                        ForPlan.Monday := ForPlan.Monday - PrvQty;
                        ForPlan.MODIFY();
                    end;
                2:
                    begin
                        ForPlan.Tuesday := ForPlan.Tuesday - PrvQty;
                        ForPlan.MODIFY();
                    end;
                3:
                    begin
                        ForPlan.Wednesday := ForPlan.Wednesday - PrvQty;
                        ForPlan.MODIFY();
                    end;
                4:
                    begin
                        ForPlan.Thursday := ForPlan.Thursday - PrvQty;
                        ForPlan.MODIFY();
                    end;
                5:
                    begin
                        ForPlan.Friday := ForPlan.Friday - PrvQty;
                        ForPlan.MODIFY();
                    end;
                6:
                    begin
                        ForPlan.Saturday := ForPlan.Saturday - PrvQty;
                        ForPlan.MODIFY();
                    end;
                7:
                    begin
                        ForPlan.Sunday := ForPlan.Sunday - PrvQty;
                        ForPlan.MODIFY();
                    end;
            end;

            if ((SetNewYear = SetPrvYear) and (SetNewWeek = SetPrvWeek)) then
                case SetNewDay of
                    1:
                        begin
                            ForPlan.Monday := ForPlan.Monday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                    2:
                        begin
                            ForPlan.Tuesday := ForPlan.Tuesday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                    3:
                        begin
                            ForPlan.Wednesday := ForPlan.Wednesday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                    4:
                        begin
                            ForPlan.Thursday := ForPlan.Thursday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                    5:
                        begin
                            ForPlan.Friday := ForPlan.Friday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                    6:
                        begin
                            ForPlan.Saturday := ForPlan.Saturday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                    7:
                        begin
                            ForPlan.Sunday := ForPlan.Sunday + ProdOrder.Quantity;
                            ForPlan.MODIFY();
                        end;
                end

            else begin

                case SetNewDay of
                    1:
                        begin
                            ForPlanNew.Monday := ForPlanNew.Monday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                    2:
                        begin
                            ForPlanNew.Tuesday := ForPlanNew.Tuesday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                    3:
                        begin
                            ForPlanNew.Wednesday := ForPlanNew.Wednesday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                    4:
                        begin
                            ForPlanNew.Thursday := ForPlanNew.Thursday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                    5:
                        begin
                            ForPlanNew.Friday := ForPlanNew.Friday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                    6:
                        begin
                            ForPlanNew.Saturday := ForPlanNew.Saturday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                    7:
                        begin
                            ForPlanNew.Sunday := ForPlanNew.Sunday + ProdOrder.Quantity;
                            ForPlanNew.MODIFY();
                        end;
                end;

                ProdOrder."AMC Forecast Planning Week" := SetNewWeek;
                ProdOrder.MODIFY();
            end;

            COMMIT();

            ProdOrder."AMC Forecast Planning Year" := SetNewYear;
            ProdOrder."AMC Forecast Planning Week" := SetNewWeek;
            ProdOrder.MODIFY();
        end;
    end;
}

