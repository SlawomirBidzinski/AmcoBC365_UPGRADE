pageextension 50015 "AMC Purchase Return Order" extends "Purchase Return Order"
{
    layout
    {
        addfirst(General)
        {
            field("ITI Nos. Template Code"; Rec."ITI Nos. Template Code")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                begin
                    Rec.LookupITINosTemplateCode(Enum::"Purchase Document Type"::"Return Order");
                end;

                trigger OnValidate()
                begin
                    Rec.ValidateITINosTemplateCode(Enum::"Purchase Document Type"::"Return Order");
                end;
            }
        }
        addafter(Status)
        {
            field("AMC Pay-to Vendor No."; Rec."Pay-to Vendor No.")
            {
                ApplicationArea = All;
            }
            field("AMC VAT Registration No."; Rec."VAT Registration No.")
            {
                ApplicationArea = All;
            }
        }
        modify("Posting Date")
        {
            Visible = true;
            Importance = Standard;

        }
        modify("ITI VAT Settlement Date")
        {
            Visible = true;
            Importance = Standard;
        }
        modify("Campaign No.")
        {
            Visible = false;
        }
    }
}
