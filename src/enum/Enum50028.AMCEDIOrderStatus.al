enum 50028 "AMC EDI Order Status"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }
    value(1; Imported)
    {
        Caption = 'Imported';
    }
    value(2; Approved)
    {
        Caption = 'Approved';
    }
}