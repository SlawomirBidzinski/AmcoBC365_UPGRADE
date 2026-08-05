enum 50059 "AMC Last Order Status Send"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }
    value(1; "Wstępne")
    {
        Caption = 'Wstępne';
    }
    value(2; "Wysłane")
    {
        Caption = 'Wysłane';
    }
    value(3; Potwierdzone)
    {
        Caption = 'Potwierdzone';
    }
    value(4; Zrealizowane)
    {
        Caption = 'Zrealizowane';
    }
    value(5; "Zakończone")
    {
        Caption = 'Zakończone';
    }
    value(6; Anulowane)
    {
        Caption = 'Anulowane';
    }
}