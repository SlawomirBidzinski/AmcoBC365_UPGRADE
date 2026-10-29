enum 50011 "AMC QC Status"
{
    Extensible = true;
    
    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; "3M-Expires")
    {
        Caption = '3M-Expires';
    }
    value(2; Qualified)
    {
        Caption = 'Qualified';
    }
    value(3; Blocked)
    {
        Caption = 'Blocked';
    }
    value(4; Conditional)
    {
        Caption = 'Conditional';
    }
    value(5; "Internal QC")
    {
        Caption = 'Internal QC';
    }
    value(6; Approved)
    {
        Caption = 'Approved';
    }
    value(7; "Pending Approval")
    {
        Caption = 'Pending Approval';
    }
}
