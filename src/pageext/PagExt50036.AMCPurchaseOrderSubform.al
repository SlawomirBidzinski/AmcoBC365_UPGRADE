pageextension 50036 "AMC Purchase Order Subform" extends "Purchase Order Subform"

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
            field("AMC Drop Shipment"; Rec."Drop Shipment")
            {
                ApplicationArea = All;
            }
            field("AMC Sales Order No."; Rec."Sales Order No.")
            {
                ApplicationArea = All;
            }
            field("AMC Sales Order Line No."; Rec."Sales Order Line No.")
            {
                ApplicationArea = All;
            }
            field("AMC Blanket Order No."; Rec."Blanket Order No.")
            {
                ApplicationArea = All;
            }
            field("AMC Purchase Order Status"; Rec."AMC Purchase Order Status")
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
            field("AMC Quantity Ordered"; Rec."AMC Quantity Ordered")
            {
                ApplicationArea = All;
            }
            field("AMC Value Ordered"; Rec."AMC Value Ordered")
            {
                ApplicationArea = All;
            }
        }
        addafter("Line Amount")
        {
            field(AMCAmount; Rec.Amount)
            {
                ApplicationArea = All;
            }
            field("AMC Amount Including VAT"; Rec."Amount Including VAT")
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

    procedure AMCReceiptRqest()
    var
        PurchaseHeader: Record "Purchase Header";
        ReceiptRqst: Page "Amc Purchase Line List 2";
    begin
        SetCustCode := '';
        CLEAR(ReceiptRqst);

        IF Rec."Buy-from Vendor No." <> '' THEN
            SetCustCode := Rec."Buy-from Vendor No."
        ELSE
            IF PurchaseHeader.GET(Rec."Document Type", Rec."Document No.") THEN
                SetCustCode := PurchaseHeader."Buy-from Vendor No.";

        ReceiptRqst.SetInitForm(SetCustCode, Rec."Document No.", '');
        ReceiptRqst.RUNMODAL();
    end;

    var
        SetCustCode: Code[20];

}
