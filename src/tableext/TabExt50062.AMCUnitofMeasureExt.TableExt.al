tableextension 50062 "AMC Unit of Measure" extends "Unit of Measure"
{
    fields
    {
     field(50000; "AMC Weight Unit of Measure"; Boolean)
        {
            Caption = 'Weight Unit of Measure'; //TODO 'Jednostka wagi';
            Description = 'AL.16Nov12';
            DataClassification = CustomerContent;
        }
        field(50001; "AMC Label Code"; Text[10])
        {
            Caption = 'Label Code'; //TODO 'Kod na etykiecie';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Decimal Quantity"; Decimal)
        {
            BlankZero = true;
            Caption = 'Decimal Quantity'; //TODO 'Ilość';
            DecimalPlaces = 0 : 3;
            Description = 'AL.03Jan12';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Invoice Descr."; Text[10])
        {
            Caption = 'Invoice Descr.';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC EDI Unit of Measure Code"; Text[10])
        {
            Caption = 'EDI Unit of Measure Code'; //TODO 'Jedn. Miary. EDI';
            Description = 'SBi 21May2104';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Unit of measure name ENG"; Text[30])
        {
            Caption = 'Unit of measure name ENG'; //TODO 'Nazwa kodu jedn. Eng.';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Unit Code ENG"; Text[50])
        {
            CalcFormula = Lookup ("Unit of Measure Translation".Description WHERE (Code = FIELD (Code),
                                                                                  "Language Code"=CONST('ENU')));
            Caption = 'Unit Code ENG'; //TODO 'Kod Jedn. w jęz. ang.';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}
