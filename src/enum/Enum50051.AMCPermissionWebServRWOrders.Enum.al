enum 50051 "AMC PermissionWebServRWOrders"
{
    Extensible = false;

    value(0; "No Permite")
    {
        Caption = 'No Permite';
    }
    value(1; "Read Only")
    {
        Caption = 'Read Only';
    }
    value(2; Modify)
    {
        Caption = 'Modify';
    }
    value(3; "Modify and Delete")
    {
        Caption = 'Modify and Delete';
    }
}