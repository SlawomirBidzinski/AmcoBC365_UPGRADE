page 50042 "AMC New Item Generate"
{
    ApplicationArea = All;
    Caption = 'New Item Generate';
    PageType = Card;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ItemType; ItemType)
                {
                    ApplicationArea = All;
                    Caption = 'Item Type';
                    trigger OnValidate()
                    begin

                        NewItemCode := '';
                        SetNewItemCode := '';
                        ItemMatGroup := '';
                        ItemMatSubGroup := '';
                        SerialCodeNo := '';
                        PreFixCode := '';
                        ItemDefCOM := '';

                    end;
                }
                field(ItemMaterialGroup; ItemMatGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Item Material Group';
                    TableRelation = "AMC Material Group"."Material Group";

                    trigger OnValidate()
                    begin
                        IF ItemMatGroup = '' THEN BEGIN
                            ItemMatSubGroup := '';
                            SerialCodeNo := '';
                            PreFixCode := '';
                            ItemDefCOM := '';
                        END ELSE BEGIN
                            CASE ItemType OF
                                ItemType::Material:
                                    MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Material);

                                ItemType::Packing:
                                    MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Packing);

                                ItemType::Goods:
                                    MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Goods);

                                ItemType::Wares:
                                    MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Wares);
                            END;

                            MatGroup.SETRANGE("Group Code", ItemMatGroup);
                            IF MatGroup.FINDFIRST() THEN BEGIN
                                ItemGroupName := MatGroup."Group Name";
                                SerialCodeNo := MatGroup."New Item Serial No";
                            END ELSE
                                ERROR(Text_006);
                        END;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        MatGroupList: Page "AMC Item Material Group";
                    begin
                        ItemMatSubGroup := '';

                        CLEAR(MatGroupList);
                        MatGroup.RESET();
                        CASE ItemType OF
                            ItemType::Material:
                                MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Material);

                            ItemType::Packing:
                                MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Packing);

                            ItemType::Goods:
                                MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Goods);

                            ItemType::Wares:
                                MatGroup.SETRANGE("Item Type", MatGroup."Item Type"::Wares);
                        END;
                        IF MatGroup.FINDFIRST() THEN BEGIN
                            MatGroupList.SETTABLEVIEW(MatGroup);
                            MatGroupList.SETRECORD(MatGroup);
                            MatGroupList.LOOKUPMODE(TRUE);
                            IF MatGroupList.RUNMODAL() = ACTION::LookupOK THEN BEGIN
                                MatGroupList.GETRECORD(MatGroup);
                                ItemMatGroup := MatGroup."Group Code";
                                ItemGroupName := MatGroup."Group Name";
                                SerialCodeNo := MatGroup."New Item Serial No";

                            END;
                        END;
                    end;
                }
                field(ItemGroupName; ItemGroupName)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Item Group Name';
                }
                field(ItemMatSubGroup; ItemMatSubGroup)
                {
                    ApplicationArea = All;
                    Caption = 'Item Material Subgroup';
                    TableRelation = "AMC Material SubGroups"."Material SubGroup";

                    trigger OnValidate()
                    begin
                        IF ItemMatSubGroup = '' THEN
                            PreFixCode := ''
                        ELSE BEGIN
                            CASE ItemType OF
                                ItemType::Material:
                                    BEGIN
                                        MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Material);
                                        PreMat := 'S';
                                    END;

                                ItemType::Packing:
                                    BEGIN
                                        MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Packing);
                                        PreMat := 'O';
                                    END;
                                ItemType::Goods:
                                    BEGIN
                                        MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Goods);
                                        PreMat := '';
                                    END;
                                ItemType::Wares:
                                    begin
                                        MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Wares);
                                        PreMat := '';
                                    end;


                            END;
                            MatSubGroup.SETRANGE("Material Group", ItemMatGroup);
                            MatSubGroup.SETRANGE("Material SubGroup", ItemMatSubGroup);

                            IF MatSubGroup.FINDFIRST() THEN BEGIN
                                ItemSubGroupName := MatSubGroup."SubGroup Description";
                                case ItemType OF
                                    ItemType::Material, ItemType::Packing:
                                        begin
                                            PreFixCode := STRSUBSTNO('%1.%2.%3.', PreMat, ItemMatGroup, ItemMatSubGroup);
                                        end;
                                    ItemType::Goods, ItemType::Wares:
                                        begin
                                            PreFixCode := '';
                                        end;
                                END;
                            END ELSE
                                ERROR(Text_006);
                        END;
                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    var
                        MatSubGroupList: page "AMC Item Material Subgroups";
                    begin
                        IF ItemMatGroup = '' THEN
                            ERROR(Text_001);

                        CLEAR(MatSubGroupList);
                        MatSubGroup.RESET();
                        CASE ItemType OF
                            ItemType::Material:
                                BEGIN
                                    MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Material);
                                    PreMat := 'S';
                                END;
                            ItemType::Packing:
                                BEGIN
                                    MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Packing);
                                    PreMat := 'O';
                                END;
                            ItemType::Goods:
                                BEGIN
                                    MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Goods);
                                    PreMat := '';
                                END;
                            ItemType::Wares:
                                begin
                                    MatSubGroup.SETRANGE("Item Type", MatGroup."Item Type"::Wares);
                                    PreMat := '';
                                end;

                        END;
                        MatSubGroup.SETRANGE("Material Group", ItemMatGroup);

                        IF MatSubGroup.FINDFIRST() THEN BEGIN
                            MatSubGroupList.SETTABLEVIEW(MatSubGroup);
                            MatSubGroupList.SETRECORD(MatSubGroup);
                            MatSubGroupList.LOOKUPMODE(TRUE);
                            IF MatSubGroupList.RUNMODAL() = ACTION::LookupOK THEN BEGIN
                                MatSubGroupList.GETRECORD(MatSubGroup);
                                ItemMatSubGroup := MatSubGroup."Material SubGroup";
                                ItemSubGroupName := MatSubGroup."SubGroup Description";
                                case ItemType OF
                                    ItemType::Material, ItemType::Packing:
                                        begin
                                            PreFixCode := STRSUBSTNO('%1.%2.%3.', PreMat, ItemMatGroup, ItemMatSubGroup);
                                        end;
                                    ItemType::Goods, ItemType::Wares:
                                        begin
                                            PreFixCode := '';
                                        end;
                                END;
                                ItemDefCOM := 'KG';
                                ItemPurCOM := 'KG';
                                QtyPerItemPurCOM := 1;

                            END;
                        END;
                    end;
                }
                field(ItemSubGroupName; ItemSubGroupName)
                {
                    ApplicationArea = All;
                    Editable = false;
                    Caption = 'Item Subgroup Name';
                }
                field(SerialCodeNo; SerialCodeNo)
                {
                    ApplicationArea = All;
                    Caption = 'Serial Code No.';
                    TableRelation = "No. Series";
                }
                field(SetNewItemCode; SetNewItemCode)
                {
                    ApplicationArea = All;
                    Caption = 'Set Item Code';
                    Editable = TRUE;
                    trigger OnValidate()
                    begin
                        NewItemCode := SetNewItemCode;
                    end;
                }
                field(PreFixCode; PreFixCode)
                {
                    ApplicationArea = All;
                    Caption = 'Prefix Code';
                    Editable = false;
                }
                field(PostFixCode; PostFixCode)
                {
                    ApplicationArea = All;
                    Caption = 'Postfix Code';
                    Editable = false;
                }
                field(NewItemCode; NewItemCode)
                {
                    ApplicationArea = All;
                    Caption = 'New Item Code';
                    Editable = false;
                }
                field(NewItemName; NewItemName)
                {
                    ApplicationArea = All;
                    Caption = 'New Item Name';

                    trigger OnValidate()
                    begin
                        NewItemSearchName := NewItemName;
                    end;
                }
                //field(NewItemLongName; NewItemLongName)
                //{
                //    ApplicationArea = All;
                //    Caption = 'New Item Long Name';
                //}
                field(NewItemSearchName; NewItemSearchName)
                {
                    ApplicationArea = All;
                    Caption = 'New Item Search Name';
                }
                field(ItemDefCOM; ItemDefCOM)
                {
                    ApplicationArea = All;
                    Caption = 'Pods. Jedn. Miary';
                    TableRelation = "Unit of Measure";

                    trigger OnValidate()
                    begin
                        IF NewItemLongName = '' THEN
                            NewItemLongName := NewItemName;

                        IF NewItemSearchName = '' THEN
                            NewItemSearchName := NewItemName;
                    end;
                }
                field(ItemPurCOM; ItemPurCOM)
                {
                    ApplicationArea = All;
                    Caption = 'Pods. Jedn. Zakupu';
                    TableRelation = "Unit of Measure";

                    trigger OnValidate()
                    begin
                        IF NewItemLongName = '' THEN
                            NewItemLongName := NewItemName;

                        IF NewItemSearchName = '' THEN
                            NewItemSearchName := NewItemName;
                    end;
                }
                field(QtyPerItemPurCOM; QtyPerItemPurCOM)
                {
                    ApplicationArea = All;
                    Caption = 'Qty. Per UoM';
                }
                field(ItemTemplateCode; ItemTemplateCode)
                {
                    ApplicationArea = All;
                    Caption = 'Item Template Code';
                    TableRelation = "Item Templ.";

                    trigger OnValidate()
                    begin
                        IF ItemTemplateCode <> '' THEN begin
                            ItemTempl.RESET;
                            ItemTempl.SetRange(ItemTempl.Code, ItemTemplateCode);
                            IF ItemTempl.FindFirst() then begin
                                IF ItemTempl."Item Category Code" <> '' then
                                    ItemCategoryCode := ItemTempl."Item Category Code";
                            end;
                        end;

                    end;
                }
                field(ItemCategoryCode; ItemCategoryCode)
                {
                    ApplicationArea = All;
                    Caption = 'Item Category Code';
                    TableRelation = "Item Category";
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Generate)
            {
                ApplicationArea = All;
                Caption = 'Generuj kod zapasu';

                trigger OnAction()
                var
                    NoSeriesMgt: Codeunit "No. Series";
                    Err1Lbl: Label 'Przypisz Kod Grupy Zapasów';
                    Err2Lbl: Label 'Przypisz Kod Podgrupy Zapasów';
                begin
                    IF ItemMatGroup = '' THEN
                        ERROR(Err1Lbl);

                    IF ItemMatSubGroup = '' THEN
                        ERROR(Err2Lbl);

                    PostFixCode := NoSeriesMgt.GetNextNo(SerialCodeNo);

                    IF PostFixCode <> '' THEN
                        NewItemCode := STRSUBSTNO('%1%2', PreFixCode, PostFixCode);
                end;
            }
            action(Create)
            {
                ApplicationArea = All;
                Caption = 'Utworz kartoteke zapasu';

                trigger OnAction()
                var
                    ItemRec: Record Item;
                    ItemUnitMeas: Record "Item Unit of Measure";
                    ItemCategory: Record "Item Category";
                    ItemTempl: Record "Item Templ.";
                begin
                    IF NewItemCode = '' THEN
                        ERROR(Text_002);

                    IF ItemDefCOM = '' THEN
                        ERROR(Text_003);

                    IF ItemRec.GET(NewItemCode) THEN
                        ERROR(Text_004, NewItemCode);

                    IF NewItemCode = '' THEN
                        ERROR(Text_007);

                    IF (NewItemName = '') THEN
                        ERROR(Text_008);

                    IF (ItemCategoryCode = '') THEN
                        ERROR(Text_009);

                    IF (ItemTemplateCode = '') THEN
                        ERROR(Text_010);


                    ItemRec.RESET();
                    ItemRec.INIT();
                    ItemRec."No." := NewItemCode;
                    ItemRec.Description := NewItemName;
                    IF NewItemSearchName <> '' THEN
                        ItemRec."Search Description" := NewItemSearchName
                    ELSE
                        ItemRec."Search Description" := NewItemName;

                    IF NewItemLongName <> '' THEN
                        ItemRec."AMC Long Item Description" := NewItemLongName
                    ELSE
                        ItemRec."AMC Long Item Description" := NewItemName;

                    ItemRec."Base Unit of Measure" := ItemDefCOM;
                    ItemRec."Sales Unit of Measure" := ItemDefCOM;
                    IF ItemPurCOM <> '' THEN
                        ItemRec."Purch. Unit of Measure" := ItemPurCOM
                    ELSE
                        ItemRec."Purch. Unit of Measure" := ItemDefCOM;

                    CASE ItemType OF
                        ItemType::Material:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::Surowce;
                        ItemType::Packing:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::Opakowania;
                    END;
                    ItemRec."AMC Item Material Group" := ItemMatGroup;
                    ItemRec."AMC Item Material SupGrup" := ItemMatSubGroup;
                    ItemRec."AMC Purchase Item" := TRUE;
                    ItemRec.INSERT();

                    ItemUnitMeas.RESET();
                    ItemUnitMeas.SETRANGE("Item No.", NewItemCode);
                    ItemUnitMeas.SETRANGE(Code, ItemDefCOM);
                    IF NOT ItemUnitMeas.FINDFIRST() THEN BEGIN
                        ItemUnitMeas.INIT();
                        ItemUnitMeas."Item No." := NewItemCode;
                        ItemUnitMeas.Code := ItemDefCOM;
                        ItemUnitMeas."Qty. per Unit of Measure" := 1;
                        ItemUnitMeas.INSERT();
                    END;

                    ItemUnitMeas.RESET();
                    ItemUnitMeas.SETRANGE("Item No.", NewItemCode);
                    ItemUnitMeas.SETRANGE(Code, ItemPurCOM);
                    IF NOT ItemUnitMeas.FINDFIRST() THEN BEGIN
                        ItemUnitMeas.INIT();
                        ItemUnitMeas."Item No." := NewItemCode;
                        ItemUnitMeas.Code := ItemPurCOM;
                        IF QtyPerItemPurCOM <> 0 THEN
                            ItemUnitMeas."Qty. per Unit of Measure" := QtyPerItemPurCOM
                        ELSE
                            ItemUnitMeas."Qty. per Unit of Measure" := 1;
                        ItemUnitMeas.INSERT();
                    END;

                    IF ItemCategoryCode <> '' THEN
                        IF ItemCategory.GET(ItemCategoryCode) THEN BEGIN
                            ItemRec.VALIDATE("Item Category Code", ItemCategoryCode);
                            ItemRec.VALIDATE("Item Tracking Code", ItemCategory."AMC Item Tracking Code");
                            ItemRec.VALIDATE("Lot Nos.", ItemCategory."AMC Lot Nos.");
                            ItemRec.VALIDATE("AMC Lot Label Code", ItemCategory."AMC Lot Label Code");
                        END;

                    IF ItemTemplateCode <> '' then
                        IF ItemTempl.GET(ItemTemplateCode) THEN BEGIN
                            ItemRec.VALIDATE("Gen. Prod. Posting Group", ItemTempl."Gen. Prod. Posting Group");
                            ItemRec.VALIDATE("VAT Prod. Posting Group", ItemTempl."VAT Prod. Posting Group");
                            ItemRec.VALIDATE("Inventory Posting Group", ItemTempl."Inventory Posting Group");
                            ItemRec.VALIDATE("Tax Group Code", ItemTempl."Tax Group Code");
                            ItemRec.VALIDATE("Costing Method", ItemTempl."Costing Method");
                            Itemrec.VALIDATE("Item Tracking Code", ItemTempl."Item Tracking Code");
                            Itemrec.Validate("Replenishment System", ItemTempl."Replenishment System");
                        END;

                    CASE ItemType of
                        ItemType::Goods:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::Towary;
                        ItemType::Material:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::Surowce;
                        ItemType::Packing:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::Opakowania;
                        ItemType::Wares:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::Wyroby;
                        ItemType::TestWares:
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::"Półprodukt";
                        ItemType::"Tempory Item":
                            ItemRec."AMC Item Type" := ItemRec."AMC Item Type"::"Próba";
                    END;


                    ItemRec.MODIFY();

                    IF ItemRec.GET(NewItemCode) THEN BEGIN
                        MESSAGE(Text_005, NewItemCode, NewItemName);
                        CurrPage.CLOSE();
                    END;
                end;
            }
        }
    }

    var
        MatGroup: Record "AMC Materials Group";
        MatSubGroup: Record "AMC Material SubGroups";
        ItemTempl: Record "Item Templ.";
        ItemType: Enum "AMC Item Material Type";
        ItemMatGroup: Code[20];
        ItemMatSubGroup: Code[10];
        SetNewItemCode: Code[20];
        PreFixCode: Code[20];
        PostFixCode: Code[20];
        SerialCodeNo: Code[20];
        ItemDefCOM: Code[10];
        PreMat: Code[10];
        NewItemCode: Code[20];
        ItemPurCOM: Code[10];
        ItemCategoryCode: Code[20];
        ItemTemplateCode: Code[20];
        QtyPerItemPurCOM: Decimal;
        NewItemName: Text[30];
        ItemGroupName: Text[100];
        ItemSubGroupName: Text[100];
        NewItemLongName: Text[70];
        NewItemSearchName: Text[30];

        Text_001: Label 'Wybierz Najpier Kod Grupy';
        Text_002: Label 'Nie przypisano nowego kodu Zapasu';
        Text_003: Label 'Nie przypisano Podstawowego Jednostki Miary';
        Text_004: Label 'Zapas o kodzie %1 już istnieje';
        Text_005: Label 'Wygenerowano kartotekę Zapasu o kodzie %1 \ %2';
        Text_006: Label 'Nie znaleziono wprowadzonego kodu';
        Text_007: Label 'Brak wygenerowanego kodu zapasu';
        Text_008: Label 'WprowadŸ nazwę zapasu';
        Text_009: Label 'Nie wprowadzono Kodu Kategorii Zapasu';
        Text_010: Label ' Nie wprowadzono Kodu Szablonu Zapasu';
}
