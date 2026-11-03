enum 50063 "AMC Receipt Type"
{
    Extensible = false;

    value(0; " ")
    {
    }
    value(1; Purchase)
    {
        Caption = 'Purchase';
    }
    value(2; Transfer)
    {
        Caption = 'Transfer';
    }
    value(3; "Sale Return")
    {
        Caption = 'Sale Return';
    }
}