tableextension 50027 "AMC Item Translation" extends "Item Translation"
{
    fields
    {
        field(50001; "AMC English Long Description"; Text[100])
        {
            Caption = 'English Long Description';
            DataClassification = CustomerContent;
        }
    }
    
}