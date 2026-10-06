pageextension 50016 "AMC Vendor List" extends "Vendor List"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }

        modify("Phone No.")
        {
            Visible = false;
        }

        modify("Location Code")
        {
            ApplicationArea = All;
            Visible = true;
        }
        modify("Currency Code")
        {
            ApplicationArea = All;
            Visible = true;
        }
        addafter("No.")
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
        modify("Name 2")
        {
            Visible = true;
        }
        moveafter("Name 2"; "Search Name")

        addafter("Search Name")
        {
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
        }
        moveafter("VAT Registration No."; "Location Code")
        modify("Gen. Bus. Posting Group")
        {
            Visible = true;
        }
        modify("Vendor Posting Group")
        {
            Visible = true;
        }
        modify("VAT Bus. Posting Group")
        {
            Visible = true;
        }
    }
}
