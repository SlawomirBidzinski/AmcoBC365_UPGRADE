pageextension 50072 "AMC Blanket Purchase Order" extends "Blanket Purchase Order"
{
    layout
    {
        addafter("Order Date")
        {
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

        addlast(General)
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
        modify("Campaign No.")
        {
            Visible = false;
        }
        modify("Responsibility Center")
        {
            Visible = false;
        }
        addafter(General)
        {
            group(AMCNotes)
            {
                Caption = 'Notes';
                field("AMC Purchase Notes"; Rec."AMC Purchase Notes")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}