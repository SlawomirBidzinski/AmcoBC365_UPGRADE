pageextension 50073 "AMC Blanket Purchase Orders" extends "Blanket Purchase Orders"
{
    layout
    {
        addafter("Buy-from Vendor Name")
        {
            field("Order Date"; Rec."Order Date")
            {
                ApplicationArea = All;
            }
            field("AMC Contract Date"; Rec."AMC Contract Date")
            {
                ApplicationArea = All;
            }
            field("AMC Purchase Order Status"; Rec."AMC Purchase Order Status")
            {
                ApplicationArea = All;
            }
            field("AMC Approved Date"; Rec."AMC Approved Date")
            {
                ApplicationArea = All;
            }
        }
        addafter("Status")
        {
            field("AMC Create by IdUser"; Rec."AMC Create by IdUser")
            {
                ApplicationArea = All;
            }

            field("AMC Creation Date"; Rec."AMC Creation Date")
            {
                ApplicationArea = All;
            }
        }

        modify("Assigned User ID")
        {
            Visible = false;
        }
    }
}