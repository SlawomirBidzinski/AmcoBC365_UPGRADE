page 50061 "AMC Item Salesperson List"
{
    ApplicationArea = All;
    Caption = 'Item Salesperson List';
    PageType = Worksheet;
    SourceTable = Item;
    CardPageId = "Item Card";
    UsageCategory = Lists;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTableView = SORTING("AMC Item Type", "AMC Long Item Description");

    layout
    {
        area(content)
        {
            Group(AMCSetFilters)
            {
                Caption = 'Filtrowanie';

                field(AMCDateFilterFrom; DateFilterFrom)
                {
                    Caption = 'Filtr Daty Od';
                    ApplicationArea = All;
                    ToolTip = ' ';
                    trigger OnValidate()

                    begin
                        UpdateFilters;
                    end;
                }
                field(AMCDateFilterTo; DateFilterTo)
                {
                    Caption = 'Filtr Daty Do';
                    ApplicationArea = All;
                    ToolTip = ' ';

                    trigger OnValidate()

                    begin
                        UpdateFilters;
                    end;
                }
                field(AMCLocationFilter; LocationFilter)
                {
                    Caption = 'Filtr Kodu lokalizacji';
                    ApplicationArea = All;
                    ToolTip = ' ';
                    TableRelation = Location;

                    trigger OnValidate()

                    begin
                        UpdateFilters;
                    end;
                }

                field(AMCShowHidenItems; ShowHidenItems)
                {
                    Caption = 'Pokazuj Ukryte Zapasy';
                    ApplicationArea = All;
                    ToolTip = ' ';
                    trigger OnValidate()

                    begin
                        UpdateFilters;
                    end;
                }
            }
            repeater(General)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    StyleExpr = SetStyle;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    StyleExpr = SetStyle;
                    Editable = false;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Visible = False;
                    Editable = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Long Item Description"; Rec."AMC Long Item Description")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Out Off Item List"; Rec."AMC Out Off Item List")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Set to Export"; Rec."AMC Set to Export")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Sales Item"; Rec."AMC Sales Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Purchase Item"; Rec."AMC Purchase Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Budget 2022"; Rec."AMC Item Budget 2022")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Type"; Rec."AMC Item Type")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }

                field("AMC Item Frutarom"; Rec."AMC Item Frutarom")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Pack Quantity"; Rec."AMC Pack Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Packing Type"; Rec."AMC Packing Type")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Pack Unit of Measure"; Rec."AMC Pack Unit of Measure")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Inventory Qty"; Rec."AMC Inventory Qty")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Style = StrongAccent;
                    DecimalPlaces = 2 : 2;
                    Editable = false;
                }
                field("AMC Items on M.GL"; Rec."AMC Items on M.GL")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Style = Favorable;
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("AMC Items on M.SUR"; Rec."AMC Items on M.SUR")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Style = Favorable;
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("AMC Items on M.SUR (MS)"; Rec."AMC Items on M.SUR (MS)")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Style = Favorable;
                    Editable = false;
                }
                field("AMC Items on M.UT"; Rec."AMC Items on M.UT")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("AMC Items on M.PROBY"; Rec."AMC Items on M.PROBY")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("AMC Items on M.REKLAM"; Rec."AMC Items on M.REKLAM")
                {
                    ApplicationArea = All;
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("AMC Items on M.N.WART"; Rec."AMC Items on M.N.WART")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                }
                field("AMC Item Consumption"; Rec."AMC Item Consumption")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Style = Favorable;
                }
                field("AMC Item Consump. Value"; Rec."AMC Item Consump. Value")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Style = Favorable;
                }
                field("AMC Production Qty"; Rec."AMC Production Qty")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Style = Favorable;
                }
                field("AMC Production Value"; Rec."AMC Production Value")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Style = Favorable;
                }
                field("AMC Sales Qty"; Rec."AMC Sales Qty")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Style = Unfavorable;
                }
                field("AMC Stock Qty"; Rec."AMC Stock Qty")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    DecimalPlaces = 0 : 2;
                    Editable = false;
                    Style = Unfavorable;
                }
                field("Net Weight"; Rec."Net Weight")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Expiration Calculation"; Rec."Expiration Calculation")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC CN Code"; Rec."AMC CN Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Producent"; Rec."AMC Producent")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Nazwa Producenta"; Rec."AMC Nazwa Producenta")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Fabryka"; Rec."AMC Fabryka")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Nazwa Fabryki"; Rec."AMC Nazwa Fabryki")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Item Material Group"; Rec."AMC Item Material Group")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(ItemGrName; ItemGrName)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Item Material SupGrup"; Rec."AMC Item Material SupGrup")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field(ItemSubGrName; ItemSubGrName)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Item Disc. Group"; Rec."Item Disc. Group")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Item Hierarchy"; Rec."AMC Item Hierarchy")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC PO Item Hierarchy Key"; Rec."AMC PO Item Hierarchy Key")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC PO Item Hierarchy Descr."; Rec."AMC PO Item Hierarchy Descr.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Replenishment System"; Rec."Replenishment System")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Production BOM No."; Rec."Production BOM No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC RiD BOM Code"; Rec."AMC RiD BOM Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Code"; Rec."AMC Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Visible = False;
                    Editable = false;
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Visible = False;
                    Editable = false;
                }
                field("AMC Int. EAN Code"; Rec."AMC Int. EAN Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Visible = False;
                    Editable = false;
                }
                field(GTIN; Rec.GTIN)
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Intern. Code"; Rec."AMC Intern. Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Aromat IFF"; Rec."AMC Aromat IFF")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("AMC Aromat NB"; Rec."AMC Aromat NB")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Inventory Posting Group"; Rec."Inventory Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = false;
                }
            }
        }
        area(FactBoxes)
        {
            part(AMCItemDetailsFctb; "AMC Item Details Factbox")
            {
                ApplicationArea = All;
                Caption = 'Details';
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(AMCNewItem)
            {
                ApplicationArea = All;
                Caption = 'Generate New Item';
                Image = Item;

                RunObject = Page "AMC New Item Generate";
            }
            action(AMCItemBinContents)
            {
                ApplicationArea = All;
                Caption = 'Item Bin Contents';
                Image = BinContent;

                RunObject = Page "Bin Contents";
                RunPageLink = "Item No." = field("No.");
            }
            action(AMCItemAvailabilityByBatch)
            {
                ApplicationArea = All;
                Caption = 'Item Availability By Batch';
                Image = AvailableToPromise;

                RunObject = Page "Lot No. Information List";
                RunPageLink = "Item No." = field("No.");
            }
            action(AMCOpenBOM)
            {
                ApplicationArea = All;
                Caption = 'Open BoM';
                Image = BOM;

                trigger OnAction()
                begin
                    Rec.AMCCreateProdBomHeader();
                end;
            }
            action(AMCOpenRouting)
            {
                ApplicationArea = All;
                Caption = 'Open Routing';
                Image = CopyRouteVersion;

                trigger OnAction()
                begin
                    Rec.AMCCreateRoutingHeader();
                end;
            }
            action(AMCCreateBarcode)
            {
                ApplicationArea = All;
                Caption = 'Create Barcode';
                Image = BarCode;

                trigger OnAction()
                var
                    cnfCreateBarcode: Label 'Create Barcode?';

                begin

                    IF CONFIRM(cnfCreateBarcode) THEN BEGIN
                        Rec.AMCCreateBarCode();
                        Rec.MODIFY(TRUE);
                        CurrPage.UPDATE(FALSE);
                    END;
                end;
            }
        }

    }

    var
        DateFilterFrom: date;
        DateFilterTo: date;
        LocationFilter: Code[200];
        ShowHidenItems: Boolean;
        SetStyle: Text[100];

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        DateFilterFrom := 0D;
        DateFilterTo := 0D;
        LocationFilter := '';

        UserSetup.RESET();
        UserSetup.SETRANGE("User ID", USERID);
        IF UserSetup.FINDFIRST() THEN BEGIN
            IF UserSetup."AMC Sales Person Persmisson" = TRUE THEN
                Rec.SETRANGE("AMC Sales Process Item", TRUE)
            ELSE BEGIN
                IF (UserSetup."AMC Sales Item Permission" = TRUE) AND (UserSetup."AMC Purchase Items Permission" = FALSE) THEN
                    Rec.SETRANGE("AMC Sales Item", TRUE);

                IF (UserSetup."AMC Sales Item Permission" = FALSE) AND (UserSetup."AMC Purchase Items Permission" = TRUE) THEN
                    Rec.SETRANGE("AMC Purchase Item", TRUE);

                IF (UserSetup."AMC Sales Item Permission" = FALSE) AND (UserSetup."AMC Purchase Items Permission" = FALSE) THEN
                    ERROR(Text_002, USERID);
            END;
        END ELSE
            ERROR(Text_001, USERID);


        Rec.SETRANGE(Blocked, FALSE);
        Rec.SETRANGE("AMC Out Off Item List", FALSE);

        UpdateFilters();

    end;

    trigger OnAfterGetRecord()
    var
        ItemCountryOrigin: Record "AMC Item Country of Origin";
        MaterialsGroup: Record "AMC Materials Group";
        MaterialsSubGroup: Record "AMC Material SubGroups";
        CountryOriginList: Text[200];
    begin
        if (rec.Blocked = false) and (rec."AMC Out Off Item List" = false) then
            SetStyle := 'StrongAccent'
        else
            SetStyle := 'Attention';

        IF Rec."No." <> '' then begin
            CountryOriginList := '';
            ItemCountryOrigin.RESET();
            ItemCountryOrigin.SETRANGE("Item Code", Rec."No.");
            IF ItemCountryOrigin.FindSet() THEN
                REPEAT
                    IF CountryOriginList = '' THEN
                        CountryOriginList := STRSUBSTNO('%1', ItemCountryOrigin."Country of Origin Code")
                    ELSE
                        CountryOriginList := STRSUBSTNO('%1, %2', CountryOriginList, ItemCountryOrigin."Country of Origin Code")
                UNTIL ItemCountryOrigin.NEXT() = 0;
        end;

        ItemSubGrName := '';
        ItemGrName := '';

        MaterialsGroup.RESET();
        MaterialsSubGroup.RESET();

        MaterialsGroup.SETRANGE("Group Code", Rec."AMC Item Material Group");
        IF MaterialsGroup.FINDFIRST() THEN begin
            ItemGrName := MaterialsGroup."Group Name";

            MaterialsSubGroup.SETRANGE("Material Group", Rec."AMC Item Material Group");
            MaterialsSubGroup.SETRANGE("Material SubGroup", Rec."AMC Item Material SupGrup");

            IF MaterialsSubGroup.FINDFIRST() THEN
                ItemSubGrName := MaterialsSubGroup."SubGroup Description";
        end;

    end;

    local procedure UpdateFilters();
    begin
        rec.SetRange("Date Filter");

        if (DateFilterFrom <> 0D) and (DateFilterTo <> 0D) then
            rec.SetRange("Date Filter", DateFilterFrom, DateFilterTo);
        if (DateFilterFrom <> 0D) and (DateFilterTo = 0D) then
            rec.SetRange("Date Filter", DateFilterFrom, 99991231D);
        if (DateFilterFrom = 0D) and (DateFilterTo <> 0D) then
            rec.SetRange("Date Filter", 0D, DateFilterTo);

        if LocationFilter <> '' then
            rec.Setfilter("Location Filter", LocationFilter)
        else
            rec.Setrange("Location Filter");

        if ShowHidenItems = true then begin
            rec.setrange(Blocked);
            rec.setrange("AMC Out Off Item List");
        end else begin
            rec.setrange(Blocked, false);
            rec.setrange("AMC Out Off Item List", false);
        end;
        CurrPage.Update(false);
    end;

    var
        ItemGrName: Text[100];
        ItemSubGrName: Text[100];
        Text_001: Label 'Operator %1 nie jest zdefiniowany w ustawieniach uľytkownika';
        Text_002: Label 'Operator %1 nie ma uprawnieä do odczytu kartoteki zapasu w ustawieniach uľytkownika';
}
