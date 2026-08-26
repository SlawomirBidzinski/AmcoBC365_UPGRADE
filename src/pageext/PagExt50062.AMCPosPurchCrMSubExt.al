pageextension 50062 "AMC Pos. Purch. Cr. M. Sub Ext" extends "Posted Purch. Cr. Memo Subform"
{
    layout
    {
        addafter(Description)
        {
            field(AMCVATProdPostingGroup; Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field(AMCAmount; Rec.Amount)
            {
                ApplicationArea = All;
            }
            field("AMC Amount Including VAT"; Rec."Amount Including VAT")
            {
                ApplicationArea = All;
            }
            field("AMC Blanket Order No."; Rec."Blanket Order No.")
            {
                ApplicationArea = All;
            }
            field("AMC Init Quantity"; Rec."AMC Init Quantity")
            {
                ApplicationArea = All;
            }
        }
    }
}
