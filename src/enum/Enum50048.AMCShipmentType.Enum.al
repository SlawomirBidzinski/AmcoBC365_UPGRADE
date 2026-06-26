enum 50048 "AMC Shipment Type"
{
    Extensible = false;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }
    value(1; Sales)
    {
        Caption = 'Sales';
    }
    value(2; Transfer)
    {
        Caption = 'Transfer';
    }
    value(3; Trial)
    {
        Caption = 'Trial';
    }
    value(4; "Purchase Return")
    {
        Caption = 'Purchase Return';
    }
}