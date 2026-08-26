pageextension 50061 "AMC Posted Purch. Inv. Sub, Ex" extends "Posted Purch. Invoice Subform"
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
        addafter(Quantity)
        {
            field("AMC Init Quantity"; Rec."AMC Init Quantity")
            {
                ApplicationArea = All;
            }
        }
        addafter("Direct Unit Cost")
        {
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
        }
        modify("Tax Area Code")
        {
            Visible = false;
        }
        modify("Tax Group Code")
        {
            Visible = false;
        }
    }
}
