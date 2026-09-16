enum 50074 "AMC Registry Status"
{
    Extensible = true;
    
    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; New)
    {
        Caption = 'New';
    }
    value(2; "Calculation Request")
    {
        Caption = 'Calculation Request';
    }
    value(3; "In Process")
    {
        Caption = 'In Process';
    }
    value(4; "Realised in R&D")
    {
        Caption = 'Realised in R&D';
    }
    value(5; Closed)
    {
        Caption = 'Closed';
    }
    value(6; Finished)
    {
        Caption = 'Finished';
    }
    value(7; Canceled)
    {
        Caption = 'Canceled';
    }
}
