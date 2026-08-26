tableextension 50043 "AMC Return Receipt HeaderExt" extends "Return Receipt Header"
{
    fields
    {
        field(50044; "AMC Customs Invoice"; Boolean)
        {
            Caption = 'Faktura Celna';
            DataClassification = CustomerContent;
        }
        field(50101; "AMC Customer Serach Name"; Code[100])
        {
            CalcFormula = lookup(Customer."Search Name" where("No."=field("Sell-to Customer No.")));
            Caption = 'Nazwa Szukana Nabywcy';
            Editable = false;
            FieldClass = FlowField;
        }
    }
    
}