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
        addafter("No.")
        {
            field("AMC Contract Date"; Rec."AMC Contract Date")
            {
                ApplicationArea = All;
            }
        }
    }
}
