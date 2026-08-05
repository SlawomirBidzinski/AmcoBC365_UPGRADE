pageextension 50023 "AMC Item List" extends "Item List"
{
    layout
    {
        addafter(Description)
        {
            field("AMC Long Item Description"; Rec."AMC Long Item Description")
            {
                ApplicationArea = All;
            }
            field("AMC Item Type"; Rec."AMC Item Type")
            {
                ApplicationArea = All;
            }
            field("AMC CN Code"; Rec."AMC CN Code")
            {
                ApplicationArea = All;
            }
        }
        moveafter("AMC Long Item Description"; "Production BOM No.")
        addafter("Production BOM No.")
        {
            field("AMC RiD BOM Code"; Rec."AMC RiD BOM Code")
            {
                Caption = 'Kod BOMu RiD';
                ApplicationArea = All;
            }
        }
        addafter(InventoryField)
        {
            field("AMC Pack Unit of Measure"; Rec."AMC Pack Unit of Measure")
            {
                ApplicationArea = All;
            }
            field("AMC Pack Quantity"; Rec."AMC Pack Quantity")
            {
                ApplicationArea = All;
                Visible = false;
            }
            field("AMC Packing Type"; Rec."AMC Packing Type")
            {
                ApplicationArea = All;
            }
            field(AMCCountryOriginList; CountryOriginList)

            {
                Caption = 'Kraj Pochodzenia';
                ApplicationArea = All;
                ToolTip = ' ';
                Editable = False;
            }

            field("AMC Item Hierarchy"; Rec."AMC Item Hierarchy")
            {
                ApplicationArea = All;
            }
            field("AMC Producent"; Rec."AMC Producent")
            {
                ApplicationArea = All;
            }
            field("AMC Nazwa producenta"; Rec."AMC Nazwa Producenta")
            {
                ApplicationArea = All;
            }
            field("AMC Fabryka"; Rec."AMC Fabryka")
            {
                ApplicationArea = All;
            }
            field("AMC Nazwa Fabryki"; Rec."AMC Nazwa Fabryki")
            {
                ApplicationArea = All;
            }
            field("AMC Item Material Group"; Rec."AMC Item Material Group")
            {
                ApplicationArea = All;
            }
            field(AMCItemGrName; ItemGrName)
            {
                Caption = 'Grupa Zapasów';
                ApplicationArea = All;
            }

            field("AMC Item Material SupGrup"; Rec."AMC Item Material SupGrup")
            {
                ApplicationArea = All;
            }
            field(AMCItemSubGrName; ItemSubGrName)
            {
                Caption = 'Podgrupa Zapasów';
                ApplicationArea = All;
            }

        }
        modify("Cost is Adjusted")
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify("Routing No.")
        {
            Visible = false;
            ApplicationArea = All;
        }

        modify("Unit Price")
        {
            Visible = false;
            ApplicationArea = All;
        }
        modify("Unit Cost")
        {
            Visible = false;
            ApplicationArea = All;
        }
        moveafter(InventoryField; "Base Unit of Measure")

        movelast(content; "Cost is Adjusted")
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
        addbefore(History)
        {
            action(AMCNewItem)
            {
                ApplicationArea = All;
                Caption = 'Generate New Item';
                Image = Item;

                RunObject = Page "AMC New Item Generate";
            }
        }
        addfirst(Functions)
        {
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
        }
    }
    var
        MaterialsGroup: Record "AMC Materials Group";
        MaterialsSubGroup: Record "AMC Material SubGroups";
        ItemCountryOrigin: Record "AMC Item Country of Origin";
        ItemGrName: Text[200];
        ItemSubGrName: Text[200];
        CountryOriginList: Text[200];



    trigger OnOpenPage()
    begin
        rec.SETRANGE(Blocked, FALSE);
        Rec.CalcFields("AMC Nazwa Producenta", "AMC Nazwa Fabryki");
    end;

    trigger OnAfterGetRecord()
    begin

        ItemGrName := '';
        ItemSubGrName := '';

        MaterialsGroup.SETRANGE("Group Code", Rec."AMC Item Material Group");
        //MaterialsGroup.SETRANGE("Item Type","Item Type");
        IF MaterialsGroup.FINDFIRST THEN
            ItemGrName := MaterialsGroup."Group Name";

        MaterialsSubGroup.SETRANGE("Material Group", Rec."AMC Item Material Group");
        MaterialsSubGroup.SETRANGE("Material SubGroup", Rec."AMC Item Material SupGrup");

        IF MaterialsSubGroup.FINDFIRST THEN
            ItemSubGrName := MaterialsSubGroup."SubGroup Description";

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