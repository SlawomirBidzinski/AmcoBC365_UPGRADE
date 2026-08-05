enum 50061 "AMC Shipment Type WareShptLine"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }
    value(1; Pallet)
    {
        Caption = 'Pallet';
    }
    value(2; "Guaranty Card")
    {
        Caption = 'Guaranty Card';
    }
    value(3; "Manual Card")
    {
        Caption = 'Manual Card';
    }
}