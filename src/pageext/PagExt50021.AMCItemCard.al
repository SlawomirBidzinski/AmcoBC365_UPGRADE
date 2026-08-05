pageextension 50021 "AMC Item Card" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("AMC Long Item Description"; Rec."AMC Long Item Description")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item Eng Translation"; Rec."AMC Item Eng Translation")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item Type"; Rec."AMC Item Type")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item Material Group"; Rec."AMC Item Material Group")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item Material SupGrup"; Rec."AMC Item Material SupGrup")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }
        addafter("Production BOM No.")
        {
            field("AMC RiD BOM Code 2"; Rec."AMC RiD BOM Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }

        addafter("Base Unit of Measure")
        {
            field("AMC Qty per Unit"; Rec."AMC Qty per Unit")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Packing Type"; Rec."AMC Packing Type")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Pack Unit of Measure"; Rec."AMC Pack Unit of Measure")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Pack Quantity"; Rec."AMC Pack Quantity")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }
        movebefore("AMC Item Type"; "Item Category Code")
        addafter(GTIN)
        {
            field("AMC Code"; Rec."AMC Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Intern. Code"; Rec."AMC Intern. Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Int. EAN Code"; Rec."AMC Int. EAN Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }
        addlast(Item)
        {

            field("AMC CN Code"; Rec."AMC CN Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Qty days of check Exp Date"; Rec."AMC Qty days of check Exp Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Units per Palet"; Rec."AMC Units per Palet")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item Hierarchy"; Rec."AMC Item Hierarchy")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                TableRelation = "AMC Item Hierarchy";
            }
            field("AMC PO Item Hierarchy Key"; Rec."AMC PO Item Hierarchy Key")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC PO Item Hierarchy Descr."; Rec."AMC PO Item Hierarchy Descr.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Item Frutarom"; Rec."AMC Item Frutarom")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Producent"; Rec."AMC Producent")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Nazwa Producenta"; Rec."AMC Nazwa Producenta")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Fabryka"; Rec."AMC Fabryka")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Nazwa Fabryki"; Rec."AMC Nazwa Fabryki")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }

            field("AMC Set to Export"; Rec."AMC Set to Export")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Editable = false;
            }
            field("AMC Export Date"; Rec."AMC Export Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Editable = false;
            }
            field("AMC Export Time"; Rec."AMC Export Time")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
        }
        modify("Service Item Group")
        {
            Visible = false;
        }
        addlast(Planning)
        {
            group("AMC Parametry Planowania")
            {
                field("AMC Planning Location"; Rec."AMC Planning Location")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Production Lot"; Rec."AMC Production Lot")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Product Safety Stock"; Rec."AMC Product Safety Stock")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Max Item Stock"; Rec."AMC Max Item Stock")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Production Date Set"; Rec."AMC Production Date Set")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Forecast No Print Item"; Rec."AMC Forecast No Print Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
        }
        addlast(ItemTracking)
        {
            field("AMC Default QC Status"; Rec."AMC Default QC Status")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Production EXP Label Date"; Rec."AMC Production EXP Label Date")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            group("AMC Etykiety")
            {
                field("AMC Pack Label Code"; Rec."AMC Pack Label Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Label Code"; Rec."AMC Item Label Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Lot Label Code"; Rec."AMC Lot Label Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Label Code - Pack"; Rec."AMC Item Label Code - Pack")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Label Code - Ending"; Rec."AMC Item Label Code - Ending")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
            group("AMC Etykiety Dodatkowe")
            {
                field("AMC Item Label Code-Ending Add"; Rec."AMC Item Label Code-Ending Add")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Label Code Add."; Rec."AMC Item Label Code Add.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Lot Label Code Add."; Rec."AMC Lot Label Code Add.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Label Code-Pack Add."; Rec."AMC Item Label Code-Pack Add.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Lot Label Code RU"; Rec."AMC Lot Label Code RU")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Lot Label Code Zb. RU"; Rec."AMC Lot Label Code Zb. RU")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
        }
        addafter(Warehouse)
        {
            group(AMCCountryOfOriginal)
            {
                Caption = 'Ustawienia Kraju Pochodznia';
                field(AMCCountryOriginList; CountryOriginList)

                {
                    Caption = 'Kraj Pochodzenia';
                    ApplicationArea = All;
                    ToolTip = ' ';
                    Editable = False;
                }
                part(AMCLines; "AMC Country of Origin Sub.")
                {
                    ApplicationArea = All;
                    SubPageLink = "Item Code" = field("No.");
                }

            }
            group(AMCAdditional)
            {
                Caption = 'Additional';
                field("AMC Production BOM Karagen"; Rec."AMC Production BOM Karagen")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC RiD BOM Code"; Rec."AMC RiD BOM Code")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
            group(AMCItemDetails)
            {
                Caption = 'Item Details';
                field("AMC Purchase Item"; Rec."AMC Purchase Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Sales Item"; Rec."AMC Sales Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Sales Process Item"; Rec."AMC Sales Process Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC RiD Item"; Rec."AMC RiD Item")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Special"; Rec."AMC Item Special")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item reserved"; Rec."AMC Item reserved")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Aromat IFF"; Rec."AMC Aromat IFF")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }

                field("AMC Aromat NB"; Rec."AMC Aromat NB")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item Budget 2022"; Rec."AMC Item Budget 2022")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Item KJ Weight [kg]"; Rec."AMC Item KJ Weight [kg]")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Out Off Item List"; Rec."AMC Out Off Item List")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }

                group("AMC Charakterystyka Produktu")
                {
                    field("AMC Dangerous substance"; Rec."AMC Dangerous substance")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Cold store"; Rec."AMC Cold store")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Chine Source"; Rec."AMC Chine Source")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Vegan"; Rec."AMC Vegan")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Vegetarian"; Rec."AMC Vegetarian")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Animal"; Rec."AMC Animal")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Halal"; Rec."AMC Halal")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Kosher"; Rec."AMC Kosher")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Color"; Rec."AMC Color")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Animal Incl."; Rec."AMC Animal Incl.")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Allergen Planning Dim."; Rec."AMC Allergen Planning Dim.")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                    field("AMC Colour Planning Dimension"; Rec."AMC Colour Planning Dimension")
                    {
                        ApplicationArea = All;
                        ToolTip = ' ';
                    }
                }
            }
            group(AMCCaloricContent)
            {
                Caption = 'Caloric Content';
                field("AMC Białko"; Rec."AMC Białko")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Węglowodany"; Rec."AMC Węglowodany")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Cukry"; Rec."AMC Cukry")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Tłuszcz"; Rec."AMC Tłuszcz")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Kw. tłuszcz. nasycone"; Rec."AMC Kw. tłuszcz. nasycone")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Sód"; Rec."AMC Sód")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Sól"; Rec."AMC Sól")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Błonnik"; Rec."AMC Błonnik")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Alkoh. wielowod."; Rec."AMC Alkoh. wielowod.")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Salatrimy"; Rec."AMC Salatrimy")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Alkohol (etanol)"; Rec."AMC Alkohol (etanol)")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Kwasy organiczne"; Rec."AMC Kwasy organiczne")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Białko kJ"; Rec."AMC Białko kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Węglowodany kJ"; Rec."AMC Węglowodany kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Tłuszcz kJ"; Rec."AMC Tłuszcz kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Błonnik kJ"; Rec."AMC Błonnik kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Białko kcal"; Rec."AMC Białko kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Węglowodany kcal"; Rec."AMC Węglowodany kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Tłuszcz kcal"; Rec."AMC Tłuszcz kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Błonnik kcal"; Rec."AMC Błonnik kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Kaloryczn kcal"; Rec."AMC Kaloryczn kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Kaloryczn kJ"; Rec."AMC Kaloryczn kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Alkoh. wielowod. kJ"; Rec."AMC Alkoh. wielowod. kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Salatrimy kJ"; Rec."AMC Salatrimy kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Alkohol (etanol) kJ"; Rec."AMC Alkohol (etanol) kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Kwasy organiczne kJ"; Rec."AMC Kwasy organiczne kJ")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Alkoh. wielowod. kcal"; Rec."AMC Alkoh. wielowod. kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Salatrimy kcal"; Rec."AMC Salatrimy kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Alkohol (etanol) kcal"; Rec."AMC Alkohol (etanol) kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
                field("AMC Kwasy organiczne kcal"; Rec."AMC Kwasy organiczne kcal")
                {
                    ApplicationArea = All;
                    ToolTip = ' ';
                }
            }
            group(AMCExtDimensions)
            {
                Caption = 'Ustawienia Wymiarów Zapasów';
                part(AMCExtDim; "AMC Ext. Dimensions")
                {
                    ApplicationArea = All;
                    Caption = 'Ustawienia Wymiarów';
                    SubPageLink = "Item No." = field("No.");
                }
            }
        }
        addfirst(factboxes)
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
        addfirst(Functions)
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
            action(AMCProducent)
            {
                ApplicationArea = All;
                Caption = 'Producent List';
                Image = Production;

                RunObject = Page "AMC Production List";
            }
            action(AMCBrand)
            {
                ApplicationArea = All;
                Caption = 'Brand List';
                Image = IndustryGroups;

                RunObject = Page "AMC Fabryka Producenta";
            }
        }
    }
    var
        ItemCountryOrigin: Record "AMC Item Country of Origin";
        CountryOriginList: Text[200];

    trigger OnAfterGetRecord()
    begin
        CountryOriginList := '';
        ItemCountryOrigin.RESET;
        ItemCountryOrigin.SETRANGE("Item Code", rec."No.");
        IF ItemCountryOrigin.FINDFIRST THEN
            REPEAT
                IF CountryOriginList = '' THEN BEGIN
                    CountryOriginList := STRSUBSTNO('%1', ItemCountryOrigin."Country of Origin Code");
                END ELSE BEGIN
                    CountryOriginList := STRSUBSTNO('%1, %2', CountryOriginList, ItemCountryOrigin."Country of Origin Code");
                END;
            UNTIL ItemCountryOrigin.NEXT = 0;
    end;
}
