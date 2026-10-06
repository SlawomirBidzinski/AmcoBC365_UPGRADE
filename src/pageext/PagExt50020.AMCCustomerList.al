pageextension 50020 "AMC Customer List" extends "Customer List"
{
    layout
    {
        moveafter(Name; "Search Name")
        modify("Search Name")
        {
            Visible = True;
        }

        modify("Responsibility Center")
        {
            Visible = False;
        }
        addafter("Search Name")
        {
            field("Bill-to Customer No."; Rec."Bill-to Customer No.")
            {
                ApplicationArea = All;
            }
            field("VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
            field("ITI Internal ID"; Rec."ITI Internal ID")
            {
                ApplicationArea = All;
            }
            field("Payment Method Code"; Rec."Payment Method Code")
            {
                ApplicationArea = All;
            }
        }
        modify("Payment Terms Code")
        {
            Visible = true;
        }

        moveafter("Payment Method Code"; "Payment Terms Code")

        addlast(Control1)
        {
            field("AMC Customer Type"; Rec."AMC Customer Type")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Segment Key"; Rec."AMC Customer Segment Key")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Industry Key"; Rec."AMC Customer Industry Key")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Invoice per Pieces"; Rec."AMC Invoice per Pieces")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC EDI Customer"; Rec."AMC EDI Customer")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Electronic Form Inv. Agr."; Rec."AMC Electronic Form Inv. Agr.")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Invoice e-mail Address"; Rec."AMC Invoice e-mail Address")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Group Code"; Rec."AMC Customer Group Code")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Customer Group name"; Rec."AMC Customer Group name")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Debt Collection Notes"; Rec."AMC Debt Collection Notes")
            {
                ApplicationArea = All;
                ToolTip = ' ';
            }
            field("AMC Sales Resource All"; Rec."AMC Sales Resource All")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Name 1"; Rec."AMC Emergency Name 1")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Phone 1"; Rec."AMC Emergency Phone 1")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency  Email 1"; Rec."AMC Emergency  Email 1")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Name 2"; Rec."AMC Emergency Name 2")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Phone 2"; Rec."AMC Emergency Phone 2")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
            field("AMC Emergency Email 2"; Rec."AMC Emergency Email 2")
            {
                ApplicationArea = All;
                ToolTip = ' ';
                Visible = False;
            }
        }
    }
}