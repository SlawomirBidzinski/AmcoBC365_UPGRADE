tableextension 50024 "AMC Ship-to AddressExt" extends "Ship-to Address"
{
    fields
    {
        field(50001; "AMC ILN Code"; Code[20])
        {
            Caption = 'ILN Code';
            DataClassification = CustomerContent;
        }
    }
    
}