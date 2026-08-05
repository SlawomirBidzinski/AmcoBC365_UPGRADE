pageextension 50034 "AMC Sales Invoice Subform" extends "Sales Invoice Subform"
{
    layout
    {
        addfirst(content)
        {
            field("AMC EDI Order Line No"; Rec."AMC EDI Order Line No")
            {
                ApplicationArea = All;
            }
        }
        addlast(content)
        {
            field("AMC EDI Line Remarks"; Rec."AMC EDI Line Remarks")
            {
                ApplicationArea = All;
            }
            field("AMC Price Currency"; Rec."AMC Price Currency")
            {
                ApplicationArea = All;
            }
            field("AMC Price Exchage Rate"; Rec."AMC Price Exchage Rate")
            {
                ApplicationArea = All;
            }
            field("AMC Currency Unit Price"; Rec."AMC Currency Unit Price")
            {
                ApplicationArea = All;
            }
            field("AMC Document No."; Rec."Document No.")
            {
                ApplicationArea = All;
            }
            field("AMC Line No."; Rec."Line No.")
            {
                ApplicationArea = All;
            }
        }
    }
}
