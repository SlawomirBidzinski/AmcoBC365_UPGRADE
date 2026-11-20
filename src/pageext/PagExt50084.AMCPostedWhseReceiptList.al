pageextension 50084 "AMC Posted Whse. Receipt List" extends "Posted Whse. Receipt List"
{
    layout
    {
        modify("Posting Date")
        {
            Visible = true;
        }
        addafter("No.")
        {
            field("AMC Vendor Code"; Rec."AMC Vendor Code")
            {
                ApplicationArea = All;
            }
            field("AMC Vendor Name"; Rec."AMC Vendor Name")
            {
                ApplicationArea = All;
            }

            field("AMC Receipt Type"; Rec."AMC Receipt Type")
            {
                ApplicationArea = All;
            }
            field("AMC PW Transaction"; Rec."AMC PW Transaction")
            {
                ApplicationArea = All;
            }
        }

        moveafter("No."; "Posting Date")

        modify("Assigned User ID")
        {
            Visible = false;
        }
    }
}