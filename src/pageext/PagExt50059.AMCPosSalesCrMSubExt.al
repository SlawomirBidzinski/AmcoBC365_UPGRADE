pageextension 50059 "AMC Pos. Sales Cr. M. Sub. Ext" extends "Posted Sales Cr. Memo Subform"
{
        layout
    {
        addfirst(Control1)
        {
            field("AMC EDI Order Line No"; Rec."AMC EDI Order Line No")
            {
                ApplicationArea = All;
            }
        }
        addlast(Control1)
        {
            field("AMC EDI Line Remarks"; Rec."AMC EDI Line Remarks")
            {
                ApplicationArea = All;
            }
            field("AMCVAT Prod. Posting Group";Rec."VAT Prod. Posting Group")
            {
                ApplicationArea = All;
            }
            field("AMC Purchasing Code";Rec."Purchasing Code")
            {
                ApplicationArea = All;
            }
            field("AMC Unit Price Source";Rec."AMC Unit Price Source")
            {
                ApplicationArea = All;
            }
            field("AMC Pack Quantity";Rec."AMC Pack Quantity")
            {
                ApplicationArea = All;
            }
            field("AMC Qty of Pieces";Rec."AMC Qty of Pieces")
            {
                ApplicationArea = All;
            }
            field("AMC Piece Unit Price";Rec."AMC Piece Unit Price")
            {
                ApplicationArea = All;
            }
            field("AMC Init Quantity";Rec."AMC Init Quantity")
            {
                ApplicationArea = All;
            }
            field(AMCAmount;Rec.Amount)
            {
                ApplicationArea = All;
            }
            field("AMCAmount Including VAT";Rec."Amount Including VAT")
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
