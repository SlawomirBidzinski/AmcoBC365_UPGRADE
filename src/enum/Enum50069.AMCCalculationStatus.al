enum 50069 "AMC Calculation Status"
{
    Extensible = true;
    
    value(0; New)
    {
        Caption = 'New';
    }
    value(1; Ordered)
    {
        Caption = 'Ordered';
    }
    value(2; "In Process")
    {
        Caption = 'In Process';
    }
    value(3; Finished)
    {
        Caption = 'Finished';
    }
    value(4; Canceled)
    {
        Caption = 'Canceled';
    }
}
