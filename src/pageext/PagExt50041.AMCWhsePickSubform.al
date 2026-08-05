pageextension 50041 "AMC Whse. Pick Subform" extends "Whse. Pick Subform"
{
    layout
    {
        addbefore(Control1)
        {
            group(AMCHdr)
            {
                field(AMCDescription; Rec.Description)
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }
                field("AMC Qty per Item"; Rec."AMC Qty per Item")
                {
                    ApplicationArea = All;
                }
                field("AMC Qty per Lot No"; Rec."AMC Qty per Lot No")
                {
                    ApplicationArea = All;
                }
            }
        }
        addlast(Control1)
        {
            field("AMC Qty on Inv"; Rec."AMC Qty on Inv")
            {
                ApplicationArea = All;
                Style = Attention;
            }
            field("AMC Qty on Order"; Rec."AMC Qty on Order")
            {
                ApplicationArea = All;
                Style = Attention;
            }
            field("AMC Qty on Bin"; Rec."AMC Qty on Bin")
            {
                ApplicationArea = All;
                Style = Attention;
            }
            field("AMC Terminal Quantity"; Rec."AMC Terminal Quantity")
            {
                ApplicationArea = All;
                Style = Attention;
            }
        }
        modify("Lot No.")
        {
            Visible = true;
        }
    }
}
