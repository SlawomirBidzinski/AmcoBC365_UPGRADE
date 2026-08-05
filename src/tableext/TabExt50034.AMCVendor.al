tableextension 50034 "AMC Vendor" extends Vendor
{
    fields
    {
        field(50001; "AMC Old Vendor Code"; Code[10])
        {
            Caption = 'Old Vendor Code';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC Place of Transport"; Text[30])
        {
            Caption = 'Miejsce Załadunku/Rozładunku';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC Alarm Phone No."; Text[30])
        {
            Caption = 'Alarm Phone No.';
            DataClassification = CustomerContent;
        }
        field(50004; "AMC Set to Export"; Boolean)
        {
            Caption = 'Set to Export';
            DataClassification = CustomerContent;
        }
        field(50005; "AMC Export Date"; Date)
        {
            Caption = 'Data Exportu';
            DataClassification = CustomerContent;
        }
        field(50006; "AMC Export Time"; Time)
        {
            Caption = 'Godz. Exportu';
            DataClassification = CustomerContent;
        }
        field(50007; "AMC Vendor Type"; Enum "AMC Vendor Type")
        {
            Caption = 'Typ Dostawcy';
            DataClassification = CustomerContent;
        }
        field(50020; "AMC RODO Vendor"; Boolean)
        {
            Caption = 'Dostawca RODO';
            DataClassification = CustomerContent;
        }
        field(50021; "AMC RODO Infor. Date"; Date)
        {
            Caption = 'Data Oznacz. RODO';
            DataClassification = CustomerContent;
        }
        field(50022; "AMC RODO Infor. Time"; Time)
        {
            Caption = 'Godz. Oznacz. RODO';
            DataClassification = CustomerContent;
        }
        field(50023; "AMC RODO Infor. Send Time"; Date)
        {
            Caption = 'Wysłanie inform. RODO';
            DataClassification = CustomerContent;
        }
        field(50024; "AMC RODO Email Send"; Text[100])
        {
            Caption = 'Email powiadomienia RODO';
            DataClassification = CustomerContent;
        }
    }
}