pageextension 50056 "AMC Pos. Sales Shpt. Sub. Ext" extends "Posted Sales Shpt. Subform"
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
            field("AMC Purchase Order No.";Rec."Purchase Order No.")
            {
                ApplicationArea = All;
            }
            field("AMC Purch. Order Line No.";Rec."Purch. Order Line No.")
            {
                ApplicationArea = All;
            }
            field("AMC Unit Price Source";Rec."AMC Unit Price Source")
            {
                ApplicationArea = All;
            }
            field("AMC Unit Price Date From";Rec."AMC Unit Price Date From")
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
            field("AMC Price Currency";Rec."AMC Price Currency")
            {
                ApplicationArea = All;
            }
            field("AMC Currency Unit Price";Rec."AMC Currency Unit Price")
            {
                ApplicationArea = All;
            }
        }
    }
}
