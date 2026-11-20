pageextension 50084 "AMC Posted Whse. Receipt List" extends "Posted Whse. Receipt List"
{
    layout
    {
        modify("Posting Date")
        {
            Visible = true;
        }
        moveafter("No."; "Posting Date")

        addafter("Posting Date")
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

        modify("Assigned User ID")
        {
            Visible = false;
        }
    }
}