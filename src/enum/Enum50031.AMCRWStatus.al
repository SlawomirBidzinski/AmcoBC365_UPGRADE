enum 50031 "AMC RW Status"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }
    value(1; "W trakcie prób")
    {
        Caption = 'W trakcie prób';
    }
    value(2; Zaakceptowana)
    {
        Caption = 'Zaakceptowana';
    }
    value(3; Niezaakceptowana)
    {
        Caption = 'Niezaakceptowana';
    }
}