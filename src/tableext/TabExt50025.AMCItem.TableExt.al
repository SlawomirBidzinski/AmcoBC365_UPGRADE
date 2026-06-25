tableextension 50025 "AMC Item" extends Item
{
    DrillDownPageId = "Item List";
    LookupPageId = "Item List";

    fields
    {
        field(50000; "AMC Code"; Code[20])
        {
            Caption = 'Code'; //TODO 'Kod';
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Packing Type"; Text[50])
        {
            Caption = 'Packing Type'; //TODO 'Typ Opakowania';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Long Item Description"; Text[70])
        {
            Caption = 'Long Item Description'; //TODO 'Długa Nazwa Zapasu';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Qty per Unit"; Text[50])
        {
            Caption = 'Qty per Unit'; //TODO 'Ilość w opakowaniu';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Default QC Status"; Code[20])
        {
            Caption = 'Default QC Status'; //TODO 'Domyślny Status KJ';
            DataClassification = CustomerContent;
            Description = 'AL.19Nov12';
            TableRelation = "AMC QC Status".Code;
        }
        field(50005; "AMC Item Type"; Enum "AMC Item Type")
        {
            Caption = 'Item Type'; //TODO 'Typ Zapasu';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Item Material Group"; Code[10])
        {
            Caption = 'Item Material Group'; //TODO 'Grupa Zapasów';
            TableRelation = if ("AMC Item Type" = const(Surowce)) "AMC Materials Group"."Group Code" where("Item Type" = const(Material))
            else
            if ("AMC Item Type" = const(Opakowania)) "AMC Materials Group"."Group Code" where("Item Type" = const(Packing))
            else
            if ("AMC Item Type" = const(Wyroby)) "AMC Materials Group"."Group Code" where("Item Type" = const(Wares))
            else
            if ("AMC Item Type" = const(Towary)) "AMC Materials Group"."Group Code" where("Item Type" = const(Goods));
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Item Material SupGrup"; Code[10])
        {
            Caption = 'Item Material SupGrup'; //TODO 'Podgrupa Zapasów';
            DataClassification = CustomerContent;
            TableRelation = if ("AMC Item Type" = const(Surowce)) "AMC Material SubGroups"."Material SubGroup" where("Material Group" = field("AMC Item Material Group"),
                                                                                                          "Item Type" = const(Material))
            else
            if ("AMC Item Type" = const(Opakowania)) "AMC Material SubGroups"."Material SubGroup" where("Item Type" = const(Packing),
                                                                                                                                                                                                "Material Group" = field("AMC Item Material Group"))
            else
            if ("AMC Item Type" = const(Wyroby)) "AMC Material SubGroups"."Material SubGroup" where("Item Type" = const(Wares),
                                                                                                                                                                                                                                                                                  "Material Group" = field("AMC Item Material Group"))
            else
            if ("AMC Item Type" = const(Towary)) "AMC Material SubGroups"."Material SubGroup" where("Item Type" = const(Goods),
                                                                                                                                                                                                                                                                                                                                                                    "Material Group" = field("AMC Item Material Group"));
        }
        field(50008; "AMC Item Label Code"; Code[20])
        {
            Caption = 'Item Label Code'; //TODO 'Kod etyk. zapasu';
            Description = 'AL.13Dec12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Lot Label Code"; Code[20])
        {
            Caption = 'Lot Label Code'; //TODO 'Kod etyk. partii';
            Description = 'AL.13Dec12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Purchase Item"; Boolean)
        {
            Caption = 'Purchase Item'; //TODO 'Zapas Zakupy';
            DataClassification = CustomerContent;
        }
        field(50011; "AMC Sales Item"; Boolean)
        {
            Caption = 'Sales Item'; //TODO 'Zapas Sprzedaż';
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Allergen Planning Dim."; Code[20])
        {
            Caption = 'Allergen Planning Dim.'; //TODO 'Alergen - wymiar planowania';
            Description = 'AL.19Dec12';
            DataClassification = CustomerContent;
        }
        field(50013; "AMC Colour Planning Dimension"; Code[20])
        {
            Caption = 'Colour Planning Dimension'; //TODO 'Kolor - wymiar planowania';
            Description = 'AL.19Dec12';
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Pack Label Code"; Code[20])
        {
            Caption = 'Pack Label Code'; //TODO 'Kod etyk. zbiorczej';
            Description = 'AL.19Dec12';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50015; "AMC Pack Unit of Measure"; Code[10])
        {
            Caption = 'Pack Unit of Measure'; //TODO 'Jednostka miary opakowania';
            Description = 'AL.03Jan13';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(50016; "AMC Pack Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Pack Quantity'; //TODO 'Ilość w opakowaniu';
            DecimalPlaces = 0 : 3;
            Description = 'AL.03Jan13';
            DataClassification = CustomerContent;
        }
        field(50017; "AMC Production Lot"; Decimal)
        {
            Caption = 'Production Lot'; //TODO 'Szarża produkcji / zakupu';
            Description = 'AL.04Mar13';
            DataClassification = CustomerContent;
        }
        field(50018; "AMC Product Safety Stock"; Decimal)
        {
            Caption = 'Product Safety Stock'; //TODO 'Stan bezpieczny wyrobu';
            Description = 'AL.04Mar13';
            DataClassification = CustomerContent;
        }
        field(50019; "AMC Planning Location"; Code[10])
        {
            Caption = 'Planning Location'; //TODO 'Lokalizacja planowania';
            Description = 'AL.04Mar13';
            TableRelation = Location;
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Items on M.GL"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M.GL'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Items on M.GL'; //TODO 'Zapasy M.GL';
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;

        }
        field(50021; "AMC Items on M.UT"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M.UT'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Items on M.UT'; //TODO 'Zapasy M.UT';
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;

        }
        field(50022; "AMC Items on M.SUR"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M.SUR'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Items on M.SUR'; //TODO 'Zapasy M.SUR';
            DecimalPlaces = 0 : 3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50023; "AMC Items on M.REKLAM"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M.REKLAM'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Items on M.REKLAM'; //TODO 'Zapasy M.REKLAM';
            DecimalPlaces = 0 : 3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50024; "AMC Items on M.PROBY"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M.PROBY'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Items on M.PROBY'; //TODO 'Zapasy M.PROBY';
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(50025; "AMC Items on M.N.WART"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M.N.WART'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Zapasy M.N.WART';
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(50026; "AMC Items on M.SUR (MS)"; Decimal)
        {
            CalcFormula = sum("Warehouse Entry"."Qty. (Base)" where("Item No." = field("No."),
                                                                     "Location Code" = const('M.SUR'),
                                                                     "Zone Code" = filter('MS|PRZYJĘCIE')));
            Caption = 'Zapasy M.SUR (MS)';
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
        }
        field(50027; "AMC Item reserved"; Boolean)
        {
            Caption = 'Zapas Zastrzeżony';
            DataClassification = CustomerContent;
        }
        field(50028; "AMC CN Code"; Code[20])
        {
            Caption = 'Kod CN';
            DataClassification = CustomerContent;
        }
        field(50029; "AMC Aromat IFF"; Boolean)
        {
            Caption = 'Aromat IFF';
            DataClassification = CustomerContent;
        }
        field(50030; "AMC Item Eng Translation"; Text[100])
        {
            CalcFormula = lookup("Item Translation"."AMC English Long Description" where("Item No." = field("No."),
                                                                                      "Language Code" = const('ENU')));
            Caption = 'Tłumaczenie Ang.';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50031; "AMC Production Date Set"; Boolean)
        {
            Caption = 'Production Date Set';
            DataClassification = CustomerContent;
        }
        field(50032; "AMC Production EXP Label Date"; Boolean)
        {
            Caption = 'Pełna Data Ważności';
            DataClassification = CustomerContent;
        }
        field(50033; "AMC Item Label Code - Pack"; Code[20])
        {
            Caption = 'Kod etyk. - Zbiorcze';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50034; "AMC Item Label Code - Ending"; Code[20])
        {
            Caption = 'Kod etyk. - Końcówki';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50035; "AMC Item Label Code Add."; Code[20])
        {
            Caption = 'Kod etyk. zapasu Dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Lot Label Code Add."; Code[20])
        {
            Caption = 'Kod etyk. partii Dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50037; "AMC Item Label Code-Pack Add."; Code[20])
        {
            Caption = 'Kod etykiety zapasu - Zbiorcze Dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50038; "AMC Item Label Code-Ending Add"; Code[20])
        {
            Caption = 'Kod etykiety zapasu - Końcówki Dodatk.';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50039; "AMC Aromat NB"; Boolean)
        {
            Caption = 'Aromat N&&B';
            DataClassification = CustomerContent;
        }
        field(50040; "AMC Qty days of check Exp Date"; Integer)
        {
            Caption = 'Qty days of check Exp Date';
            DataClassification = CustomerContent;
        }
        field(50041; "AMC Units per Palet"; Decimal)
        {
            Caption = 'Il. w palecie';
            DataClassification = CustomerContent;
        }
        field(50042; "AMC PO Item Hierarchy Descr."; Text[80])
        {
            Caption = 'Nazwa Hierarchii PO';
            DataClassification = CustomerContent;
        }
        field(50043; "AMC PO Item Hierarchy Key"; Code[20])
        {
            Caption = 'Kod Hierarchii PO';
            DataClassification = CustomerContent;
        }
        field(50044; "AMC RiD Item"; Boolean)
        {
            Caption = 'Zapas RiD';
            DataClassification = CustomerContent;
        }
        field(50045; "AMC Sales Process Item"; Boolean)
        {
            Caption = 'Sales Process Item';
            DataClassification = CustomerContent;
        }
        field(50046; "AMC Item Frutarom"; Text[60])
        {
            Caption = 'Item Frutarom';
            DataClassification = CustomerContent;
        }
        field(50047; "AMC Producent"; Code[20])
        {
            Caption = 'Fabryka';
            TableRelation = "AMC Item Production".Producent where("Entry Type" = const(Producent));
            DataClassification = CustomerContent;
        }
        field(50048; "AMC Fabryka"; Code[20])
        {
            Caption = 'Brand';
            TableRelation = "AMC Item Production".Fabryka where("Entry Type" = const(Fabryka));
            DataClassification = CustomerContent;
        }
        field(50049; "AMC Intern. Code"; Code[20])
        {
            Caption = 'Kod Wewn.';
            DataClassification = CustomerContent;
        }
        field(50050; "AMC Int. EAN Code"; Code[20])
        {
            Caption = 'Kod EAN 2';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Nazwa Producenta"; Text[50])
        {
            CalcFormula = lookup("AMC Item Production"."Nazwa Producenta" where(Producent = field("AMC Producent"),
                                                                             "Entry Type" = const(Producent)));
            Caption = 'Nazwa Fabryki';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50052; "AMC Nazwa Fabryki"; Text[50])
        {
            CalcFormula = lookup("AMC Item Production"."Nazwa Fabryki" where(Fabryka = field("AMC Fabryka"),
                                                                          "Entry Type" = const(Fabryka)));
            Caption = 'Nazwa Brand';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50053; "AMC Item Special"; Boolean)
        {
            Caption = 'Zapas Specjalny';
            DataClassification = CustomerContent;
        }
        field(50054; "AMC Item Budget 2022"; Boolean)
        {
            Caption = 'Zapas Budżet 2022';
            DataClassification = CustomerContent;
        }
        field(50055; "AMC Item KJ Weight [kg]"; Decimal)
        {
            Caption = 'Item KJ Weight [kg]';
            DecimalPlaces = 3 : 3;
            DataClassification = CustomerContent;
        }
        field(50056; "AMC Out Off Item List"; Boolean)
        {
            Caption = 'Wyłącz z Listy Zapasów';
            DataClassification = CustomerContent;
        }
        field(50057; "AMC Items on KJ"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Remaining Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = const('M. KJ'),
                                                                              "Remaining Quantity" = filter(<> 0)));
            Caption = 'Items on KJ';
            DecimalPlaces = 0 : 3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50058; "AMC Max Item Stock"; Decimal)
        {
            Caption = 'Maksymalny Stock Zapaów';
            DataClassification = CustomerContent;
        }
        field(50059; "AMC Inventory Qty"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry"."Quantity" where("Item No." = field("No."),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Lot No." = field("Lot No. Filter"),
                                                                              "Serial No." = field("Serial No. Filter"),
                                                                              "Location Code" = field("Location Filter")));
            Caption = 'Zapasy lokalizacji';
            DecimalPlaces = 0 : 3;
            FieldClass = FlowField;
        }
        field(50060; "AMC Set to Export"; Boolean)
        {
            Caption = 'Set to Export';
            DataClassification = CustomerContent;
        }
        field(50061; "AMC Export Date"; Date)
        {
            Caption = 'Data Exportu';
            DataClassification = CustomerContent;
        }
        field(50062; "AMC Export Time"; Time)
        {
            Caption = 'Godz. Exportu';
            DataClassification = CustomerContent;
        }
        field(50063; "AMC Item Hierarchy"; Code[20])
        {
            Caption = 'Kod struktury zapasu';
            TableRelation = "AMC Item hierarchy";
            DataClassification = CustomerContent;
        }
        field(50064; "AMC Lot Label Code RU"; Code[20])
        {
            Caption = 'Kod etyk. partii RU';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50065; "AMC Lot Label Code Zb. RU"; Code[20])
        {
            Caption = 'Lot Label Code Zb. RU';
            TableRelation = "AMC Label";
            DataClassification = CustomerContent;
        }
        field(50070; "AMC Ask for Calculate Date"; DateTime)
        {
            Caption = 'Data Zlecenia Wyceny';
            DataClassification = CustomerContent;
        }
        field(50071; "AMC Calculate Item"; Boolean)
        {
            Caption = 'Zleć Wycenę';
            DataClassification = CustomerContent;
        }
        field(50072; "AMC Set Calculete UserID"; Code[20])
        {
            Caption = 'Zlecający Wycenę';
            DataClassification = CustomerContent;
        }
        field(50073; "AMC Calculate Value"; Decimal)
        {
            Caption = 'Wartość Wyceny';
            DataClassification = CustomerContent;
        }
        field(50074; "AMC Calculate Value UserID"; Code[20])
        {
            Caption = 'Użytkownik Wyceniający';
            DataClassification = CustomerContent;
        }
        field(50075; "AMC Calculate Date"; DateTime)
        {
            Caption = 'Data Wyceny';
            DataClassification = CustomerContent;
        }
        field(50076; "AMC Calculate Notes"; Text[100])
        {
            Caption = 'Notatki Wyceny';
            DataClassification = CustomerContent;
        }
        field(50077; "AMC Trade Value"; Decimal)
        {
            Caption = 'Wycena Handlowa';
            DecimalPlaces = 5 : 5;
            DataClassification = CustomerContent;
        }
        field(50078; "AMC Trade Value Date"; DateTime)
        {
            Caption = 'Data Wyceny Handlowej';
            DataClassification = CustomerContent;
        }
        field(50081; "AMC Item Qty Item Stock"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Location Code" = field("Location Filter")));
            Caption = 'Ilość Zapasu - Zapis Księgi';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50082; "AMC Item Qty Warehouse Stock"; Decimal)
        {
            CalcFormula = sum("Warehouse Entry".Quantity where("Item No." = field("No."),
                                                                "Location Code" = field("Location Filter")));
            Caption = 'Ilość Zapasu - Zapis Mag';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50085; "AMC Production BOM Karagen"; Code[20])
        {
            Caption = 'Production BOM No.';
            TableRelation = "Production BOM Header" where("AMC BOM Type" = const(Production));
            DataClassification = CustomerContent;
        }
        field(50100; "AMC Place of Order"; Code[10])
        {
            Caption = 'Miejsce Zamówienia';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Name Place of order"; Text[50])
        {
            Caption = 'Nazwa Miejsca Zamówienia';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50201; "AMC Prod Forecast Mo"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Pn';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50202; "AMC Prod Forecast Tu"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Wt';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50203; "AMC Prod Forecast We"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Śr';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50204; "AMC Prod Forecast Th"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Cz';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50205; "AMC Prod Forecast Fr"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Pt';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50206; "AMC Prod Forecast Sa"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Sb';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50207; "AMC Prod Forecast Su"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Ni';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50208; "AMC Production Forecast"; Decimal)
        {
            BlankZero = true;
            CalcFormula = sum("AMC Forecast Planning"."Week Forecast Qty" where("Forecast Code" = field("AMC Forecast Code Filter"),
                                                                             Year = field("AMC Year Filter"),
                                                                             "Week No." = field("AMC Week No Filter"),
                                                                             "Location Code" = field("Location Filter"),
                                                                             "Item No." = field("No.")));
            Caption = 'Prognoza Zbiorcza';
            DecimalPlaces = 0 : 2;
            FieldClass = FlowField;
        }
        field(50209; "AMC Forecast No Print Item"; Boolean)
        {
            Caption = 'Nie Drukuj na Prognozie Produkcji';
            DataClassification = CustomerContent;
        }
        field(50210; "AMC Forecast Prev Period Filt."; Date)
        {
            Caption = 'Filtr Poprzedni Okres Prognozy';
            DataClassification = CustomerContent;
        }
        field(50211; "AMC Forecast Prev Period"; Decimal)
        {
            BlankZero = true;
            Caption = 'Prognoza Poprzedni Okres';
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50213; "AMC Year Filter"; Integer)
        {
            Caption = 'Filtr Roku';
            FieldClass = FlowFilter;
        }
        field(50214; "AMC Week No Filter"; Integer)
        {
            Caption = 'Filtr Tygodnia';
            FieldClass = FlowFilter;
        }
        field(50215; "AMC Forecast Code Filter"; Code[10])
        {
            Caption = 'Filtr Kodu Prognozy';
            FieldClass = FlowFilter;
            TableRelation = "Production Forecast Name";
        }
        field(50216; "AMC Specyfication Date"; Date)
        {
            Caption = 'Data Wydania Specyfikacji';
            DataClassification = CustomerContent;
        }
        field(50217; "AMC Components Qty"; Integer)
        {
            CalcFormula = count("Production BOM Line" where(Type = const(Item),
                                                             "AMC BOM Type" = const(Production),
                                                             "Production BOM No." = field("Production BOM No.")));
            Caption = 'Ilość Komponentów';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50219; "AMC Packing Comp. Qty"; Integer)
        {
            CalcFormula = count("Production BOM Line" where(Type = const(Item),
                                                             "AMC BOM Type" = const(Production),
                                                             "Production BOM No." = field("Production BOM No."),
                                                             "No." = filter('O.*')));
            Caption = 'Ilość Komponet. Opak';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50220; "AMC BOM Dozowanie R&&D"; Text[100])
        {
            CalcFormula = lookup("Production BOM Header"."AMC Dozowanie" where("No." = field("AMC RiD BOM Code"),
                                                                          "AMC BOM Type" = const(RiD)));
            Caption = 'Dozowanie BOM R&&D';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50221; "AMC BOM Dozowanie Prod"; Text[100])
        {
            CalcFormula = lookup("Production BOM Header"."AMC Dozowanie" where("No." = field("AMC RiD BOM Code"),
                                                                          "AMC BOM Type" = const(Production)));
            Caption = 'Dozowanie BOM Prod';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50301; "AMC Purchases All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Value Entry"."Purchase Amount (Actual)" where("Item Ledger Entry Type" = const(Purchase),
                                                                              "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                              "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                              "Location Code" = field("Location Filter"),
                                                                              "Drop Shipment" = field("Drop Shipment Filter"),
                                                                              "Variant Code" = field("Variant Filter"),
                                                                              "Posting Date" = field("Date Filter"),
                                                                              "Source No." = field("AMC Firm Source Filter")));
            Caption = 'Purchases (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50303; "AMC Positive Adjmt. All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Value Entry"."Cost Amount (Actual)" where("Item Ledger Entry Type" = const("Positive Adjmt."),
                                                                          "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                          "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                          "Location Code" = field("Location Filter"),
                                                                          "Drop Shipment" = field("Drop Shipment Filter"),
                                                                          "Variant Code" = field("Variant Filter"),
                                                                          "Posting Date" = field("Date Filter"),
                                                                          "Source No." = field("AMC Firm Source Filter")));
            Caption = 'Positive Adjmt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50304; "AMC Negative Adjmt. All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Value Entry"."Cost Amount (Actual)" where("Item Ledger Entry Type" = const("Negative Adjmt."),
                                                                          "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                          "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                          "Location Code" = field("Location Filter"),
                                                                          "Drop Shipment" = field("Drop Shipment Filter"),
                                                                          "Variant Code" = field("Variant Filter"),
                                                                          "Posting Date" = field("Date Filter"),
                                                                          "Source No." = field("AMC Firm Source Filter")));
            Caption = 'Negative Adjmt. (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50305; "AMC COGS All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Value Entry"."Cost Amount (Actual)" where("Item Ledger Entry Type" = const(Sale),
                                                                           "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                           "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                           "Location Code" = field("Location Filter"),
                                                                           "Drop Shipment" = field("Drop Shipment Filter"),
                                                                           "Variant Code" = field("Variant Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Source No." = field("AMC Firm Source Filter")));
            Caption = 'COGS (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50306; "AMC Firm Source Filter"; Code[20])
        {
            Caption = 'Filtr Kontrahenta';
            FieldClass = FlowFilter;
        }
        field(50307; "AMC RiD BOM Code"; Code[20])
        {
            Caption = 'Kod BOM-u R&&D';
            TableRelation = "Production BOM Header"."No." where("AMC BOM Type" = const(RiD));
            DataClassification = CustomerContent;
        }
        field(50400; "AMC Białko"; Decimal)
        {
            Caption = 'Białko';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50401; "AMC Węglowodany"; Decimal)
        {
            Caption = 'Węglowodany';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50402; "AMC Cukry"; Decimal)
        {
            Caption = 'Cukry';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50403; "AMC Tłuszcz"; Decimal)
        {
            Caption = 'Tłuszcz';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50404; "AMC Kw. tłuszcz. nasycone"; Decimal)
        {
            Caption = 'Kw. tłuszcz. nasycone';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50405; "AMC Sód"; Decimal)
        {
            Caption = 'Sód';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50406; "AMC Sól"; Decimal)
        {
            Caption = 'Sól';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50407; "AMC Błonnik"; Decimal)
        {
            Caption = 'Błonnik';
            DecimalPlaces = 0 : 3;
            DataClassification = CustomerContent;
        }
        field(50408; "AMC Etykieta / Opis"; Text[100])
        {
            Caption = 'Etykieta / Opis';
            DataClassification = CustomerContent;
        }
        field(50409; "AMC Alkoh. wielowod."; Decimal)
        {
            Caption = 'Alkohole wielowodorotlenowe';
            DataClassification = CustomerContent;
        }
        field(50410; "AMC Salatrimy"; Decimal)
        {
            Caption = 'Salatrimy';
            DataClassification = CustomerContent;
        }
        field(50411; "AMC Alkohol (etanol)"; Decimal)
        {
            Caption = 'Alkohol (etanol)';
            DataClassification = CustomerContent;
        }
        field(50412; "AMC Kwasy organiczne"; Decimal)
        {
            Caption = 'Kwasy organiczne';
            DataClassification = CustomerContent;
        }
        field(50450; "AMC Dangerous substance"; Boolean)
        {
            Caption = 'Subst. Niebezpieczna';
            DataClassification = CustomerContent;
        }
        field(50451; "AMC Cold store"; Boolean)
        {
            Caption = 'Przechowywanie - Chłodnia';
            DataClassification = CustomerContent;
        }
        field(50452; "AMC Chine Source"; Boolean)
        {
            Caption = 'Poch. chińskie';
            DataClassification = CustomerContent;
        }
        field(50453; "AMC Vegan"; Boolean)
        {
            Caption = 'Vegan';
            DataClassification = CustomerContent;
        }
        field(50454; "AMC Vegetarian"; Boolean)
        {
            Caption = 'Vegetarian';
            DataClassification = CustomerContent;
        }
        field(50455; "AMC Animal"; Boolean)
        {
            Caption = 'Zwierzęce';
            DataClassification = CustomerContent;
        }
        field(50456; "AMC Halal"; Boolean)
        {
            Caption = 'Halal';
            DataClassification = CustomerContent;
        }
        field(50457; "AMC Kosher"; Boolean)
        {
            Caption = 'Kosher';
            DataClassification = CustomerContent;
        }
        field(50458; "AMC Color"; Enum "AMC Color")
        {
            Caption = 'Zabarwienie';
            DataClassification = CustomerContent;
        }
        field(50459; "AMC Animal Incl."; Boolean)
        {
            Caption = 'Zawiera zwierzęce';
            DataClassification = CustomerContent;
        }
        field(50501; "AMC Białko kJ"; Decimal)
        {
            Caption = 'Białko kJ';
            DataClassification = CustomerContent;
        }
        field(50502; "AMC Węglowodany kJ"; Decimal)
        {
            Caption = 'Węglowodany kJ';
            DataClassification = CustomerContent;
        }
        field(50503; "AMC Tłuszcz kJ"; Decimal)
        {
            Caption = 'Tłuszcz kJ';
            DataClassification = CustomerContent;
        }
        field(50504; "AMC Błonnik kJ"; Decimal)
        {
            Caption = 'Błonnik kJ';
            DataClassification = CustomerContent;
        }
        field(50511; "AMC Białko kcal"; Decimal)
        {
            Caption = 'Białko kcal';
            DataClassification = CustomerContent;
        }
        field(50512; "AMC Węglowodany kcal"; Decimal)
        {
            Caption = 'Węglowodany kcal';
            DataClassification = CustomerContent;
        }
        field(50513; "AMC Tłuszcz kcal"; Decimal)
        {
            Caption = 'Tłuszcz kcal';
            DataClassification = CustomerContent;
        }
        field(50514; "AMC Błonnik kcal"; Decimal)
        {
            Caption = 'Błonnik kcal';
            DataClassification = CustomerContent;
        }
        field(50521; "AMC Kaloryczn kJ"; Decimal)
        {
            Caption = 'Kaloryczn kJ';
            DataClassification = CustomerContent;
        }
        field(50522; "AMC Kaloryczn kcal"; Decimal)
        {
            Caption = 'Kaloryczn kcal';
            DataClassification = CustomerContent;
        }
        field(50523; "AMC Alkoh. wielowod. kJ"; Decimal)
        {
            Caption = 'Alkohole wielowodorotlenowe kJ';
            DataClassification = CustomerContent;
        }
        field(50524; "AMC Salatrimy kJ"; Decimal)
        {
            Caption = 'Salatrimy kJ';
            DataClassification = CustomerContent;
        }
        field(50525; "AMC Alkohol (etanol) kJ"; Decimal)
        {
            Caption = 'Alkohol (etanol) kJ';
            DataClassification = CustomerContent;
        }
        field(50526; "AMC Kwasy organiczne kJ"; Decimal)
        {
            Caption = 'Kwasy organiczne kJ';
            DataClassification = CustomerContent;
        }
        field(50527; "AMC Alkoh. wielowod. kcal"; Decimal)
        {
            Caption = 'Alkohole wielowodorotlenowe kcal';
            DataClassification = CustomerContent;
        }
        field(50528; "AMC Salatrimy kcal"; Decimal)
        {
            Caption = 'Salatrimy kcal';
            DataClassification = CustomerContent;
        }
        field(50529; "AMC Alkohol (etanol) kcal"; Decimal)
        {
            Caption = 'Alkohol (etanol) kcal';
            DataClassification = CustomerContent;
        }
        field(50530; "AMC Kwasy organiczne kcal"; Decimal)
        {
            Caption = 'Kwasy organiczne kcal';
            DataClassification = CustomerContent;
        }
        field(53002; "AMC Sales All (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Value Entry"."Sales Amount (Actual)" where("Item Ledger Entry Type" = const(Sale),
                                                                           "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                           "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                                           "Location Code" = field("Location Filter"),
                                                                           "Drop Shipment" = field("Drop Shipment Filter"),
                                                                           "Variant Code" = field("Variant Filter"),
                                                                           "Posting Date" = field("Date Filter"),
                                                                           "Source No." = field("AMC Firm Source Filter")));
            Caption = 'Sales (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53003; "AMC Planning Component (Qty.)"; Decimal)
        {
            CalcFormula = sum("Planning Component"."Expected Quantity (Base)" where("Item No." = field("No."),
                                                                                     "Due Date" = field("Date Filter"),
                                                                                     "Location Code" = field("Location Filter"),
                                                                                     "Variant Code" = field("Variant Filter"),
                                                                                     "Shortcut Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                                                     "Shortcut Dimension 2 Code" = field("Global Dimension 2 Filter")));
            Caption = 'Planning Issues (Qty.)';
            DecimalPlaces = 0 : 5;
            Description = 'AL.29Mar13';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53005; "AMC Sales Qty"; Decimal)
        {
            CalcFormula = - sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                   "Entry Type" = const(Sale),
                                                                   "Posting Date" = field("Date Filter")));
            Caption = 'Ilość Sprzedaży za Okres';
            FieldClass = FlowField;
        }
        field(53006; "AMC Production Qty"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Entry Type" = filter(Output | Purchase),
                                                                  "Posting Date" = field("Date Filter")));
            Caption = 'Ilość Produkcji / Zakupu za Okres';
            FieldClass = FlowField;
        }
        field(53007; "AMC Stock Qty"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                  "Posting Date" = field("Date Filter"),
                                                                  "Location Code" = field("Location Filter")));
            Caption = 'Ilość Zapasu za Okres';
            FieldClass = FlowField;
        }
        field(53008; "AMC Item Consumption"; Decimal)
        {
            CalcFormula = - sum("Item Ledger Entry".Quantity where("Item No." = field("No."),
                                                                   "Entry Type" = filter(Consumption),
                                                                   "Posting Date" = field("Date Filter")));
            Caption = 'Ilość Zużycia Produkcyjnego';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53009; "AMC Production Value"; Decimal)
        {
            BlankZero = true;
            CalcFormula = sum("Value Entry"."Cost Amount (Actual)" where("Item No." = field("No."),
                                                                          "Item Ledger Entry Type" = filter(Output | Purchase),
                                                                          "Posting Date" = field("Date Filter")));
            Caption = 'Kwota Produkcji / Zakupu';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53010; "AMC Item Consump. Value"; Decimal)
        {
            BlankZero = true;
            CalcFormula = - sum("Value Entry"."Cost Amount (Actual)" where("Item No." = field("No."),
                                                                           "Item Ledger Entry Type" = filter(Consumption),
                                                                           "Posting Date" = field("Date Filter")));
            Caption = 'Kwota Zużycia Produkcyjnego';
            Editable = false;
            FieldClass = FlowField;
        }
        field(53051; "AMC Date Filter CM"; Date)
        {
            Caption = 'Filtr Daty BM';
            FieldClass = FlowFilter;
        }
        field(53052; "AMC Date Filter CM-1M"; Date)
        {
            Caption = 'Filtr Daty BM-1M';
            FieldClass = FlowFilter;
        }
        field(53053; "AMC Date Filter CM-2M"; Date)
        {
            Caption = 'Filtr Daty BM-2M';
            FieldClass = FlowFilter;
        }
        field(53055; "AMC Date Filter CM-3M"; Date)
        {
            Caption = 'Filtr Daty BM-3M';
            FieldClass = FlowFilter;
        }
        field(53056; "AMC Date Filter CM-4M"; Date)
        {
            Caption = 'Filtr Daty BM-4M';
            FieldClass = FlowFilter;
        }
        field(53057; "AMC Date Filter CM-5M"; Date)
        {
            Caption = 'Filtr Daty BM-5M';
            FieldClass = FlowFilter;
        }
        field(53058; "AMC Date Filter CM-6M"; Date)
        {
            Caption = 'Filtr Daty BM-6M';
            FieldClass = FlowFilter;
        }
        field(53059; "AMC Date Filter CM-7M"; Date)
        {
            Caption = 'Filtr Daty BM-7M';
            FieldClass = FlowFilter;
        }
        field(53060; "AMC Date Filter CM-8M"; Date)
        {
            Caption = 'Filtr Daty BM-8M';
            FieldClass = FlowFilter;
        }
        field(53061; "AMC Date Filter CM-9M"; Date)
        {
            Caption = 'Filtr Daty BM-9M';
            FieldClass = FlowFilter;
        }
        field(53062; "AMC Date Filter CM-10M"; Date)
        {
            Caption = 'Filtr Daty BM-10M';
            FieldClass = FlowFilter;
        }
        field(53063; "AMC Date Filter CM-11M"; Date)
        {
            Caption = 'Filtr Daty BM-11M';
            FieldClass = FlowFilter;
        }
        field(53064; "AMC Date Filter CM-12M"; Date)
        {
            Caption = 'Filtr Daty BM-12M';
            FieldClass = FlowFilter;
        }
        field(53065; "AMC Date Filter 12M"; Date)
        {
            Caption = 'Filtr Daty 12M';
            FieldClass = FlowFilter;
        }
    }

    keys
    {
        key(K50000; "AMC Item Type", "AMC Long Item Description") { }
    }

    procedure AMCCreateProdBomHeader()
    var
        ProdBomHeader: Record "Production BOM Header";
        Text027: Label 'Czy utworzyc nowy BOM dla zapasu nr %1?';
    begin
        IF NOT ProdBomHeader.GET(Rec."No.") THEN BEGIN
            IF CONFIRM(STRSUBSTNO(Text027, Rec."No."), TRUE) THEN BEGIN
                ProdBomHeader.INIT();
                ProdBomHeader."No." := Rec."No.";
                ProdBomHeader.INSERT(TRUE);
                ProdBomHeader.VALIDATE(Description, Rec.Description);
                ProdBomHeader."Description 2" := Rec."Description 2";
                ProdBomHeader.VALIDATE("Unit of Measure Code", Rec."Base Unit of Measure");
                ProdBomHeader.MODIFY(TRUE);
                Rec.VALIDATE("Production BOM No.", Rec."No.");
                Page.RUN(Page::"Production BOM", ProdBomHeader);
            END;
        END ELSE BEGIN
            IF Rec."Production BOM No." = '' THEN
                Rec."Production BOM No." := ProdBomHeader."No.";
            Page.RUN(Page::"Production BOM", ProdBomHeader);
        END;
    end;

    procedure AMCCreateRoutingHeader()
    var
        ProdRoutingHeader: Record "Routing Header";
        Text028: Label 'Czy utworzyc nowa marszrute dla zapasu nr %1?';
    begin
        IF NOT ProdRoutingHeader.GET("No.") THEN BEGIN
            IF CONFIRM(STRSUBSTNO(Text028, "No."), TRUE) THEN BEGIN
                ProdRoutingHeader.INIT();
                ProdRoutingHeader."No." := "No.";
                ProdRoutingHeader.INSERT(TRUE);
                ProdRoutingHeader.VALIDATE(Description, Description);
                ProdRoutingHeader."Description 2" := "Description 2";
                ProdRoutingHeader.MODIFY(TRUE);
                VALIDATE("Routing No.", "No.");
                Page.RUN(Page::Routing, ProdRoutingHeader);
            END;
        END ELSE BEGIN
            IF "Routing No." = '' THEN
                "Routing No." := ProdRoutingHeader."No.";

            Page.RUN(Page::Routing, ProdRoutingHeader);
        END;
    end;

    procedure AMCCreateBarcode()
    var
        ItemCategory: Record "Item Category";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        lcNoSeries: Code[10];
        errBarCodeAlreadyCreated: Label 'Barcode for Item %1 already created';
    begin
        ItemCategory.GET("Item Category Code");
        ItemCategory.TESTFIELD("AMC EAN-13 Barcode Nos.");


        IF ("No. 2" <> '') THEN
            ERROR(errBarCodeAlreadyCreated, "No.");
        NoSeriesMgt.InitSeries(ItemCategory."AMC EAN-13 Barcode Nos.", '', 0D, "No. 2", lcNoSeries);

        VALIDATE("No. 2");

        Rec.AMCCheckBarCode();
    end;

    procedure AMCCheckBarcode()
    var
        lrItem: Record Item;
        errDuplicateNo2: Label 'Bar Code %1 exists in intem %2';
    begin
        lrItem.RESET();
        lrItem.SETCURRENTKEY("No. 2");
        lrItem.SETFILTER("No.", '<>%1', "No.");
        lrItem.SETRANGE("No. 2", "No. 2");
        IF lrItem.FindFirst() THEN
            ERROR(errDuplicateNo2, "No. 2", lrItem."No.");
    end;
}