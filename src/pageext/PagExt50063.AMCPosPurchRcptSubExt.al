pageextension 50063 "AMC Pos. Purch. Rcpt. Sub. Ext" extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter(Description)
        {
            field(AMCVATProdPostingGroup; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
        }
        addafter("Location Code")
        {
            field("AMC Sales Order No.";Rec."Sales Order No.")
            {
                ApplicationArea = All;
            }
            field("AMC Sales Order Line No.";Rec."Sales Order Line No.")
            {
                ApplicationArea = All;
            }
            field("AMC Blanket Order No.";Rec."Blanket Order No.")
            {
                ApplicationArea = All;
            }
            field("AMC Init Quantity";Rec."AMC Init Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
