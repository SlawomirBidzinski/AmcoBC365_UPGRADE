tableextension 50045 "AMC Bin" extends Bin
{
    fields
    {
        field(50010; "AMC Ship"; Boolean)
        {
            Caption = 'Ship';
            FieldClass = FlowField;
            CalcFormula = lookup("Bin Type".Ship where(Code = field("Bin Type Code")));
            Editable = false;
        }
    }
}
