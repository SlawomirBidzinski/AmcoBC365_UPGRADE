table 50033 "AMC Terminal Entry"
{
    Caption = 'Zapis terminala';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Source ID"; Integer)
        {
            Caption = 'Identyfikator źródła';
        }
        field(2; "User ID"; Code[20])
        {
            Caption = 'Identyfikator użytkownika';
        }
        field(3; "Document Type"; Option)
        {
            Caption = 'Typ dokumentu';
            OptionCaption = 'Przyjęcie zakupu,Wydanie sprzedaży,Zlecenie przesunięcia,Dziennik inwentaryzacji,Pobranie mag.,Przesunięcie mag.,Dziennik inw. mag.';
            OptionMembers = "Purchase Receipt","Sales Shipment","Transfer Order","Phys. Inventory Jnl.","Whse. Pick","Whse. Movement","Whse. Phys. Inventory";
        }
        field(4; "Document No."; Code[20])
        {
            Caption = 'Nr dokumentu';
        }
        field(5; "Item Journal Template"; Code[10])
        {
            Caption = 'Szablon dziennika zapasów';
        }
        field(6; "Item Journal Batch"; Code[10])
        {
            Caption = 'Nazwa instancji dziennika';
        }
        field(7; "Entry No."; Integer)
        {
            Caption = 'Nr zapisu';
        }
        field(8; "EAN Type"; Option)
        {
            Caption = 'Typ kodu EAN';
            OptionCaption = 'Kod zapasu,Kod serii,Kod partii';
            OptionMembers = "Item Code","Serial Code","Lot code";
        }
        field(9; "Bar Code"; Code[100])
        {
            Caption = 'Kod kreskowy';
        }
        field(10; "Cross-Reference No."; Code[20])
        {
            Caption = 'Nr odsyłacza';
            //FIXME Item Cross Reference
            /*
            TableRelation = IF ("EAN Type" = CONST("Item Code")) "Item Cross Reference"."Cross-Reference No." WHERE (Cross-Reference Type=CONST(Bar Code),
                                                                                                               Item No.=FIELD(Item No.),
                                                                                                               Variant Code=FIELD(Variant Code))
                                                                                                               ELSE IF (EAN Type=CONST(Serial Code)) "Item Cross Reference"."Cross-Reference No." WHERE (Cross-Reference Type=CONST(4),
                                                                                                                                                                                                         Item No.=FIELD(Item No.),
                                                                                                                                                                                                         Variant Code=FIELD(Variant Code));
            ValidateTableRelation = false;
            */
            //This property is currently not supported
            //TestTableRelation = false;

        }
        field(11; "Encoded Variant Code"; Code[20])
        {
            Caption = 'Identyfikator wariantu';
            TableRelation = "AMC BOM Line Alergen Set"."ID Code" where ("Production BOM Line" = field("Item No."));
        }
        field(12; "Item No."; Code[20])
        {
            Caption = 'Nr zapasu';
            TableRelation = Item;
        }
        field(13; "Variant Code"; Code[20])
        {
            Caption = 'Kod wariantu';
        }
        field(14; Quantity; Decimal)
        {
            Caption = 'Ilość';
        }
        field(15; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Kod jednostki miary';
            TableRelation = "Item Unit of Measure".Code where ("Item No." = field("Item No."));
        }
        field(16; "Source Line No."; Integer)
        {
            Caption = 'Nr wiersza źródła';
            TableRelation = if ("Document Type" = const("Purchase Receipt")) "Warehouse Receipt Line"."Line No." where ("Item No." = field("Item No."),
                                                                                                                  "No." = field("Document No."))
                                                                                                                  else if ("Document Type" = const("Sales Shipment")) "Warehouse Shipment Line"."Line No." where ("Item No." = field("Item No."),
                                                                                                                                                                                                            "No." = field("Document No."));
        }
        field(17; "Register Date"; Date)
        {
            Caption = 'Data rejestracji';
        }
        field(18; "Register Time"; Time)
        {
            Caption = 'Godzina rejestracji';
        }
        field(19; "Encoding Schema"; Code[10])
        {
            Caption = 'Schemat kodowania';
            TableRelation = "AMC Material Group";
        }
        field(20; "Create Item Cross Reference"; Boolean)
        {
            Caption = 'Utwórz odsyłacz';
        }
        field(21; "Cross-Reference Exist"; Boolean)
        {
            Caption = 'Odsyłacz';
            Editable = false;
            //FIXME Item Cross Reference
            /*
            CalcFormula = Exist("Item Cross Reference" WHERE (Item No.=FIELD(Item No.),
                                                              Cross-Reference No.=FIELD(Cross-Reference No.)));
            FieldClass = FlowField;
            */
        }
        field(22; "Location Code"; Code[10])
        {
            Caption = 'Kod lokalizacji';
            TableRelation = Location;
        }
        field(23; "Scan Error Exist"; Boolean)
        {
            Caption = 'Błąd';
        }
        field(24; "Scan Error Description"; Text[100])
        {
            Caption = 'Opis błędu';
        }
        field(25; "Serial No."; Code[20])
        {
            Caption = 'Nr seryjny';
        }
        field(26; "Lot No."; Code[20])
        {
            Caption = 'Nr partii';
        }
        field(27; "Scan Mode"; Option)
        {
            Caption = 'Tryb skanowania';
            OptionCaption = ' ,EAN,Seria,Partia,EAN+Seria,EAN+Partia';
            OptionMembers = " ",EAN,Serial,Lot,"EAN+Serial","EAN+Lot";
        }
        field(28; "Source Document Updated"; Boolean)
        {
            Caption = 'Zaktualizowany dokument źródłowy';
        }
        field(29; "Source Document Posted"; Boolean)
        {
            Caption = 'Zaksięgowany dokument źródłowy';
        }
        field(30; Inventory; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where ("Item No." = field("Item No."),
                                                                  "Location Code" = field("Location Code"),
                                                                  "Serial No." = field("Serial No.")));
            Caption = 'Stan magazynowy';
            DecimalPlaces = 0:2;
            Editable = false;
            FieldClass = FlowField;
        }
        field(31; "Bin Code"; Code[10])
        {
            Caption = 'Kod pojemnika';
            Description = 'AL.12Jul13';
        }
        field(32; "UserID Change"; Code[20])
        {
            Caption = 'Kod Użytkownika';
        }
        field(33; "Previous Qty"; Decimal)
        {
            Caption = 'Ilość Pierwotna';
        }
        field(34; "Last Change date"; DateTime)
        {
            Caption = 'Data Godz Ostatnia zmiana';
        }
    }

    keys
    {
        key(Key1;"Source ID","User ID","Document Type","Document No.","Item Journal Template","Item Journal Batch","Entry No.")
        {
            Clustered = true;
        }
        key(Key2;"Source ID","Document Type","Document No.","Source Line No.")
        {
            SumIndexFields = Quantity;
        }
        key(Key3;"Document Type","Document No.","Item No.","Unit of Measure Code")
        {
            SumIndexFields = Quantity;
        }
        key(Key4;"Source ID","User ID","Item Journal Template","Item Journal Batch","Entry No.")
        {
        }
        key(Key5;"Document Type","Document No.","Bin Code","Item No.","Unit of Measure Code")
        {
            SumIndexFields = Quantity;
        }
        key(Key6;"Document Type","Document No.","Item No.","Lot No.","Unit of Measure Code")
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }
}

