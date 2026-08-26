tableextension 50041 "AMC Company Information" extends "Company Information"
{
    fields
    {
        field(50001; "AMC City Adress"; Text[50])
        {
            Caption = 'City Adress';
            DataClassification = CustomerContent;
        }
        field(50002; "AMC ILN"; Code[100])
        {
            Caption = 'ILN';
            DataClassification = CustomerContent;
        }
        field(50003; "AMC BDO"; Code[10])
        {
            Caption = 'BDO';
            DataClassification = CustomerContent;
        }
    }
}