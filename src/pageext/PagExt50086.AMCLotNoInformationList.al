pageextension 50086 "AMC Lot No. Information List" extends "Lot No. Information List"
{
    layout
    {
        addlast(Control1)
        {
            field("AMC Bin Inventory"; Rec."AMC Bin Inventory")
            {
                ApplicationArea = All;
            }
            field("AMC Expiration Date"; Rec."AMC Expiration Date")
            {
                ApplicationArea = All;
            }
            field("AMC Ext. Lot No."; Rec."AMC Ext. Lot No.")
            {
                ApplicationArea = All;
            }
            field("AMC Pack Quantity"; Rec."AMC Pack Quantity")
            {
                ApplicationArea = All;
            }
            field("AMC Pack Unit of Measure"; Rec."AMC Pack Unit of Measure")
            {
                ApplicationArea = All;
            }
            field("AMC Pick Quantity (Base)"; Rec."AMC Pick Quantity (Base)")
            {
                ApplicationArea = All;
            }
            field("AMC QC Status"; Rec."AMC QC Status")
            {
                ApplicationArea = All;
            }
            field("AMC Receipt Date"; Rec."AMC Receipt Date")
            {
                ApplicationArea = All;
            }
            field("AMC Search Vendor Name"; Rec."AMC Search Vendor Name")
            {
                ApplicationArea = All;
            }
        }
    }
}
