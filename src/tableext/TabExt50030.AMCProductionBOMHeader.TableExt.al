tableextension 50030 "AMC Production BOM Header" extends "Production BOM Header"
{
    fields
    {
        
        field(50000; "AMC Total Weight"; Decimal)
        {
            BlankNumbers = BlankZero;
            CalcFormula = sum("Production BOM Line"."Quantity per" where("Production BOM No." = field("No."),
                                                                          "AMC Weight Unit of Measure" = const(true),
                                                                          "Version Code" = const(),
                                                                          "AMC BOM Type" = field("AMC BOM Type")));
            Caption = 'Waga BOMu';
            DecimalPlaces = 0 : 5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001; "AMC BOM Type"; Enum "AMC BOM Type")
        {
            Caption = 'BOM Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50002; "AMC UserID Last Modified"; Code[20])
        {
            Caption = 'Kod Użytkown. ost. modyf.';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC BOM Source"; Code[20])
        {
            Caption = 'Kod BOMu Źródłowego';
            DataClassification = CustomerContent;
            TableRelation = "Production BOM Header";
        }
        field(50004; "AMC Last BOM Update"; DateTime)
        {
            Caption = 'Data Czas ost. aktual.';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC R&D Group Code"; Code[20])
        {
            Caption = 'Kod Grupy R&&D';
            DataClassification = CustomerContent;
            TableRelation = "AMC R&D Group";
        }
        field(50011; "AMC Dozowanie"; Text[100])
        {
            Caption = 'Dozowanie';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC Second UserId Approved"; Code[20])
        {
            Caption = 'Druga Autoryzacja';
            DataClassification = CustomerContent;
        }
        field(50021; "AMC Second Approved"; Boolean)
        {
            Caption = 'Druga Autoryzacja';
            DataClassification = CustomerContent;
        }
        field(50022; "AMC Second Approved Date Time"; DateTime)
        {
            Caption = 'Data Drugiej Autoryzacji';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC Sent Ask For Sec Appr"; Boolean)
        {
            Caption = 'Sent Ask For Sec Appr';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Sent Ask Date Time"; DateTime)
        {
            Caption = 'Sent Ask Date Time';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50025; "AMC Sent Ask User ID"; Code[20])
        {
            Caption = 'Sent Ask User ID';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50050; "AMC Ask for Calculate Date"; DateTime)
        {
            Caption = 'Data Zlecenia Wyceny';
            DataClassification = CustomerContent;
        }
        field(50051; "AMC Ask for Item Calculate"; Boolean)
        {
            Caption = 'Ask for Item Calculate';
            DataClassification = CustomerContent;
        }
        field(50052; "AMC Ask for UserID"; Code[20])
        {
            Caption = 'Ask for UserID';
            DataClassification = CustomerContent;
        }
        field(50053; "AMC Qty Asked"; Integer)
        {
            CalcFormula = count("Production BOM Header" where("AMC Ask for Item Calculate"=const(true)));
            Caption = 'Qty Asked';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50054; "AMC Asked Date"; DateTime)
        {
            Caption = 'Asked Date';
            DataClassification = CustomerContent;
        }
        field(50055; "AMC Calculate Value"; Decimal)
        {
            Caption = 'Wartość Wyceny';
            DataClassification = CustomerContent;
        }
        field(50056; "AMC Calculate Value UserID"; Code[20])
        {
            Caption = 'Użytkownik Wyceniający';
            DataClassification = CustomerContent;
        }
        field(50057; "AMC Calculate Date"; DateTime)
        {
            Caption = 'Data Wyceny';
            DataClassification = CustomerContent;
        }
        field(50058; "AMC Calculating Notes"; Text[100])
        {
            Caption = 'Calculating Notes';
            DataClassification = CustomerContent;
        }
        field(50059; "AMC Update Karagen"; Boolean)
        {
            Caption = 'Update Karagen';
            DataClassification = CustomerContent;
        }
        field(50060; "AMC Set Previous Karagen"; Boolean)
        {
            Caption = 'Set Previous Karagen';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Ogólne Zasady Mieszania"; Boolean)
        {
            Caption = 'Ogólnie przyj. zasada mieszania';
            DataClassification = CustomerContent;
        }
        field(50201; "AMC R&D BOM Code"; Code[20])
        {
            Caption = 'Kod BOM-u R&D';
            DataClassification = CustomerContent;
        }
        field(50202; "AMC Utworzono z BOMu Prod Nr"; Code[20])
        {
            Caption = 'Utworzono z BOMu Prod Nr';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(50203; "AMC Manufact. Calc. Date"; Date)
        {
            Caption = 'Data Szacunkowej Wyceny';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(50204; "AMC Currecny Exchanege Date"; Date)
        {
            Caption = 'Data Kursu Wyceny';
            DataClassification = CustomerContent;
            Editable = true;
        }
        field(50205; "AMC Last Calculated By"; Code[20])
        {
            Caption = 'Ostatnio skalkulowane przez';
            DataClassification = CustomerContent;
        }
        field(50206; "AMC Last Dalculated Date"; DateTime)
        {
            Caption = 'Data ostatniej kalkulacji';
            DataClassification = CustomerContent;
        }
        field(50210; "AMC Item Sold"; Decimal)
        {
            CalcFormula = - sum("Item Ledger Entry".Quantity where("Item No."=field("No."),
                                                                   "Entry Type"=const(Sale)));
            Caption = 'Ilość Sprzedana';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50211; "AMC Item Output"; Decimal)
        {
            CalcFormula = sum("Item Ledger Entry".Quantity where ("Item No."=field("No."),
                                                                  "Entry Type"=const(Output)));
            Caption = 'Ilość Wyprodukowana';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50212; "AMC Item in Production"; Decimal)
        {
            CalcFormula = sum("Production Order".Quantity where ("Source Type"=const(Item),
                                                                 "Source No."=field("No."),
                                                                 Status=const(Released)));
            Caption = 'Ilość w Produkcji';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50213; "AMC Total Cal.Amout"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Calc.Line Amout" where ("Production BOM No."=field("No."),
                                                                             Type=const(Item),
                                                                             "AMC BOM Type"=field("AMC BOM Type")));
            Caption = 'Razem Koszt Wyceny';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50214;"AMC Razem Koszt [PLN]";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Koszt [PLN]" where ("Production BOM No."=field("No."),
                                                                         "AMC BOM Type"=field("AMC BOM Type"),
                                                                         Type=const(Item)));
            Caption = 'Razem Koszt [PLN]';
            FieldClass = FlowField;
        }
        field(50215;"AMC Mnożnik";Decimal)
        {
            Caption = 'Mnożnik';
            DataClassification = CustomerContent;
        }
        field(50216; "AMC TempRec"; Boolean)
        {
            Caption = 'TempRec';
            DataClassification = CustomerContent;
        }
        field(50400;"AMC Białko";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Białko\Recept." where ("Production BOM No."=field("No."),
                                                                          "AMC BOM Type"=const(RiD)));
            Caption = 'Białko';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50401;"AMC Węglowodany";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Węglow.\Recept." where ("Production BOM No."=field("No."),
                                                                           "AMC BOM Type"=const(RiD)));
            Caption = 'Węglowodany';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50402; "AMC Cukry"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Cukry\Recept." where ("Production BOM No."=field("No."),
                                                                        "AMC BOM Type"=const(RiD)));
            Caption = 'Cukry';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50403;"AMC Tłuszcz";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Tłuszcz\Recept." where ("Production BOM No."=field("No."),
                                                                          "AMC BOM Type"=const(RiD)));
            Caption = 'Tłuszcz';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50404;"AMC Kw. tłuszcz. nasycone";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Kw. tłuszcz. nasyc\Recept." where ("Production BOM No."=field("No."),
                                                                                       "AMC BOM Type"=const(RiD)));
            Caption = 'Kw. tłuszcz. nasycone';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50405;"AMC Błonnik";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Błonnik\Recept." where ("Production BOM No."=field("No."),
                                                                          "AMC BOM Type"=const(RiD)));
            Caption = 'Błonnik';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50406;"AMC Sód";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Sód\Recept." where ("Production BOM No."=field("No."),
                                                                      "AMC BOM Type"=const(RiD)));
            Caption = 'Sód';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50407;"AMC Sól";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Sól\Recept." where ("Production BOM No."=field("No."),
                                                                      "AMC BOM Type"=const(RiD)));
            Caption = 'Sól';
            DecimalPlaces = 0:3;
            FieldClass = FlowField;
        }
        field(50408; "AMC Alkoh. wielowod."; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Alkoh. wielowod.\Recept." where ("Production BOM No."=field("No."),
                                                                                     "AMC BOM Type"=const(RiD)));
            Caption = 'Alkoh. wielowod.\Recept.';
            DecimalPlaces = 0:3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50409; "AMC Salatrimy"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Salatrimy\Recept." where ("Production BOM No."=field("No."),
                                                                            "AMC BOM Type"=const(RiD)));
            Caption = 'Salatrimy\Recept.';
            DecimalPlaces = 0:3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50410; "AMC Alkohol (etanol)"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Alkohol (etanol)\Recept." where ("Production BOM No."=field("No."),
                                                                                     "AMC BOM Type"=const(RiD)));
            Caption = 'Alkohol (etanol)\Recept.';
            DecimalPlaces = 0:3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50411; "AMC Kwasy organiczne"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Kwasy organiczne\Recept." where ("Production BOM No."=field("No."),
                                                                                     "AMC BOM Type"=const(RiD)));
            Caption = 'Kwasy organiczne\Recept.';
            DecimalPlaces = 0:3;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50450; "AMC Set Production Item"; Code[20])
        {
            Caption = 'Kod Zapasu';
            TableRelation = Item."No." where ("AMC Item Type"=filter('Wyroby|Półprodukt|Próba'));
            ValidateTableRelation = true;
            DataClassification = CustomerContent;
        }
        field(50451; "AMC Set Production Code"; Code[20])
        {
            Caption = 'Kod BOMu Produkcyjnego';
            TableRelation = "Production BOM Header"."No." where ("AMC BOM Type"=const(Production));
            ValidateTableRelation = false;
            DataClassification = CustomerContent;
        }
        field(50452; "AMC Generate"; Boolean)
        {
            Caption = 'Wygenerowany';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(50453; "AMC Generate User"; Code[20])
        {
            Caption = 'Kod użytkownika generowania';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(50454; "AMC Generate Time"; DateTime)
        {
            Caption = 'Data Czas wygenerowania';
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(50455; "AMC Set Item BOM"; Code[20])
        {
            CalcFormula = lookup(Item."Production BOM No." where ("No."=field("AMC Set Production Item")));
            Caption = 'Przypisanie Kodu BOMu';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50456; "AMC Compare BOM Production"; Code[20])
        {
            Caption = 'Porównianie BOMu Produkcyjnego';
            TableRelation = "Production BOM Header"."No." where ("AMC BOM Type"=const(Production));
            DataClassification = CustomerContent;
        }
        field(50457; "AMC Generated Prod. BOM"; Code[20])
        {
            Caption = 'Wygenerowano BOM Prod';
            Editable = true;
            TableRelation = "Production BOM Header"."No." where ("AMC BOM Type"=const(Production));
            DataClassification = CustomerContent;
        }
        field(50458; "AMC Optimalisation Code"; Code[20])
        {
            Caption = 'Optimalisation Code';
            //FIXME Tabela 5219 a wygląda na niestandard
            //TableRelation = "Optimalisation Header";
            DataClassification = CustomerContent;
        }
    }
    
}