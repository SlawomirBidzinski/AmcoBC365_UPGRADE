pageextension 50016 "AMC Vendor List" extends "Vendor List"
{
    layout
    {
        addlast(Control1)
        {
            field("AMC Certified Supplier"; Rec."AMC Certified Supplier")
            {
                ApplicationArea = All;
            }
            field("AMC Items Supplier"; Rec."AMC Items Supplier")
            {
                ApplicationArea = All;
            }
        }
    }
}
