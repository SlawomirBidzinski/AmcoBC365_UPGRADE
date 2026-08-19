tableextension 50038 "AMC ITI Sales Doc. Nos. Temp." extends "ITI Sales Doc. Nos. Template"
{
    fields
    {
        field(50000; "AMC RW Transaction"; Boolean)
        {
            Caption = 'Rozliczenie RW';
            DataClassification = CustomerContent;
        }
        field(50001; "AMC RW Transaction Type"; Enum "AMC RW Transaction Type")
        {
            Caption = 'Typ Rozliczenia RW';
            DataClassification = CustomerContent;
        }
    }
}
