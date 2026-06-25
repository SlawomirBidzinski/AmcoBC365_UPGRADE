tableextension 50031 "AMC Production BOM Line" extends "Production BOM Line"
{
    fields
    {
        field(50000; "AMC Weight Unit of Measure"; Boolean)
        {
            Caption = 'Jednostka wagi';
            Description = 'AL.16Nov12';
            DataClassification = CustomerContent;
        }
        field(50001; "AMC BOM Type"; Option)
        {
            Caption = 'BOM Type';
            Editable = false;
            OptionCaption = 'Production,RiD';
            OptionMembers = Production,RiD;
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Direct Unit Cost [PLN/kg]"; Decimal)
        {
            Caption = 'Cena zakupu [PLN/kg]';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Doza [kg]"; Decimal)
        {
            Caption = 'Doza [kg]';
            DecimalPlaces = 3 : 5;
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Udział [%]"; Decimal)
        {
            Caption = 'Udział [%]';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Koszt [PLN]"; Decimal)
        {
            Caption = 'Koszt [PLN]';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Koszt Wymuszony"; Boolean)
        {
            Caption = 'Koszt Wymuszony';
            DataClassification = CustomerContent;
        }
        field(50008; "AMC Koszt Źródłowy"; Decimal)
        {
            Caption = 'Koszt Źródłowy';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50009; "AMC Additional Purch. Cost"; Decimal)
        {
            Caption = 'Dodatkowy Koszt Zakupu';
            DataClassification = CustomerContent;
        }
        field(50010; "AMC Last Direct Item Cost"; Decimal)
        {
            CalcFormula = lookup(Item."Last Direct Cost" where("No."=field("No.")));
            Caption = 'Ostatni Koszt Bezpośredni';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50011; "AMC BOM Source"; Code[20])
        {
            Caption = 'Kod BOMu Źródłowego';
            TableRelation = "Production BOM Header";
            DataClassification = CustomerContent;
        }
        field(50012; "AMC Last BOM Update"; DateTime)
        {
            Caption = 'Data Czas ost. aktual.';
            DataClassification = CustomerContent;

        }
        field(50013; "AMC UserID UserUpdate"; Code[20])
        {
            Caption = 'Kod Użytk. ost. aktual.';
            TableRelation = User;
            DataClassification = CustomerContent;
        }
        field(50014; "AMC Calculation Unit Cost"; Decimal)
        {
            Caption = 'Cena Kalkulacyjna [PLN/kg]';
            DataClassification = CustomerContent;
        }
        field(50015; "AMC Item Budget Code"; Code[20])
        {
            Caption = 'Instancja Budżetu';
            TableRelation = "AMC Item Budget Instance";
            DataClassification = CustomerContent;
        }
        field(50016; "AMC Calculation Value"; Decimal)
        {
            Caption = 'Wartość Kalkulacyjna';
            DecimalPlaces = 4:4;
            DataClassification = CustomerContent;
        }
        field(50017; "AMC Calcualtion Date"; DateTime)
        {
            Caption = 'Data Wyceny Kalk.';
            DataClassification = CustomerContent;
        }
        field(50018; "AMC Real Price"; Boolean)
        {
            Caption = 'Wycena Rzeczywista';
            DataClassification = CustomerContent;
        }
        field(50020;"AMC Ustawienie Mnożnika";Decimal)
        {
            Caption = 'Ustawienie Mnożnika';
            DataClassification = CustomerContent;
        }
        field(50021;"AMC Mnożnik";Decimal)
        {
            Caption = 'Mnożnik';
            DataClassification = CustomerContent;
        }
        field(50022;"AMC Wartość wg Mnożnika";Decimal)
        {
            Caption = 'Wartość wg Mnożnika';
            DataClassification = CustomerContent;
        }
        field(50023;"AMC Wskaźnik receptury";Decimal)
        {
            BlankZero = true;
            Caption = 'Wskaźnik receptury';
            DecimalPlaces = 5:5;
            DataClassification = CustomerContent;
        }
        field(50024; "AMC Component Source"; Text[60])
        {
            Caption = 'Komponent Źródłowy';
            DataClassification = CustomerContent;
        }
        field(50030; "AMC Calc. Unit Prce"; Decimal)
        {
            Caption = 'Cena Jedn. Cennika';
            DataClassification = CustomerContent;
        }
        field(50031; "AMC Calc. Currency"; Code[20])
        {
            Caption = 'Kod Waluty Cennika';
            TableRelation = Currency;
            DataClassification = CustomerContent;
        }
        field(50032; "AMC Calc. Curenncy Date"; Date)
        {
            Caption = 'Data Kursu Wyceny';
            DataClassification = CustomerContent;
        }
        field(50033; "AMC Calc. Exchange Rate"; Decimal)
        {
            Caption = 'Kurs Wyceny';
            DataClassification = CustomerContent;
        }
        field(50034; "AMC Calc. Unit Price PLN"; Decimal)
        {
            Caption = 'Cena Jedn. [PLN]';
            DataClassification = CustomerContent;
        }
        field(50035; "AMC Calc.Line Amout"; Decimal)
        {
            Caption = 'Kwota Wiersza [PLN]';
            DataClassification = CustomerContent;
        }
        field(50036; "AMC Cals Change Price %"; Decimal)
        {
            Caption = 'Zmiana Ceny Jedn. [%]';
            DataClassification = CustomerContent;
        }
        field(50037; "AMC Purchase Calc. Price"; Boolean)
        {
            Caption = 'Wycena wg. cennika';
            DataClassification = CustomerContent;
        }
        field(50040; "AMC Total Cal.Amout"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Calc.Line Amout" where ("Production BOM No."=field("Production BOM No."),
                                                                             Type=const(Item),
                                                                             "AMC BOM Type"=field("AMC BOM Type")));
            Caption = 'Razem Koszt Wyceny';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50050;"AMC Razem Udział [%]";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Udział [%]" where ("Production BOM No."=field("Production BOM No."),
                                                                        "AMC BOM Type"=field("AMC BOM Type")));
            Caption = 'Razem Udział [%]';
            FieldClass = FlowField;
        }
        field(50051;"AMC Razem wg Mnożnika";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Wartość wg Mnożnika" where ("Production BOM No."=field("Production BOM No."),
                                                                                 "AMC BOM Type"=field("AMC BOM Type")));
            Caption = 'Razem wg Mnożnika';
            FieldClass = FlowField;
        }
        field(50052;"AMC Razem Koszt [PLN]";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Koszt [PLN]" where ("Production BOM No."=field("Production BOM No."),
                                                                         "AMC BOM Type"=field("AMC BOM Type"),
                                                                         Type=const(Item)));
            Caption = 'Razem Koszt [PLN]';
            FieldClass = FlowField;
        }
        field(50053;"AMC Razem Doza [kg]";Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Doza [kg]" where ("Production BOM No."=field("Production BOM No."),
                                                                       "AMC BOM Type"=field("AMC BOM Type")));
            Caption = 'Razem Doza [kg]';
            FieldClass = FlowField;
        }
        field(50054; "AMC Total Item Calc. Value"; Decimal)
        {
            CalcFormula = sum("Production BOM Line"."AMC Calculation Value" where ("Production BOM No."=field("Production BOM No."),
                                                                               "AMC BOM Type"=field("AMC BOM Type"),
                                                                               Type=const(Item)));
            Caption = 'Razem Koszt Kalkulacji';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50060;"AMC Zalecana Kolejność Miesz.";Integer)
        {
            Caption = 'Zalecana Kolejność Mieszania';
            DataClassification = CustomerContent;
        }
        field(50065; "AMC Set Item Update"; Boolean)
        {
            Caption = 'Oznacz do Aktualiacji';
            DataClassification = CustomerContent;
        }
        field(50066; "AMC Document Update Filter"; Code[20])
        {
            Caption = 'Filtr Dokumentu Aktualizacji';
            FieldClass = FlowFilter;
            TableRelation = "AMC Update BOM Document Header";
        }
        field(50100;"AMC Białko\Sur.";Decimal)
        {
            Caption = 'Białko\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50101;"AMC Węglow. Sur";Decimal)
        {
            Caption = 'Węglow. Sur';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50102;"AMC Cukry\Sur.";Decimal)
        {
            Caption = 'Cukry\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50103;"AMC Tłuszcz\Sur.";Decimal)
        {
            Caption = 'Tłuszcz\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50104;"AMC Kw. tłuszcz. nasyc\Sur.";Decimal)
        {
            Caption = 'Kw. tłuszcz. nasyc\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50105;"AMC Błonnik\Sur.";Decimal)
        {
            Caption = 'Błonnik\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50106;"AMC Sód\Sur.";Decimal)
        {
            Caption = 'Sód\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50107;"AMC Sól\Sur.";Decimal)
        {
            Caption = 'Sól\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50110;"AMC Białko\Recept.";Decimal)
        {
            Caption = 'Białko\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50111;"AMC Węglow.\Recept.";Decimal)
        {
            Caption = 'Węglow.\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50112;"AMC Cukry\Recept.";Decimal)
        {
            Caption = 'Cukry\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50113;"AMC Tłuszcz\Recept.";Decimal)
        {
            Caption = 'Tłuszcz\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50114;"AMC Kw. tłuszcz. nasyc\Recept.";Decimal)
        {
            Caption = 'Kw. tłuszcz. nasyc\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50115;"AMC Błonnik\Recept.";Decimal)
        {
            Caption = 'Błonnik\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50116;"AMC Sód\Recept.";Decimal)
        {
            Caption = 'Sód\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50117;"AMC Sól\Recept.";Decimal)
        {
            Caption = 'Sól\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50120;"AMC Alkoh. wielowod.\Sur.";Decimal)
        {
            Caption = 'Alkoh. wielowod.\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50121;"AMC Salatrimy\Sur.";Decimal)
        {
            Caption = 'Salatrimy\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50122; "AMC Alkohol (etanol)\Sur.";Decimal)
        {
            Caption = 'Alkohol (etanol)\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50123;"AMC Kwasy organiczne\Sur.";Decimal)
        {
            Caption = 'Kwasy organiczne\Sur.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50140;"AMC Alkoh. wielowod.\Recept.";Decimal)
        {
            Caption = 'Alkoh. wielowod.\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50141;"AMC Salatrimy\Recept.";Decimal)
        {
            Caption = 'Salatrimy\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50142; "AMC Alkohol (etanol)\Recept.";Decimal)
        {
            Caption = 'Alkohol (etanol)\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50143;"AMC Kwasy organiczne\Recept.";Decimal)
        {
            Caption = 'Kwasy organiczne\Recept.';
            DecimalPlaces = 0:3;
            DataClassification = CustomerContent;
        }
        field(50150; "AMC RiD BOM Code Filter"; Code[20])
        {
            Caption = 'Filtr BOMu RiD';
            Editable = false;
            FieldClass = FlowFilter;
        }
        field(50151; "AMC RiD BOM Item Code Qty"; Decimal)
        {
            CalcFormula = sum("Production BOM Line".Quantity where ("Production BOM No."=field("AMC RiD BOM Code Filter"),
                                                                    "AMC BOM Type"=const(RiD),
                                                                    Type=const(Item),
                                                                    "No."=field("No.")));
            Caption = 'Ilość Zapasu BOMu RiD';
            DecimalPlaces = 0:5;
            Editable = false;
            FieldClass = FlowField;
        }
        field(50152; "AMC Packege"; Boolean)
        {
            CalcFormula = exist(Item where ("No."=field("No."),
                                            "AMC Item Type"=const(Opakowania)));
            Caption = 'Opakowanie';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    
    
}