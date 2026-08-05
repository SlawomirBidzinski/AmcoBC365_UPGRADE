tableextension 50049 "AMC Vendor Ledger Entry" extends "Vendor Ledger Entry"
{
    fields
    {
        field(50001; "AMC Vendor Name"; Text[100])
        {
            FieldClass = FlowField;
            CalcFormula = Lookup(Vendor.Name WHERE("No." = FIELD("Vendor No.")));
            Caption = 'Nazwa Dostawcy';
            Editable = false;
        }
        field(50003; "AMC Reset Payment Transfer"; Boolean)
        {
            Caption = 'Resetuj Transfer Przelewu';
            DataClassification = CustomerContent;
        }
    }

}