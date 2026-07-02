enum 50049 "AMC Default Scan Mode"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }
    value(1; EAN)
    {
        Caption = 'EAN';
    }
    value(2; Serial)
    {
        Caption = 'Seria';
    }
    value(3; Lot)
    {
        Caption = 'Partia';
    }
    value(4; "EAN+Serial")
    {
        Caption = 'EAN+Seria';
    }
    value(5; "EAN+Lot")
    {
        Caption = 'EAN+Partia';
    }
}