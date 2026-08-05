pageextension 50030 "AMC Sales Order List" extends "Sales Order List"
{

    layout
    {
        moveafter("Amount Including VAT"; "Currency Code")
        modify("Currency Code")
        {
            Visible = True;
        }
    }
}
